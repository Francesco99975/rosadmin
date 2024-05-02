// ignore_for_file: constant_identifier_names

import 'dart:convert';

import 'package:rosadmin/models/dataset.dart';

class Spender {
  final String id;
  final String fullname;
  final String email;
  final int spent;

  Spender(
      {required this.id,
      required this.fullname,
      required this.email,
      required this.spent});

  Spender copyWith({String? id, String? fullname, String? email, int? spent}) {
    return Spender(
        id: id ?? this.id,
        fullname: fullname ?? this.fullname,
        email: email ?? this.email,
        spent: spent ?? this.spent);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'fullname': fullname,
      'email': email,
      'spent': spent
    };
  }

  factory Spender.fromMap(Map<String, dynamic> map) {
    return Spender(
        id: map['id'],
        fullname: map['fullname'],
        email: map['email'],
        spent: map['spent']);
  }

  String toJson() => jsonEncode(toMap());

  factory Spender.fromJson(String source) =>
      Spender.fromMap(jsonDecode(source) as Map<String, dynamic>);
}

class Clientele {
  static const TOTAL_CUSTOMERS = "total_customers";
  static const CUSTOMERS_DATA = "customers_data";
  static const TOP_SPENDERS = "top_spenders";

  final int totalCustomers;
  final List<Dataset> customersData;
  final List<Spender> topSpenders;

  Clientele(
      {required this.totalCustomers,
      required this.customersData,
      required this.topSpenders});

  Clientele copyWith(
      {int? totalCustomers,
      List<Dataset>? customersData,
      List<Spender>? topSpenders}) {
    return Clientele(
        totalCustomers: totalCustomers ?? this.totalCustomers,
        customersData: customersData ?? this.customersData,
        topSpenders: topSpenders ?? this.topSpenders);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      TOTAL_CUSTOMERS: totalCustomers,
      CUSTOMERS_DATA: customersData,
      TOP_SPENDERS: topSpenders
    };
  }

  factory Clientele.fromMap(Map<String, dynamic> map) {
    return Clientele(
        totalCustomers: map[TOTAL_CUSTOMERS],
        customersData: (map[CUSTOMERS_DATA] as List<dynamic>)
            .map((e) => Dataset.fromMap(e))
            .toList(),
        topSpenders: (map[TOP_SPENDERS] as List<dynamic>)
            .map((e) => Spender.fromMap(e))
            .toList());
  }

  String toJson() => jsonEncode(toMap());

  factory Clientele.fromJson(String source) =>
      Clientele.fromMap(jsonDecode(source) as Map<String, dynamic>);
}
