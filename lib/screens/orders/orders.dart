import 'package:flutter/material.dart';
import 'package:rosadmin/providers/orders.dart';
import 'package:rosadmin/widgets/async_provider_wrapper.dart';
import 'package:rosadmin/widgets/empty.dart';
import 'package:rosadmin/widgets/main_appbar.dart';
import 'package:rosadmin/widgets/main_drawer.dart';
import 'package:rosadmin/widgets/order_item.dart';

class OrderScreen extends StatelessWidget {
  static const routePath = "/orders";
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AsyncProviderWrapper(
        provider: ordersProvider,
        future: ordersProvider.future,
        render: (orders) {
          return Scaffold(
            appBar: MainAppBar(title: "Orders"),
            drawer: const MainDrawer(
              active: OrderScreen.routePath,
            ),
            body: orders.isEmpty
                ? const EmptyListMessage(
                    message: "No orders yet", iconData: Icons.error_outline)
                : ListView.builder(
                    itemCount: orders.length,
                    itemBuilder: (context, index) => OrderItem(
                      order: orders[index],
                    ),
                  ),
          );
        });
  }
}
