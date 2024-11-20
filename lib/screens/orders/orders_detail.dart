import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:rosadmin/providers/orders.dart';
import 'package:rosadmin/screens/scanner.dart';
import 'package:rosadmin/utils/formatters.dart';
import 'package:rosadmin/utils/snackbar_service.dart';
import 'package:rosadmin/widgets/async_provider_wrapper.dart';
import 'package:rosadmin/widgets/purchase_item.dart';

class OrderDetailsScreen extends ConsumerWidget {
  static const routePath = "/orders/detail";
  final String orderId;

  const OrderDetailsScreen({super.key, required this.orderId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AsyncProviderWrapper(
      provider: singleOrderProvider(orderId),
      future: singleOrderProvider(orderId).future,
      render: (order) => Scaffold(
        appBar: AppBar(
          title: Text('Order Details',
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(color: Theme.of(context).colorScheme.surface)),
          backgroundColor: Theme.of(context).colorScheme.primary,
          foregroundColor: Theme.of(context).colorScheme.surface,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (!order.fulfilled)
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: TextButton(
                        onPressed: () async {
                          final res = await ref
                              .read(singleOrderProvider(orderId).notifier)
                              .fulfillOrder(orderId);
                          res.match(
                            (l) => SnackBarService.showNegativeSnackBar(
                              context: context,
                              message: l.message,
                            ),
                            (_) {
                              final _ = ref.refresh(ordersProvider.future);
                              SnackBarService.showPositiveSnackBar(
                                context: context,
                                message: "Order fulfilled",
                              );
                            },
                          );
                        },
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.amber,
                        ),
                        child: const Column(
                          children: [
                            Icon(Icons.warning, size: 40, color: Colors.amber),
                            SizedBox(height: 8),
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
                    if (Platform.isAndroid || Platform.isIOS)
                      const SizedBox(width: 16),
                    if (Platform.isAndroid || Platform.isIOS)
                      Expanded(
                        flex: 3,
                        child: ElevatedButton(
                          onPressed: () =>
                              context.push(QRScannerScreen.routePath),
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Theme.of(context).colorScheme.primaryFixedDim,
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Column(
                            children: [
                              Icon(Icons.qr_code,
                                  size: 40,
                                  color: Theme.of(context).colorScheme.surface),
                              SizedBox(height: 8),
                              Text(
                                "Scan to Fulfill",
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).colorScheme.surface,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
              const SizedBox(height: 24),
              InkWell(
                onTap: () {
                  context.pushNamed(
                    'customer_detail',
                    queryParameters: {'customer': order.customer.toJson()},
                  );
                },
                child: Text(
                  'Customer: ${order.customer.fullname}',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
              Text(
                'Email: ${order.customer.email}',
                style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
              const SizedBox(height: 16),
              Card(
                elevation: 3,
                margin: const EdgeInsets.symmetric(vertical: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildInfoRow('Total Cost:',
                          moneyFormatter.format(order.total / 100), context),
                      _buildInfoRow(
                        'Order Created:',
                        '${DateFormat.yMMMMEEEEd().format(order.created)} at ${DateFormat.jm().format(order.created)}',
                        context,
                      ),
                      _buildInfoRow(
                        'Pickup Date:',
                        '${DateFormat.yMMMMEEEEd().format(order.pickuptime)} at ${DateFormat.jm().format(order.pickuptime)}',
                        context,
                      ),
                      _buildInfoRow('Payment Method:',
                          order.method.toUpperCase(), context),
                      _buildInfoRow(
                        'Status:',
                        order.fulfilled ? 'Fulfilled' : 'Unfulfilled',
                        context,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Purchases:',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(height: 8),
              Expanded(
                child: ListView.builder(
                  itemCount: order.purchases.length,
                  itemBuilder: (context, index) {
                    final purchase = order.purchases[index];
                    return PurchaseItem(
                      quantity: purchase.quantity,
                      productName: purchase.product.name,
                      category: purchase.product.category.name,
                      totalCost: purchase.cost / 100.0,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
