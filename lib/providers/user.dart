import 'dart:convert';

import 'package:http/http.dart';
import 'package:option_result/option_result.dart' as rs;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rosadmin/constants/endpoints.dart';
import 'package:rosadmin/models/user.dart';
import 'package:rosadmin/providers/socket.dart';
import 'package:rosadmin/providers/storage.dart';

part 'user.g.dart';

@riverpod
class Userx extends _$Userx {
  @override
  Future<rs.Option<User>> build() async {
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
          return const rs.None<User>();
        }

        final check = jsonDecode(response.body);

        if (!check["valid"]) {
          return const rs.None<User>();
        }

        socket.authenticate(check["otp"]);

        return rs.Some<User>(user);
      } catch (e) {
        return const rs.None<User>();
      }
    } else {
      return const rs.None<User>();
    }
  }

  Future<void> setUser(User user, String otp) async {
    final storage = ref.read(storageProvider);
    await storage.write(key: "USER", value: user.toJson());

    final socket = ref.read(socketProvider);
    socket.authenticate(otp);

    state = AsyncData(rs.Some<User>(user));
  }

  Future<void> logout() async {
    final socket = ref.read(socketProvider);
    socket.close();
    final storage = ref.read(storageProvider);
    await storage.delete(key: "USER");
    state = const AsyncData(rs.None<User>());
  }
}
