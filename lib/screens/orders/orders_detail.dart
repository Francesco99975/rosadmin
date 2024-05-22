import 'package:flutter/material.dart';
import 'package:rosadmin/models/purchase.dart';
import 'package:rosadmin/widgets/purchase_item.dart';

class OrderDetailsScreen extends StatelessWidget {
  static const routePath = "/orders/detail";

  final String customer;
  final List<Purchase> purchases;
  final double total;
  final DateTime pickuptime;
  final String method;
  final bool fulfilled;

  const OrderDetailsScreen({
    super.key,
    required this.customer,
    required this.purchases,
    required this.total,
    required this.pickuptime,
    required this.method,
    required this.fulfilled,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                // Navigate to CustomerDetailScreen
                // Replace with actual navigation logic
              },
              child: Text(
                'Customer: $customer',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                  color: Colors.blue,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Total Cost: \$${total.toStringAsFixed(2)}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 16),
                    Text('Pickup Date & Time: $pickuptime'),
                    const SizedBox(height: 8),
                    Text('Payment Method: $method'),
                    const SizedBox(height: 8),
                    Text('Status: ${fulfilled ? 'Fulfilled' : 'Unfulfilled'}'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Purchases:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: purchases.length,
                itemBuilder: (context, index) {
                  final purchase = purchases[index];
                  return PurchaseItem(
                    quantity: purchase.quantity,
                    productName: purchase.product.name,
                    category: purchase.product.category.name,
                    totalCost: (purchase.cost / 100.0),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
