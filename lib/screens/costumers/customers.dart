import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rosadmin/constants/events.dart';
import 'package:rosadmin/providers/customers.dart';
import 'package:rosadmin/providers/socket.dart';
import 'package:rosadmin/widgets/async_provider_wrapper.dart';
import 'package:rosadmin/widgets/customer_item.dart';
import 'package:rosadmin/widgets/empty.dart';
import 'package:rosadmin/widgets/main_appbar.dart';
import 'package:rosadmin/widgets/main_drawer.dart';

class CustomerScreen extends ConsumerStatefulWidget {
  static const routePath = "/customers";
  const CustomerScreen({super.key});

  @override
  ConsumerState<CustomerScreen> createState() => _CustomerScreenState();
}

class _CustomerScreenState extends ConsumerState<CustomerScreen> {
  late StreamSubscription<dynamic> sub;

  @override
  void initState() {
    super.initState();

    sub = ref.read(socketProvider).subscribe((event) {
      if (jsonDecode(event)['type'] == SocketEvents.customers) {
        ref.invalidate(customersProvider);
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    sub.cancel();
  }

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
