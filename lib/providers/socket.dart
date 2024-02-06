import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

part 'socket.g.dart';

@riverpod
WebSocketChannel socket(SocketRef ref) {
  return WebSocketChannel.connect(Uri.parse("ws:/loclhost:8078/ws"));
}
