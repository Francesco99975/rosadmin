import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:go_router/go_router.dart';
import 'package:rosadmin/constants/selectors.dart';
import 'package:rosadmin/helpers/prettifier.dart';
import 'package:rosadmin/providers/user.dart';
import 'package:rosadmin/providers/visits.dart';
import 'package:rosadmin/screens/auth.dart';
import 'package:rosadmin/widgets/card_list.dart';
import 'package:rosadmin/widgets/main_drawer.dart';
import 'package:rosadmin/widgets/statistic_item.dart';
import 'package:rosadmin/widgets/stats_chart.dart';

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

class TrafficStats extends ConsumerStatefulWidget {
  const TrafficStats({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TrafficStatsState();
}

class _TrafficStatsState extends ConsumerState<TrafficStats> {
  late String selectedQuality;
  late String selectedTimeframe;

  @override
  void initState() {
    super.initState();
    selectedQuality = Selectors.qualitySelectors.keys.toList()[0];
    selectedTimeframe = Selectors.timeframeSelectors.keys.toList()[0];
  }

  @override
  Widget build(BuildContext context) {
    final visits =
        ref.watch(visitsProvider(selectedQuality, selectedTimeframe));

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
                  Wrap(
                    alignment: WrapAlignment.spaceEvenly,
                    children: [
                      DropdownButton<String>(
                          value: selectedQuality,
                          items: Selectors.qualitySelectors.values
                              .mapWithIndex<DropdownMenuItem<String>>(
                                  (label, index) => DropdownMenuItem<String>(
                                        value: Selectors.qualitySelectors.keys
                                            .toList()[index],
                                        child: Text(label),
                                      ))
                              .toList(),
                          onChanged: (value) {
                            if (value != null) {
                              setState(() {
                                selectedQuality = value;
                              });
                            }
                          }),
                      const SizedBox(
                        width: 20,
                      ),
                      DropdownButton<String>(
                          value: selectedTimeframe,
                          items: Selectors.timeframeSelectors.values
                              .mapWithIndex<DropdownMenuItem<String>>(
                                  (label, index) => DropdownMenuItem<String>(
                                        value: Selectors.timeframeSelectors.keys
                                            .toList()[index],
                                        child: Text(label),
                                      ))
                              .toList(),
                          onChanged: (value) {
                            if (value != null) {
                              setState(() {
                                selectedTimeframe = value;
                              });
                            }
                          })
                    ],
                  ),
                  const SizedBox(height: 10.0),
                  StatsChart(
                      stats: [r.data],
                      title: Selectors.qualitySelectors[selectedQuality] ??
                          "Values",
                      dateFilterLabel:
                          Selectors.timeframeSelectors[selectedTimeframe] ??
                              "Period"),
                  const SizedBox(height: 16.0),
                  Center(
                    child: StatisticItem(
                        label: 'Average Visit Duration',
                        value: prettyDuration(
                            Duration(seconds: r.avgVisitDuration))),
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
