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

    Color moneyColor = const Color.fromARGB(255, 169, 75, 185);

    // Determine leading icon based on payment method
    IconData paymentIcon = Icons.payment;
    switch (order.method.toLowerCase()) {
      case 'cash':
        paymentIcon = Icons.attach_money;
        moneyColor = const Color.fromARGB(255, 30, 177, 35);
        break;
      case 'card':
        paymentIcon = Icons.credit_card;
        break;
      case 'paypal':
        paymentIcon = Icons.paypal;
        moneyColor = const Color.fromARGB(255, 15, 64, 197);
        break;
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: borderColor, width: 3.0),
          borderRadius: BorderRadius.circular(8),
        ),
        child: ListTile(
          onTap: () => context.pushNamed('order_detail', queryParameters: {
            "orderId": order.id,
            "customer": order.customer.toJson(),
            "purchases":
                jsonEncode(order.purchases.map((e) => e.toJson()).toList()),
            "total": (order.total / 100.0).toString(),
            "pickuptime": order.pickuptime.toIso8601String(),
            "created": order.created.toIso8601String(),
            "method": order.method,
            "fulfilled": order.fulfilled.toString(),
          }),
          title: Text.rich(TextSpan(
              text: "From",
              style:
                  const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              children: [
                TextSpan(
                    text: " ${order.customer.fullname}",
                    style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary)),
                const TextSpan(
                    text: ", made ",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    )),
                TextSpan(
                  text:
                      '${DateTime.now().difference(order.created).inDays}', // Number of days
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context)
                        .colorScheme
                        .primary, // Primary color for the number of days
                  ),
                ),
                const TextSpan(
                    text: " days ago",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    )),
              ])),
          subtitle: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 0.0),
            child: Text.rich(
              TextSpan(
                text: 'Pickup on ', // Normal text before the date
                style: const TextStyle(
                    fontSize: 16.0, fontStyle: FontStyle.italic), // Base style
                children: <TextSpan>[
                  TextSpan(
                    text: DateFormat.yMMMMEEEEd()
                        .format(order.pickuptime), // Date part
                    style: TextStyle(
                      fontSize: 16.0,
                      fontStyle: FontStyle.italic,
                      color: Theme.of(context)
                          .colorScheme
                          .primary, // Primary color for date
                    ),
                  ),
                  const TextSpan(
                    text: ', at ', // Normal text between date and time
                  ),
                  TextSpan(
                    text: DateFormat.jm().format(order.pickuptime), // Time part
                    style: TextStyle(
                      fontSize: 16.0,
                      fontStyle: FontStyle.italic,
                      color: Theme.of(context)
                          .colorScheme
                          .primary, // Primary color for time
                    ),
                  ),
                ],
              ),
            ),
          ),
          leading: Icon(paymentIcon, color: moneyColor),
          trailing: Text(
            moneyFormatter.format(order.total / 100.0),
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: moneyColor,
            ),
          ),
        ),
      ),
    );
  }
}
