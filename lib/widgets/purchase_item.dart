import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rosadmin/utils/capitalizer.dart';

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
    final moneyFormatter =
        NumberFormat.simpleCurrency(locale: 'en_CA', name: 'CAD');
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: Text(
          quantity.toString(),
          style: TextStyle(
            color: Theme.of(context).colorScheme.onPrimary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      title: Text(
        capitalizer(productName),
        style: const TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(capitalizer(category)),
      trailing: Text(
        moneyFormatter.format(totalCost),
        style: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
    );
  }
}
