import 'package:option_result/option_result.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rosadmin/models/user.dart';
import 'package:rosadmin/providers/socket.dart';
import 'package:rosadmin/providers/storage.dart';

part 'user.g.dart';

@riverpod
class Userx extends _$Userx {
  @override
  Future<Option<User>> build() async {
    final storage = ref.read(storageProvider);
    final userJson = await storage.read(key: "USER");
    if (userJson != null) {
      return Some<User>(User.fromJson(userJson));
    } else {
      return const None<User>();
    }
  }

  Future<void> setUser(User user) async {
    final storage = ref.read(storageProvider);
    await storage.write(key: "USER", value: user.toJson());

    final socket = ref.read(socketProvider);
    socket.sink.add({"type": "admin", "payload": ""});

    state = AsyncData(Some<User>(user));
  }

  Future<void> logout() async {
    final socket = ref.read(socketProvider);
    socket.sink.close();
    final storage = ref.read(storageProvider);
    await storage.delete(key: "USER");
    state = const AsyncData(None<User>());
  }
}
