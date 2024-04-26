import 'dart:convert';

class Dataset {
  final List<String> horizontal;
  final List<int> vertical;

  Dataset({required this.horizontal, required this.vertical});

  Dataset copyWith({List<String>? horizontal, List<int>? vertical}) {
    return Dataset(
        horizontal: horizontal ?? this.horizontal,
        vertical: vertical ?? this.vertical);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'horizontal': horizontal,
      'vertical': vertical,
    };
  }

  factory Dataset.fromMap(Map<String, dynamic> map) {
    return Dataset(
        horizontal: List.from(map['horizontal']),
        vertical: List.from(map['vertical']));
  }

  String toJson() => jsonEncode(toMap());

  factory Dataset.fromJson(String source) =>
      Dataset.fromMap(jsonDecode(source) as Map<String, dynamic>);
}
