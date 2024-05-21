import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:rosadmin/constants/selectors.dart';
import 'package:rosadmin/helpers/prettifier.dart';
import 'package:rosadmin/models/visit.dart';
import 'package:rosadmin/providers/socket.dart';
import 'package:rosadmin/providers/visits.dart';
import 'package:rosadmin/widgets/async_provider_wrapper.dart';
import 'package:rosadmin/widgets/card_list.dart';
import 'package:rosadmin/widgets/statistic_item.dart';
import 'package:rosadmin/widgets/stats_chart.dart';

class TrafficStats extends ConsumerStatefulWidget {
  const TrafficStats({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TrafficStatsState();
}

class _TrafficStatsState extends ConsumerState<TrafficStats> {
  late String selectedQuality;
  late String selectedTimeframe;
  late StreamSubscription<dynamic> sub;

  @override
  void initState() {
    super.initState();
    selectedQuality = Selectors.qualitySelectors.keys.toList()[0];
    selectedTimeframe = Selectors.timeframeSelectors.keys.toList()[0];
    sub = ref.read(socketProvider).subscribe((event) {
      if (jsonDecode(event)['type'] == "uvadmin") {
        final _ = ref
            .refresh(visitsProvider(selectedQuality, selectedTimeframe).future);
      }
    });
  }

  @override
  void dispose() {
    sub.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AsyncProviderWrapper<Visit>(
        provider: visitsProvider(selectedQuality, selectedTimeframe),
        future: visitsProvider(selectedQuality, selectedTimeframe).future,
        render: (r) {
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
                            Duration(milliseconds: r.avgVisitDuration))),
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
        });
  }
}
