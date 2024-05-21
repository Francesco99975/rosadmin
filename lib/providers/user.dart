import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rosadmin/constants/endpoints.dart';
import 'package:rosadmin/helpers/failure.dart';
import 'package:rosadmin/models/user.dart';
import 'package:rosadmin/providers/socket.dart';
import 'package:rosadmin/providers/storage.dart';

part 'user.g.dart';

@Riverpod(keepAlive: true)
class Userx extends _$Userx {
  @override
  Future<Either<Failure, User>> build() async {
    final storage = ref.read(storageProvider);
    final userJson = await storage.read(key: "USER");
    final socket = ref.read(socketProvider);
    socket.init();
    if (userJson != null) {
      final user = User.fromJson(userJson);

      final Map<String, String> requestHeaders = {
        "Content-Type": "application/json",
      };

      try {
        final response = await post(Uri.parse(Endpoints.tokenCheck),
            body: jsonEncode({"token": user.token}), headers: requestHeaders);

        if (response.statusCode >= 400) {
          final error = jsonDecode(response.body);
          if (kDebugMode) {
            print("HTTP error: ${error["message"]}");
          }
          return Left(Failure(message: "Session Expired"));
        }

        final check = jsonDecode(response.body);

        if (!check["valid"]) {
          return Left(Failure(message: "Token not valid"));
        }

        socket.authenticate(check["otp"]);

        return Right(user);
      } catch (e, stktrc) {
        return Left(Failure(message: e.toString(), stackTrace: stktrc));
      }
    } else {
      return Left(Failure(message: "User not found"));
    }
  }

  Future<void> setUser(User user, String otp) async {
    final storage = ref.read(storageProvider);
    await storage.write(key: "USER", value: user.toJson());

    final socket = ref.read(socketProvider);
    socket.authenticate(otp);

    state = AsyncValue.data(Right(user));
  }

  Future<void> logout() async {
    final socket = ref.read(socketProvider);
    socket.close();
    final storage = ref.read(storageProvider);
    await storage.delete(key: "USER");
    state = AsyncValue.data(Left(Failure(message: "logged out...")));
  }
}
