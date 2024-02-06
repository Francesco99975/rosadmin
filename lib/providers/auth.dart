import 'dart:convert';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rosadmin/constants/endpoints.dart';
import 'package:rosadmin/helpers/network.dart';
import 'package:rosadmin/models/user.dart';
import 'package:rosadmin/providers/socket.dart';
import 'package:rosadmin/providers/user.dart';

part 'auth.g.dart';

@riverpod
Future<void> login(LoginRef ref) async {
  final network = ref.read(networkProvider);
  final result = await network.postRequest(
      url: Endpoints.loginEndpoint, body: , requireAuth: false);

  if (result.isRight()) {
    result.getRight().match(() => {throw Exception("Could not login")},
        (t) async {
      final json = jsonDecode(t.body) as Map<String, dynamic>;

      final data = Login.fromMap(json);

      final userx = ref.read(userxProvider.notifier);

      await userx.setUser(User(
          id: data.user.id,
          username: data.user.username,
          email: data.user.email,
          role: data.user.role,
          token: data.token));

      final socket = ref.read(socketProvider);

      socket.sink.add({"type": "admin", "payload": ""});
    });
  }

  throw Exception("Could not login");
}

@riverpod
Future<void> logout(LogoutRef ref) async {
  final userx = ref.read(userxProvider.notifier);
  final socket = ref.read(socketProvider);

  await userx.clear();
  socket.sink.close();
}
