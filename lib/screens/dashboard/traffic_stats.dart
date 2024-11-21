import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:rosadmin/constants/events.dart';
import 'package:rosadmin/constants/selectors.dart';
import 'package:rosadmin/providers/socket.dart';
import 'package:rosadmin/providers/visits.dart';
import 'package:rosadmin/widgets/async_provider_comparer.dart';
import 'package:rosadmin/widgets/stats_chart.dart';
import 'package:rosadmin/widgets/traffic_standings.dart';
import 'package:rosadmin/widgets/traffic_values.dart';

class TrafficStats extends ConsumerStatefulWidget {
  const TrafficStats({super.key});

  @override
  ConsumerState<TrafficStats> createState() => _TrafficStatsState();
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
      if (jsonDecode(event)['type'] == SocketEvents.uvadmin) {
        ref.invalidate(vistatProvider);
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
                child: Column(
              children: [
                AsyncProviderComparer(
                    provider: vistatProvider,
                    future: vistatProvider.future,
                    render: (data) => TrafficValues(
                        current: data.current.toString(),
                        total: data.totalVisitors.toString(),
                        unique: data.totalUniqueVisitors.toString(),
                        views: data.totalViews.toString(),
                        bounce: data.bounceRate,
                        duration: data.avgVisitDuration)),
              ],
            )),
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
            AsyncProviderComparer(
                provider: visdataProvider(selectedQuality, selectedTimeframe),
                future:
                    visdataProvider(selectedQuality, selectedTimeframe).future,
                render: (r) => StatsChart(
                    stats: [r.data],
                    title:
                        Selectors.qualitySelectors[selectedQuality] ?? "Values",
                    dateFilterLabel:
                        Selectors.timeframeSelectors[selectedTimeframe] ??
                            "Period")),
            const SizedBox(height: 16.0),
            AsyncProviderComparer(
                provider: vistandsProvider,
                future: vistandsProvider.future,
                render: (data) => TrafficStandings(
                    visitOrigins: data.visitOrigins,
                    deviceOrigins: data.deviceOrigins)),
          ],
        ),
      ),
    );
  }
}
