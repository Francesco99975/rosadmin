import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:rosadmin/providers/user.dart';
import 'package:rosadmin/providers/visits.dart';
import 'package:rosadmin/screens/auth.dart';
import 'package:rosadmin/widgets/card_list.dart';
import 'package:rosadmin/widgets/main_drawer.dart';
import 'package:rosadmin/widgets/statistic_item.dart';

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
        drawer: const MainDrawer(),
        body: const TabBarView(
            children: [TrafficStats(), Placeholder(), Placeholder()]),
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

class TrafficStats extends ConsumerWidget {
  const TrafficStats({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final visits = ref.watch(visitsProvider);

    return switch (visits) {
      AsyncData(:final value) =>
        value.match((l) => Text('server error: ${l.message}'), (r) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      'Traffic',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  Center(
                    child: Wrap(
                      alignment: WrapAlignment.spaceEvenly,
                      children: [
                        StatisticItem(
                          label: 'Current',
                          value: r.current.toString(),
                        ),
                        StatisticItem(
                            label: 'Total Visits',
                            value: r.totalVisitors.toString()),
                        StatisticItem(
                            label: 'Total Unique Visits',
                            value: r.totalUniqueVisitors.toString()),
                        StatisticItem(
                            label: 'Total Views',
                            value: r.totalViews.toString()),
                        StatisticItem(
                            label: 'Bounce Rate', value: r.bounceRate),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: CardList(
                          title: 'Arriving From',
                          items: r.visitOrigins
                              .map((e) => '${e.sauce} - ${e.count}')
                              .toList(),
                        ),
                      ),
                      const SizedBox(width: 16.0),
                      Expanded(
                        child: CardList(
                          title: 'Devices Used',
                          items: r.deviceOrigins
                              .map((e) => '${e.deviceSignature} - ${e.count}')
                              .toList(),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        }),
      AsyncError(:final error) => Text('runtime error: $error'),
      _ => const Center(
          child: CircularProgressIndicator(),
        ),
    };
  }
}
