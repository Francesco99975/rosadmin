import 'dart:convert';

import 'category.dart';

class Product {
  final String id;
  final String name;
  final String description;
  final int price;
  final String image;
  final bool featured;
  final bool published;
  final Category category;
  final bool weighed;
  final int lv;
  final DateTime created;
  final DateTime updated;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.image,
    required this.featured,
    required this.published,
    required this.category,
    required this.weighed,
    required this.lv,
    required this.created,
    required this.updated,
  });

  Product copyWith({
    String? id,
    String? name,
    String? description,
    int? price,
    String? image,
    bool? featured,
    bool? published,
    Category? category,
    bool? weighed,
    int? lv,
    DateTime? created,
    DateTime? updated,
  }) {
    return Product(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        price: price ?? this.price,
        image: image ?? this.image,
        featured: featured ?? this.featured,
        published: published ?? this.published,
        category: category ?? this.category,
        weighed: weighed ?? this.weighed,
        lv: lv ?? this.lv,
        created: created ?? this.created,
        updated: updated ?? this.updated);
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'file': image,
      'featured': featured,
      'published': published,
      'category_id': category.id,
      'category': category.toMap(),
      'weighed': weighed,
      'lv': lv,
      'created': created.toIso8601String(),
      'updated': updated.toIso8601String(),
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'],
      name: map['name'],
      description: map['description'],
      price: map['price'],
      image: map['image'] ?? map['file'],
      featured: map['featured'],
      published: map['published'],
      category: Category.fromMap(map['category']),
      weighed: map['weighed'],
      lv: map['lv'],
      created: DateTime.parse(map['created']),
      updated: DateTime.parse(map['updated']),
    );
  }

  String toJson() => jsonEncode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(jsonDecode(source));
}
