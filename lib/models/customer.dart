import 'dart:convert';

class Customer {
  final String id;
  final String fullname;
  final String email;
  final String address;
  final String phone;
  final DateTime created;
  final DateTime lastOrdered;
  final int totalSpent;

  Customer(
      {required this.id,
      required this.fullname,
      required this.email,
      required this.address,
      required this.phone,
      required this.created,
      required this.lastOrdered,
      required this.totalSpent});

  Customer copyWith(
      {String? id,
      String? fullname,
      String? email,
      String? address,
      String? phone,
      DateTime? created,
      DateTime? lastOrdered,
      int? totalSpent}) {
    return Customer(
        id: id ?? this.id,
        fullname: fullname ?? this.fullname,
        email: email ?? this.email,
        address: address ?? this.address,
        phone: phone ?? this.phone,
        created: created ?? this.created,
        lastOrdered: lastOrdered ?? this.lastOrdered,
        totalSpent: totalSpent ?? this.totalSpent);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'fullname': fullname,
      'email': email,
      'address': address,
      'phone': phone,
      'created': created.toIso8601String(),
      'last_ordered': lastOrdered.toIso8601String(),
      'total_spent': totalSpent
    };
  }

  factory Customer.fromMap(Map<String, dynamic> map) {
    return Customer(
        id: map['id'],
        fullname: map['fullname'],
        email: map['email'],
        address: map['address'],
        phone: map['phone'],
        created: DateTime.parse(map['created']),
        lastOrdered: DateTime.parse(map['last_ordered']),
        totalSpent: map['total_spent']);
  }

  String toJson() => jsonEncode(toMap());

  factory Customer.fromJson(String source) =>
      Customer.fromMap(jsonDecode(source) as Map<String, dynamic>);
}
