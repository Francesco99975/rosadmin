import 'dart:convert';

import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

part 'socket.g.dart';

@Riverpod(keepAlive: true)
class Socket extends _$Socket {
  @override
  SocketChannel build() {
    return SocketChannel();
  }
}

class SocketChannel {
  Option<WebSocketChannel> _channel;

  SocketChannel() : _channel = const Option<WebSocketChannel>.none();

  void init() {
    if (_channel.isNone()) {
      _channel = Option.of(
          WebSocketChannel.connect(Uri.parse("ws://localhost:8078/ws")));
    }

    _channel.match(
        () => null,
        (channel) => {
              channel.stream.listen((message) {
                // Check if the message is a ping
                if (message == 'ping') {
                  // Respond with a pong
                  channel.sink.add('pong');
                }
              }, onDone: () {
                print("Done");
              }, onError: (error) {
                print(error);
              })
            });
  }

  void authenticate(String otp) {
    _channel.match(
        () => null,
        (channel) => {
              channel.sink.add(jsonEncode({
                "type": "authadmin",
                "payload": {"otp": otp}
              }))
            });
  }

  void close() {
    _channel.match(() => null, (channel) => channel.sink.close());
  }
}
