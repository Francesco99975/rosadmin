import 'dart:convert';

class Dataset {
  final String topic;
  final List<String> horizontal;
  final List<int> vertical;
  final int color;

  Dataset(
      {required this.topic,
      required this.horizontal,
      required this.vertical,
      required this.color});

  Dataset copyWith(
      {String? topic,
      List<String>? horizontal,
      List<int>? vertical,
      int? color}) {
    return Dataset(
        topic: topic ?? this.topic,
        horizontal: horizontal ?? this.horizontal,
        vertical: vertical ?? this.vertical,
        color: color ?? this.color);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'topic': topic,
      'horizontal': horizontal,
      'vertical': vertical,
      'color': color
    };
  }

  factory Dataset.fromMap(Map<String, dynamic> map) {
    return Dataset(
        topic: map['topic'],
        horizontal: List.from(map['horizontal']),
        vertical: List.from(map['vertical']),
        color: map['color']);
  }

  String toJson() => jsonEncode(toMap());

  factory Dataset.fromJson(String source) =>
      Dataset.fromMap(jsonDecode(source) as Map<String, dynamic>);
}
