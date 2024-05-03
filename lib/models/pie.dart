import 'dart:convert';

class PieItem {
  final String label;
  final double value;
  final int color;

  PieItem({required this.label, required this.value, required this.color});

  PieItem copyWith({String? label, double? value, int? color}) {
    return PieItem(
        label: label ?? this.label,
        value: value ?? this.value,
        color: color ?? this.color);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'label': label, 'value': value, 'color': color};
  }

  factory PieItem.fromMap(Map<String, dynamic> map) {
    return PieItem(
        label: map['label'],
        value: map['value'].toDouble(),
        color: map['color']);
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
    return Pie(
        title: map['title'],
        items: (map['items'] as List<dynamic>)
            .map((e) => PieItem.fromMap(e))
            .toList());
  }

  String toJson() => jsonEncode(toMap());

  factory Pie.fromJson(String source) =>
      Pie.fromMap(jsonDecode(source) as Map<String, dynamic>);
}
