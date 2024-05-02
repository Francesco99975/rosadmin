// ignore_for_file: constant_identifier_names

import 'dart:convert';

import 'package:rosadmin/models/dataset.dart';
import 'package:rosadmin/models/pie.dart';

class RankedOrder {
  final String id;
  final int cost;
  final String customer;
  final DateTime created;

  RankedOrder(
      {required this.id,
      required this.cost,
      required this.customer,
      required this.created});

  RankedOrder copyWith(
      {String? id, int? cost, String? customer, DateTime? created}) {
    return RankedOrder(
        id: id ?? this.id,
        cost: cost ?? this.cost,
        customer: customer ?? this.customer,
        created: created ?? this.created);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'cost': cost,
      'customer': customer,
      'created': created.toIso8601String()
    };
  }

  factory RankedOrder.fromMap(Map<String, dynamic> map) {
    return RankedOrder(
        id: map['id'],
        cost: map['cost'],
        customer: map['customer'],
        created: DateTime.parse(map['created']));
  }

  String toJson() => jsonEncode(toMap());

  factory RankedOrder.fromJson(String source) =>
      RankedOrder.fromMap(jsonDecode(source) as Map<String, dynamic>);
}

class RankedSeller {
  final String id;
  final String name;
  final String category;
  final int sold;

  RankedSeller(
      {required this.id,
      required this.name,
      required this.category,
      required this.sold});

  RankedSeller copyWith(
      {String? id, String? name, String? category, int? sold}) {
    return RankedSeller(
        id: id ?? this.id,
        name: name ?? this.name,
        category: category ?? this.category,
        sold: sold ?? this.sold);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'category': category,
      'sold': sold
    };
  }

  factory RankedSeller.fromMap(Map<String, dynamic> map) {
    return RankedSeller(
        id: map['id'],
        name: map['name'],
        category: map['category'],
        sold: map['sold']);
  }

  String toJson() => jsonEncode(toMap());

  factory RankedSeller.fromJson(String source) =>
      RankedSeller.fromMap(jsonDecode(source) as Map<String, dynamic>);
}

class RankedGainer {
  final String id;
  final String name;
  final String category;
  final int gained;

  RankedGainer(
      {required this.id,
      required this.name,
      required this.category,
      required this.gained});

  RankedGainer copyWith(
      {String? id, String? name, String? category, int? gained}) {
    return RankedGainer(
        id: id ?? this.id,
        name: name ?? this.name,
        category: category ?? this.category,
        gained: gained ?? this.gained);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'category': category,
      'gained': gained
    };
  }

  factory RankedGainer.fromMap(Map<String, dynamic> map) {
    return RankedGainer(
        id: map['id'],
        name: map['name'],
        category: map['category'],
        gained: map['gained']);
  }

  String toJson() => jsonEncode(toMap());

  factory RankedGainer.fromJson(String source) =>
      RankedGainer.fromMap(jsonDecode(source) as Map<String, dynamic>);
}

class Finances {
  static const ORDERS_AMOUNT = "orders_amount";
  static const OUTSTANDING_CASH = "outstanding_cash";
  static const PENDING_MONEY = "pending_money";
  static const GAINS = "gains";
  static const TOTAL = "total";
  static const ORDERS_DATA = "orders_data";
  static const MONETARY_DATA = "monetary_data";
  static const PREFERRED_METHOD_DATA = "preferred_method_data";
  static const FILLED_PIE = "filled_pie";
  static const METHOD_PIE = "method_pie";
  static const RANKED_ORDERS = "ranked_orders";
  static const TOPPED_SELLERS = "topped_sellers";
  static const TOPPED_GAINERS = "topped_gainers";
  static const FLOPPED_SELLERS = "flopped_sellers";
  static const FLOPPED_GAINERS = "flopped_gainers";

  final int ordersAmount;
  final int outstandingCash;
  final int pendingMoney;
  final int gains;
  final int total;

  final Dataset ordersData;
  final Dataset monetaryData;

  final List<Dataset> preferredMethodData;

  final Pie filledPie;
  final Pie methodPie;

  final List<RankedOrder> rankedOrders;
  final List<RankedSeller> toppedSellers;
  final List<RankedGainer> toppedGainers;
  final List<RankedSeller> floppedSellers;
  final List<RankedGainer> floppedGainers;

  Finances(
      {required this.ordersAmount,
      required this.outstandingCash,
      required this.pendingMoney,
      required this.gains,
      required this.total,
      required this.ordersData,
      required this.monetaryData,
      required this.preferredMethodData,
      required this.filledPie,
      required this.methodPie,
      required this.rankedOrders,
      required this.toppedSellers,
      required this.toppedGainers,
      required this.floppedSellers,
      required this.floppedGainers});

  Finances copyWith(
      {int? ordersAmount,
      int? outstandingCash,
      int? pendingMoney,
      int? gains,
      int? total,
      Dataset? ordersData,
      Dataset? monetaryData,
      List<Dataset>? preferredMethodData,
      Pie? filledPie,
      Pie? methodPie,
      List<RankedOrder>? rankedOrders,
      List<RankedSeller>? toppedSellers,
      List<RankedGainer>? toppedGainers,
      List<RankedSeller>? floppedSellers,
      List<RankedGainer>? floppedGainers}) {
    return Finances(
        ordersAmount: ordersAmount ?? this.ordersAmount,
        outstandingCash: outstandingCash ?? this.outstandingCash,
        pendingMoney: pendingMoney ?? this.pendingMoney,
        gains: gains ?? this.gains,
        total: total ?? this.total,
        ordersData: ordersData ?? this.ordersData,
        monetaryData: monetaryData ?? this.monetaryData,
        preferredMethodData: preferredMethodData ?? this.preferredMethodData,
        filledPie: filledPie ?? this.filledPie,
        methodPie: methodPie ?? this.methodPie,
        rankedOrders: rankedOrders ?? this.rankedOrders,
        toppedSellers: toppedSellers ?? this.toppedSellers,
        toppedGainers: toppedGainers ?? this.toppedGainers,
        floppedSellers: floppedSellers ?? this.floppedSellers,
        floppedGainers: floppedGainers ?? this.floppedGainers);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      ORDERS_AMOUNT: ordersAmount,
      OUTSTANDING_CASH: outstandingCash,
      PENDING_MONEY: pendingMoney,
      GAINS: gains,
      TOTAL: total,
      ORDERS_DATA: ordersData,
      MONETARY_DATA: monetaryData,
      PREFERRED_METHOD_DATA: preferredMethodData,
      FILLED_PIE: filledPie,
      METHOD_PIE: methodPie,
      RANKED_ORDERS: rankedOrders,
      TOPPED_SELLERS: toppedSellers,
      TOPPED_GAINERS: toppedGainers,
      FLOPPED_SELLERS: floppedSellers,
      FLOPPED_GAINERS: floppedGainers
    };
  }

  factory Finances.fromMap(Map<String, dynamic> map) {
    return Finances(
        ordersAmount: map[ORDERS_AMOUNT],
        outstandingCash: map[OUTSTANDING_CASH],
        pendingMoney: map[PENDING_MONEY],
        gains: map[GAINS],
        total: map[TOTAL],
        ordersData: map[ORDERS_DATA],
        monetaryData: map[MONETARY_DATA],
        preferredMethodData: (map[PREFERRED_METHOD_DATA] as List<dynamic>)
            .map((e) => Dataset.fromMap(e))
            .toList(),
        filledPie: map[FILLED_PIE],
        methodPie: map[METHOD_PIE],
        rankedOrders: (map[RANKED_ORDERS] as List<dynamic>)
            .map((e) => RankedOrder.fromMap(e))
            .toList(),
        toppedSellers: (map[TOPPED_SELLERS] as List<dynamic>)
            .map((e) => RankedSeller.fromMap(e))
            .toList(),
        toppedGainers: (map[TOPPED_GAINERS] as List<dynamic>)
            .map((e) => RankedGainer.fromMap(e))
            .toList(),
        floppedSellers: (map[FLOPPED_SELLERS] as List<dynamic>)
            .map((e) => RankedSeller.fromMap(e))
            .toList(),
        floppedGainers: (map[FLOPPED_GAINERS] as List<dynamic>)
            .map((e) => RankedGainer.fromMap(e))
            .toList());
  }

  String toJson() => jsonEncode(toMap());

  factory Finances.fromJson(String source) =>
      Finances.fromMap(jsonDecode(source) as Map<String, dynamic>);
}
