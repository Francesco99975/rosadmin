import 'dart:convert';

class Role {
  final String id;
  final String name;

  Role({required this.id, required this.name});

  Role copyWith({
    String? id,
    String? name,
  }) {
    return Role(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
    };
  }

  factory Role.fromMap(Map<String, dynamic> map) {
    return Role(id: map["id"], name: map["name"]);
  }

  String toJson() => json.encode(toMap());

  factory Role.fromJson(String source) =>
      Role.fromMap(json.decode(source) as Map<String, dynamic>);
}

class User {
  final String id;
  final String username;
  final String email;
  final Role role;
  final String token;

  User(
      {required this.id,
      required this.username,
      required this.email,
      required this.role,
      required this.token});

  User copyWith(
      {String? id,
      String? username,
      String? email,
      Role? role,
      String? token}) {
    return User(
        id: id ?? this.id,
        username: username ?? this.username,
        email: email ?? this.email,
        role: role ?? this.role,
        token: token ?? this.token);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'username': username,
      'email': email,
      'role': role.toMap(),
      'token': token
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
        id: map["id"],
        username: map["username"],
        email: map["email"],
        role: Role.fromMap(map["role"]),
        token: map['token']);
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);
}

class RawUser {
  final String id;
  final String username;
  final String email;
  final Role role;

  RawUser(
      {required this.id,
      required this.username,
      required this.email,
      required this.role});

  RawUser copyWith({String? id, String? username, String? email, Role? role}) {
    return RawUser(
        id: id ?? this.id,
        username: username ?? this.username,
        email: email ?? this.email,
        role: role ?? this.role);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'username': username,
      'email': email,
      'role': role.toMap()
    };
  }

  factory RawUser.fromMap(Map<String, dynamic> map) {
    return RawUser(
        id: map["id"],
        username: map["username"],
        email: map["email"],
        role: Role.fromMap(map["role"]));
  }

  String toJson() => jsonEncode(toMap());

  factory RawUser.fromJson(String source) =>
      RawUser.fromMap(jsonDecode(source) as Map<String, dynamic>);
}

class Login {
  final String token;
  final String otp;
  final RawUser user;

  Login({required this.token, required this.otp, required this.user});

  Login copyWith({String? token, String? otp, RawUser? user}) {
    return Login(
        token: token ?? this.token,
        otp: otp ?? this.otp,
        user: user ?? this.user);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'token': token, 'otp': otp, 'user': user.toMap()};
  }

  factory Login.fromMap(Map<String, dynamic> map) {
    return Login(
        token: map["token"],
        otp: map["otp"],
        user: RawUser.fromMap(map["user"]));
  }

  String toJson() => jsonEncode(toMap());

  factory Login.fromJson(String source) =>
      Login.fromMap(jsonDecode(source) as Map<String, dynamic>);
}
