import 'dart:convert';

class Category {
  final String id;
  final String name;

  Category({
    required this.id,
    required this.name,
  });

  Category copyWith({String? id, String? name}) {
    return Category(
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

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      id: map['id'],
      name: map['name'],
    );
  }

  String toJson() => jsonEncode(toMap());

  factory Category.fromJson(String source) =>
      Category.fromMap(jsonDecode(source) as Map<String, dynamic>);
}
