import 'dart:convert';

class PieItem {
  final String label;
  final double value;

  PieItem({required this.label, required this.value});

  PieItem copyWith({String? label, double? value}) {
    return PieItem(label: label ?? this.label, value: value ?? this.value);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'label': label,
      'value': value,
    };
  }

  factory PieItem.fromMap(Map<String, dynamic> map) {
    return PieItem(label: map['label'], value: map['value']);
  }

  String toJson() => jsonEncode(toMap());

  factory PieItem.fromJson(String source) =>
      PieItem.fromMap(jsonDecode(source) as Map<String, dynamic>);
}

class Pie {
  final String title;
  final List<PieItem> items;

  Pie({required this.title, required this.items});

  Pie copyWith({String? title, List<PieItem>? items}) {
    return Pie(title: title ?? this.title, items: items ?? this.items);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'items': items,
    };
  }

  factory Pie.fromMap(Map<String, dynamic> map) {
    return Pie(title: map['title'], items: List.from(map['items']));
  }

  String toJson() => jsonEncode(toMap());

  factory Pie.fromJson(String source) =>
      Pie.fromMap(jsonDecode(source) as Map<String, dynamic>);
}
