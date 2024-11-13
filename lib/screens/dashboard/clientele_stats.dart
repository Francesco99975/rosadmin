import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:intl/intl.dart';
import 'package:rosadmin/constants/selectors.dart';
import 'package:rosadmin/models/clientele.dart';
import 'package:rosadmin/models/standing.dart';
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
    final moneyFormatter =
        NumberFormat.simpleCurrency(locale: 'en_CA', name: 'CAD');

    return AsyncProviderWrapper<Clientele>(
        provider: clintlProvider(selectedTimeframe),
        future: clintlProvider(selectedTimeframe).future,
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
                  Wrap(
                    alignment: WrapAlignment.spaceEvenly,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        color: Color(0xFF000000 | 0x1CE2D4),
                        child: Text(
                          "New Customers",
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(
                                  color: Theme.of(context).colorScheme.surface,
                                  fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        color: Color(0xFF000000 | 0xCFE410),
                        child: Text(
                          "Recurring Customers",
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(
                                  color: Theme.of(context).colorScheme.surface,
                                  fontWeight: FontWeight.bold),
                        ),
                      )
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
                    ordered: true,
                    items: r.topSpenders
                        .map((e) => Standing(
                            name: e.fullname,
                            value: moneyFormatter.format(e.spent / 100)))
                        .toList(),
                  )
                ],
              ),
            ),
          );
        });
  }
}
