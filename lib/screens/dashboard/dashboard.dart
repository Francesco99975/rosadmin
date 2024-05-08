import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:go_router/go_router.dart';

import 'package:rosadmin/providers/user.dart';

import 'package:rosadmin/screens/auth.dart';
import 'package:rosadmin/screens/dashboard/clientele_stats.dart';
import 'package:rosadmin/screens/dashboard/finances_stats.dart';
import 'package:rosadmin/screens/dashboard/traffic_stats.dart';

import 'package:rosadmin/widgets/main_drawer.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  static const routePath = "/dashboard";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userx = ref.read(userxProvider.notifier);

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Admin Dashboard'),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.exit_to_app),
              onPressed: () {
                userx
                    .logout()
                    .then((value) => {context.go(AuthScreen.routePath)});
              },
            ),
          ],
        ),
        drawer: const MainDrawer(
          active: DashboardScreen.routePath,
        ),
        body: const TabBarView(
            children: [TrafficStats(), FinancesStats(), ClienteleStats()]),
        bottomNavigationBar: const TabBar(
          tabs: [
            Tab(icon: Icon(Icons.data_usage)),
            Tab(icon: Icon(Icons.attach_money)),
            Tab(icon: Icon(Icons.person_outline_sharp))
          ],
        ),
      ),
    );
  }
}
