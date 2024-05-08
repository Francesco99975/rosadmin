import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:intl/intl.dart';
import 'package:rosadmin/constants/selectors.dart';
import 'package:rosadmin/models/clientele.dart';
import 'package:rosadmin/providers/clintl.dart';
import 'package:rosadmin/providers/socket.dart';
import 'package:rosadmin/widgets/async_provider_wrapper.dart';
import 'package:rosadmin/widgets/card_list.dart';
import 'package:rosadmin/widgets/statistic_item.dart';
import 'package:rosadmin/widgets/stats_chart.dart';

class ClienteleStats extends ConsumerStatefulWidget {
  const ClienteleStats({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ClienteleStatsState();
}

class _ClienteleStatsState extends ConsumerState<ClienteleStats> {
  late String selectedQuality;
  late String selectedTimeframe;
  late StreamSubscription<dynamic> sub;

  @override
  void initState() {
    super.initState();
    selectedTimeframe = Selectors.timeframeSelectors.keys.toList()[0];
    sub = ref.read(socketProvider).subscribe((event) {
      if (jsonDecode(event)['type'] == "ucadmin") {
        final _ = ref.refresh(clintlProvider(selectedTimeframe).future);
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
    final clientele = ref.watch(clintlProvider(selectedTimeframe));
    final moneyFormatter =
        NumberFormat.simpleCurrency(locale: 'en_CA', name: 'CAD');

    return AsyncProviderWrapper<Clientele>(
        state: clientele,
        onRetry: () => ref.refresh(clintlProvider(selectedTimeframe).future),
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
                      'Clientele',
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
                          label: 'Total Customers',
                          value: r.totalCustomers.toString(),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Wrap(
                    alignment: WrapAlignment.spaceEvenly,
                    children: [
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
                      stats: r.customersData,
                      title: "Clientele",
                      dateFilterLabel:
                          Selectors.timeframeSelectors[selectedTimeframe] ??
                              "Period"),
                  const SizedBox(height: 16.0),
                  CardList(
                    title: 'Top Spenders',
                    items: r.topSpenders
                        .map((e) =>
                            '${e.fullname} - ${moneyFormatter.format(e.spent / 100)}')
                        .toList(),
                  )
                ],
              ),
            ),
          );
        });
  }
}
