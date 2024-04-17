import 'dart:convert';

import 'package:fpdart/fpdart.dart';
import 'package:rosadmin/constants/endpoints.dart';
import 'package:rosadmin/helpers/failure.dart';
import 'package:rosadmin/helpers/network.dart';
import 'package:rosadmin/helpers/types.dart';
import 'package:rosadmin/models/user.dart';

class AuthRepo {
  FutureEither<Login> login(
      String email, String password, NetworkRepo network) async {
    try {
      final result = await network.postRequest(
          url: Endpoints.loginEndpoint,
          body: {email, password},
          requireAuth: false);

      if (result.isRight()) {
        result.getRight().match(
            () => {Left(Failure(message: "Could not Login"))}, (t) async {
          final json = jsonDecode(t.body) as Map<String, dynamic>;

          return Login.fromMap(json);

          // final userx = ref.read(userxProvider.notifier);

          // await userx.setUser(User(
          //     id: data.user.id,
          //     username: data.user.username,
          //     email: data.user.email,
          //     role: data.user.role,
          //     token: data.token));
        });
      }

      return Left(Failure(message: "Could not Login"));
    } catch (e, stktrc) {
      return Left(Failure(message: "Could not Login", stackTrace: stktrc));
    }
  }
}
