import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';

class OrderItem extends StatelessWidget {
  final String customerFullName;
  final String pickupDateTime;
  final String paymentMethod;
  final double orderCost;

  const OrderItem({
    super.key,
    required this.customerFullName,
    required this.pickupDateTime,
    required this.paymentMethod,
    required this.orderCost,
  });

  @override
  Widget build(BuildContext context) {
    // Parse pickupDateTime to DateTime object
    DateTime pickupDate = DateTime.parse(pickupDateTime);

    // Get current date
    DateTime currentDate = DateTime.now();

    // Determine border color based on pickup date
    Color borderColor = pickupDate.isBefore(currentDate)
        ? Colors.red // Order is overdue
        : pickupDate.eqvYearMonthDay(currentDate)
            ? Colors.blue // Pickup date is today
            : Colors.transparent; // Default color

    // Determine leading icon based on payment method
    IconData paymentIcon = Icons.payment;
    switch (paymentMethod.toLowerCase()) {
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
        onTap: () {
          // Go to order detail
        },
        title: Text(
          customerFullName,
          style: const TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(pickupDateTime),
        leading: Icon(paymentIcon),
        trailing: Text(
          '\$$orderCost',
          style: const TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
