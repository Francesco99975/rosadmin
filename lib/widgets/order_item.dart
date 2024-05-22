import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:rosadmin/models/order.dart' as model;

class OrderItem extends StatelessWidget {
  final model.Order order;

  const OrderItem({
    super.key,
    required this.order,
  });

  @override
  Widget build(BuildContext context) {
    // Get current date
    DateTime currentDate = DateTime.now();

    final moneyFormatter =
        NumberFormat.simpleCurrency(locale: 'en_CA', name: 'CAD');

    // Determine border color based on pickup date
    Color borderColor = order.pickuptime.isBefore(currentDate)
        ? Colors.red // Order is overdue
        : order.pickuptime.eqvYearMonthDay(currentDate)
            ? Colors.blue // Pickup date is today
            : Colors.transparent; // Default color

    // Determine leading icon based on payment method
    IconData paymentIcon = Icons.payment;
    switch (order.method.toLowerCase()) {
      case 'cash':
        paymentIcon = Icons.attach_money;
        break;
      case 'card':
        paymentIcon = Icons.credit_card;
        break;
      case 'paypal':
        paymentIcon = Icons.paypal;
        break;
    }

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        onTap: () => context.pushNamed('order_detail', queryParameters: {
          "customer": order.customer.fullname,
          "purchases":
              jsonEncode(order.purchases.map((e) => e.toJson()).toList()),
          "total": (order.total / 100.0).toString(),
          "pickuptime": order.pickuptime.toIso8601String(),
          "method": order.method,
          "fulfilled": order.fulfilled.toString(),
        }),
        title: Text(
          order.customer.fullname,
          style: const TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(DateFormat.yMMMMEEEEd().format(order.pickuptime)),
        leading: Icon(paymentIcon),
        trailing: Text(
          moneyFormatter.format(order.total),
          style: const TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
