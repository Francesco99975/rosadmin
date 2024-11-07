import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:rosadmin/models/customer.dart';
import 'package:rosadmin/models/purchase.dart';
import 'package:rosadmin/providers/orders.dart';
import 'package:rosadmin/screens/scanner.dart';
import 'package:rosadmin/widgets/purchase_item.dart';

class OrderDetailsScreen extends ConsumerWidget {
  static const routePath = "/orders/detail";

  final String orderId;
  final Customer customer;
  final List<Purchase> purchases;
  final double total;
  final DateTime pickuptime;
  final DateTime created;
  final String method;
  final bool fulfilled;

  const OrderDetailsScreen({
    super.key,
    required this.orderId,
    required this.customer,
    required this.purchases,
    required this.total,
    required this.pickuptime,
    required this.created,
    required this.method,
    required this.fulfilled,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (!fulfilled)
              Row(
                children: <Widget>[
                  // First button (TextButton with Warning icon and text)
                  Expanded(
                    flex: 3,
                    child: TextButton(
                      onPressed: () => ref
                          .read(ordersProvider.notifier)
                          .fulfillOrder(orderId),
                      style: TextButton.styleFrom(
                        foregroundColor: Colors
                            .amber, // Warning yellow color for icon and text
                      ),
                      child: const Column(
                        children: [
                          Icon(
                            Icons.warning,
                            size: 40,
                            color: Colors.amber,
                          ),
                          SizedBox(height: 8), // Space between icon and text
                          Text(
                            "Force Fulfill",
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.amber,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 16), // Space between the two buttons
                  // Second button (ElevatedButton with QR code icon and text)
                  Expanded(
                    flex: 3,
                    child: ElevatedButton(
                      onPressed: () => context.go(QRScannerScreen.routePath),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context)
                            .colorScheme
                            .primary, // Primary color for button
                        foregroundColor: Theme.of(context)
                            .colorScheme
                            .onPrimary, // onPrimary for text
                        padding: const EdgeInsets.symmetric(
                            vertical: 16.0), // Padding for the button
                      ),
                      child: const Column(
                        children: [
                          Icon(
                            Icons.qr_code,
                            size: 40,
                          ),
                          SizedBox(height: 8), // Space between icon and text
                          Text(
                            "Scan to Fulfill",
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            const SizedBox(height: 30.0),
            InkWell(
              onTap: () {
                // Navigate to the customer details screen
                context.pushNamed(
                  'costumer_detail',
                  queryParameters: {'customer': customer.toJson()},
                );
              },
              child: Text(
                'Customer: ${customer.fullname}',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
            Text(
              'Email: ${customer.email}',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            const SizedBox(height: 16),
            Card(
              elevation: 5.0,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Total Cost: \$${total.toStringAsFixed(2)}',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    const SizedBox(height: 16),
                    Text(
                        'Order Creation Date & Time: ${DateFormat.yMMMMEEEEd().format(created)} at ${DateFormat.jm().format(created)}',
                        style: const TextStyle(fontSize: 16)),
                    const SizedBox(height: 8),
                    Text(
                        'Pickup Date & Time: ${DateFormat.yMMMMEEEEd().format(pickuptime)} at ${DateFormat.jm().format(pickuptime)}',
                        style: const TextStyle(fontSize: 16)),
                    const SizedBox(height: 8),
                    Text('Payment Method: ${method.toUpperCase()}',
                        style: const TextStyle(fontSize: 16)),
                    const SizedBox(height: 8),
                    Text('Status: ${fulfilled ? 'Fulfilled' : 'Unfulfilled'}',
                        style: const TextStyle(fontSize: 16)),
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
