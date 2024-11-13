import 'dart:convert';

class Standing {
  final String name;
  final String value;

  Standing({
    required this.name,
    required this.value,
  });

  Standing copyWith({String? name, String? value}) {
    return Standing(
      name: name ?? this.name,
      value: value ?? this.value,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'value': value,
    };
  }

  factory Standing.fromMap(Map<String, dynamic> map) {
    return Standing(
      name: map['name'],
      value: map['value'],
    );
  }

  String toJson() => jsonEncode(toMap());

  factory Standing.fromJson(String source) =>
      Standing.fromMap(jsonDecode(source) as Map<String, dynamic>);
}
