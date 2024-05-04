import 'dart:convert';

import 'package:rosadmin/models/customer.dart';
import 'package:rosadmin/models/purchase.dart';

class Order {
  final String id;
  final Customer customer;
  final List<Purchase> purchases;
  final DateTime pickuptime;
  final bool fulfilled;
  final String method;
  final DateTime created;
  final DateTime updated;

  Order(
      {required this.id,
      required this.customer,
      required this.purchases,
      required this.pickuptime,
      required this.fulfilled,
      required this.method,
      required this.created,
      required this.updated});

  Order copyWith(
      {String? id,
      Customer? customer,
      List<Purchase>? purchases,
      DateTime? pickuptime,
      bool? fulfilled,
      String? method,
      DateTime? created,
      DateTime? updated}) {
    return Order(
        id: id ?? this.id,
        customer: customer ?? this.customer,
        purchases: purchases ?? this.purchases,
        pickuptime: pickuptime ?? this.pickuptime,
        fulfilled: fulfilled ?? this.fulfilled,
        method: method ?? this.method,
        created: created ?? this.created,
        updated: updated ?? this.updated);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'customer': customer.toMap(),
      'purchases': purchases.map((x) => x.toMap()).toList(),
      'pickuptime': pickuptime.toIso8601String(),
      'fulfilled': fulfilled,
      'method': method,
      'created': created.toIso8601String(),
      'updated': updated.toIso8601String()
    };
  }

  factory Order.fromMap(Map<String, dynamic> map) {
    return Order(
        id: map['id'],
        customer: Customer.fromMap(map['customer']),
        purchases: List<Purchase>.from(
            map['purchases']?.map((x) => Purchase.fromMap(x))),
        pickuptime: DateTime.parse(map['pickuptime']),
        fulfilled: map['fulfilled'],
        method: map['method'],
        created: DateTime.parse(map['created']),
        updated: DateTime.parse(map['updated']));
  }

  String toJson() => jsonEncode(toMap());

  factory Order.fromJson(String source) => Order.fromMap(jsonDecode(source));
}
