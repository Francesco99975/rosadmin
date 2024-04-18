import 'dart:convert';

import 'package:fpdart/fpdart.dart';
import 'package:rosadmin/constants/endpoints.dart';
import 'package:rosadmin/helpers/failure.dart';
import 'package:rosadmin/helpers/network.dart';
import 'package:rosadmin/helpers/types.dart';
import 'package:rosadmin/models/user.dart';

class AuthRepo {
  static FutureEither<Login> login(
      String email, String password, NetworkRepo network) async {
    try {
      final result = await network.postRequest(
          url: Endpoints.loginEndpoint,
          body: {"email": email, "password": password},
          requireAuth: false);

      return switch (result) {
        Left(value: final l) => Left(Failure(message: l.message)),
        Right(value: final r) => r.statusCode >= 400
            ? Left(Failure(message: String.fromCharCodes(r.bodyBytes)))
            : Right(Login.fromMap(jsonDecode(r.body) as Map<String, dynamic>))
      };
    } catch (e, stktrc) {
      print(stktrc.toString());
      return Left(Failure(
          message: "Could not Login: ${e.toString()}", stackTrace: stktrc));
    }
  }
}
