import 'dart:convert';

class Setter {
  final String setting;
  final bool value;

  Setter({
    required this.setting,
    required this.value,
  });

  Setter copyWith({
    String? setting,
    bool? value,
  }) {
    return Setter(
      setting: setting ?? this.setting,
      value: value ?? this.value,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'setting': setting,
      'value': value,
    };
  }

  factory Setter.fromMap(Map<String, dynamic> map) {
    return Setter(
      setting: map['setting'],
      value: map['value'],
    );
  }

  String toJson() => jsonEncode(toMap());

  factory Setter.fromJson(String source) =>
      Setter.fromMap(jsonDecode(source) as Map<String, dynamic>);
}
