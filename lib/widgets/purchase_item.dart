import 'package:flutter/material.dart';

class PurchaseItem extends StatelessWidget {
  final int quantity;
  final String productName;
  final String category;
  final double totalCost;

  const PurchaseItem({
    super.key,
    required this.quantity,
    required this.productName,
    required this.category,
    required this.totalCost,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.blue,
        child: Text(
          quantity.toString(),
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      title: Text(
        productName,
        style: const TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(category),
      trailing: Text(
        '\$$totalCost',
        style: const TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
