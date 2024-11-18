import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter_foreground_task/flutter_foreground_task.dart';
import 'package:fpdart/fpdart.dart';
import 'package:rosadmin/constants/endpoints.dart';
import 'package:rosadmin/helpers/failure.dart';
import 'package:rosadmin/helpers/network.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'notification_service.dart';

bool _isStartingForegroundTask =
    false; // Internal lock to prevent concurrent execution

@pragma('vm:entry-point')
Future<Either<Failure, void>> startCallback(NetworkRepo network) async {
  if (!Platform.isAndroid && !Platform.isIOS) {
    return Left(Failure(
        message:
            "Platform not compatible")); // Plugin only works on mobile platforms
  }
  if (_isStartingForegroundTask) {
    // Prevent concurrent execution
    debugPrint("Foreground task is already being initialized.");
    return Left(
        Failure(message: "Foreground task is already being initialized."));
  }

  _isStartingForegroundTask = true;

  try {
    final isRunning = await FlutterForegroundTask.isRunningService;

    if (isRunning) {
      // If service is already running, return success without starting another instance
      debugPrint("Gotify WebSocket Service is already running.");
      return Right(null);
    }

    // Create and start the foreground task handler
    debugPrint("Starting Gotify WebSocket Service...");
    final handlerResult = await GotifyWebSocketService.create(network);
    return handlerResult.match(
      (failure) => Left(failure),
      (service) => Right(FlutterForegroundTask.setTaskHandler(service)),
    );
  } catch (e, stackTrace) {
    debugPrint("Error starting Gotify WebSocket Service: $e");
    return Left(Failure(message: e.toString(), stackTrace: stackTrace));
  } finally {
    _isStartingForegroundTask = false; // Release the lock
  }
}

class GotifyWebSocketService extends TaskHandler {
  late final String gotifyUrl;
  late final String appToken;

  late WebSocketChannel _channel;

  GotifyWebSocketService._internal(this.gotifyUrl, this.appToken);

  // Factory constructor for async initialization
  static Future<Either<Failure, GotifyWebSocketService>> create(
      NetworkRepo network) async {
    final config = await _fetchConfigFromServer(network);
    return config.match(
      (l) => Left(l),
      (config) => Right(
          GotifyWebSocketService._internal(config['url']!, config['token']!)),
    );
  }

  static Future<Either<Failure, Map<String, String>>> _fetchConfigFromServer(
      NetworkRepo network) async {
    final response = await network.getRequest(
        url: Endpoints.notifEndnpoint, requireAuth: true);

    return response.match((l) => Left(l), (response) {
      final data = jsonDecode(response.body) as Map<String, String>;
      return Right(data);
    });
  }

  void connect() {
    _channel =
        WebSocketChannel.connect(Uri.parse('$gotifyUrl?token=$appToken'));

    _channel.stream.listen(
      (message) {
        final decodedMessage = jsonDecode(message);
        NotificationService.showNotification(
          id: decodedMessage['id'],
          title: decodedMessage['title'],
          body: decodedMessage['message'],
          icon: decodedMessage['extras']?['client::display']?['content']
              ?['icon'],
          sound: decodedMessage['extras']?['client::display']?['content']
              ?['sound'],
        );
      },
      onError: (error) {
        if (kDebugMode) {
          print("WebSocket error: $error");
        }
        reconnect();
      },
      onDone: () {
        if (kDebugMode) {
          print("WebSocket connection closed");
        }
        reconnect();
      },
    );
  }

  void disconnect() {
    _channel.sink.close();
  }

  void reconnect() {
    Future.delayed(const Duration(seconds: 5), connect);
  }

  @override
  Future<void> onDestroy(DateTime timestamp) async {
    disconnect();
  }

  @override
  Future<void> onStart(DateTime timestamp, TaskStarter starter) async {
    connect();
  }

  @override
  void onRepeatEvent(DateTime timestamp) {}
}
