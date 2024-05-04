import 'dart:convert';

import 'package:rosadmin/models/product.dart';

class Purchase {
  final String id;
  final Product product;
  final int quantity;
  final DateTime created;
  final DateTime updated;

  Purchase({
    required this.id,
    required this.product,
    required this.quantity,
    required this.created,
    required this.updated,
  });

  Purchase copyWith({
    String? id,
    Product? product,
    int? quantity,
    DateTime? created,
    DateTime? updated,
  }) {
    return Purchase(
        id: id ?? this.id,
        product: product ?? this.product,
        quantity: quantity ?? this.quantity,
        created: created ?? this.created,
        updated: updated ?? this.updated);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'product': product.toMap(),
      'quantity': quantity,
      'created': created.toIso8601String(),
      'updated': updated.toIso8601String()
    };
  }

  factory Purchase.fromMap(Map<String, dynamic> map) {
    return Purchase(
        id: map['id'],
        product: Product.fromJson(map['product']),
        quantity: map['quantity'],
        created: DateTime.parse(map['created']),
        updated: DateTime.parse(map['updated']));
  }

  String toJson() => jsonEncode(toMap());

  factory Purchase.fromJson(String source) =>
      Purchase.fromMap(jsonDecode(source));
}
