import 'package:flutter/material.dart';
import 'package:rosadmin/providers/customers.dart';
import 'package:rosadmin/widgets/async_provider_wrapper.dart';
import 'package:rosadmin/widgets/customer_item.dart';
import 'package:rosadmin/widgets/empty.dart';
import 'package:rosadmin/widgets/main_appbar.dart';
import 'package:rosadmin/widgets/main_drawer.dart';

class CustomerScreen extends StatelessWidget {
  static const routePath = "/customers";
  const CustomerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AsyncProviderWrapper(
        provider: customersProvider,
        future: customersProvider.future,
        render: (customers) {
          return Scaffold(
            appBar: MainAppBar(title: "Customers"),
            drawer: const MainDrawer(
              active: CustomerScreen.routePath,
            ),
            body: customers.isEmpty
                ? const EmptyListMessage(
                    message: "No customers yet", iconData: Icons.error_outline)
                : ListView.builder(
                    itemCount: customers.length,
                    itemBuilder: (context, index) => CustomerItem(
                      customer: customers[index],
                    ),
                  ),
          );
        });
  }
}
