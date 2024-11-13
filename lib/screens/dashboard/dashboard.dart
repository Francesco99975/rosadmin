import 'package:flutter/material.dart';

import 'package:rosadmin/main.dart';

import 'package:rosadmin/screens/dashboard/clientele_stats.dart';
import 'package:rosadmin/screens/dashboard/finances_stats.dart';
import 'package:rosadmin/screens/dashboard/traffic_stats.dart';
import 'package:rosadmin/widgets/main_appbar.dart';

import 'package:rosadmin/widgets/main_drawer.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  static const routePath = "/dashboard";

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: MainAppBar(
          title: "Dashboard",
        ),
        drawer: const MainDrawer(
          active: SplashView.routePath,
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
