import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:intl/intl.dart';
import 'package:rosadmin/constants/selectors.dart';
import 'package:rosadmin/models/finances.dart';
import 'package:rosadmin/providers/fins.dart';
import 'package:rosadmin/providers/socket.dart';
import 'package:rosadmin/widgets/async_provider_wrapper.dart';
import 'package:rosadmin/widgets/card_list.dart';
import 'package:rosadmin/widgets/pie_chart_stats.dart';
import 'package:rosadmin/widgets/statistic_item.dart';
import 'package:rosadmin/widgets/stats_chart.dart';

class FinancesStats extends ConsumerStatefulWidget {
  const FinancesStats({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FinancesStatsState();
}

class _FinancesStatsState extends ConsumerState<FinancesStats> {
  late String selectedTimeframe;
  late String selectedMethod;
  late String selectedStatus;
  late StreamSubscription<dynamic> sub;

  @override
  void initState() {
    super.initState();
    selectedTimeframe = Selectors.timeframeSelectors.keys.toList()[0];
    selectedMethod = Selectors.methodSelectors.keys.toList()[0];
    selectedStatus = Selectors.statusSelectors.keys.toList()[0];
    sub = ref.read(socketProvider).subscribe((event) {
      if (jsonDecode(event)['type'] == "ufadmin") {
        final _ = ref.refresh(
            finsProvider(selectedTimeframe, selectedMethod, selectedStatus)
                .future);
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
    final financials = ref
        .watch(finsProvider(selectedTimeframe, selectedMethod, selectedStatus));
    final moneyFormatter =
        NumberFormat.simpleCurrency(locale: 'en_CA', name: 'CAD');
    final dateFormatter = DateFormat.yMMMd();

    return AsyncProviderWrapper<Finances>(
        state: financials,
        onRetry: () => ref.refresh(
            finsProvider(selectedTimeframe, selectedMethod, selectedStatus)
                .future),
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
                      'Finances',
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
                          label: 'Orders received',
                          value: r.ordersAmount.toString(),
                        ),
                        StatisticItem(
                            label: 'Outstanding Cash',
                            value:
                                moneyFormatter.format(r.outstandingCash / 100)),
                        StatisticItem(
                            label: 'Pending Money',
                            value: moneyFormatter.format(r.pendingMoney / 100)),
                        StatisticItem(
                            label: 'Gains',
                            value: moneyFormatter.format(r.gains / 100)),
                        StatisticItem(
                            label: 'TOTAL',
                            value: moneyFormatter.format(r.total / 100)),
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
                          }),
                      const SizedBox(
                        width: 20,
                      ),
                      DropdownButton<String>(
                          value: selectedMethod,
                          items: Selectors.methodSelectors.values
                              .mapWithIndex<DropdownMenuItem<String>>(
                                  (label, index) => DropdownMenuItem<String>(
                                        value: Selectors.methodSelectors.keys
                                            .toList()[index],
                                        child: Text(label),
                                      ))
                              .toList(),
                          onChanged: (value) {
                            if (value != null) {
                              setState(() {
                                selectedMethod = value;
                              });
                            }
                          }),
                      const SizedBox(
                        width: 20,
                      ),
                      DropdownButton<String>(
                          value: selectedStatus,
                          items: Selectors.statusSelectors.values
                              .mapWithIndex<DropdownMenuItem<String>>(
                                  (label, index) => DropdownMenuItem<String>(
                                        value: Selectors.statusSelectors.keys
                                            .toList()[index],
                                        child: Text(label),
                                      ))
                              .toList(),
                          onChanged: (value) {
                            if (value != null) {
                              setState(() {
                                selectedStatus = value;
                              });
                            }
                          })
                    ],
                  ),
                  const SizedBox(height: 10.0),
                  StatsChart(
                      stats: [r.ordersData],
                      title: "Orders Data",
                      dateFilterLabel:
                          Selectors.timeframeSelectors[selectedTimeframe] ??
                              "Period"),
                  const SizedBox(height: 16.0),
                  StatsChart(
                      stats: [r.monetaryData],
                      title: "Monetary Data",
                      dateFilterLabel:
                          Selectors.timeframeSelectors[selectedTimeframe] ??
                              "Period"),
                  const SizedBox(height: 16.0),
                  StatsChart(
                      stats: r.preferredMethodData,
                      title: "Preferred Payment Methods",
                      dateFilterLabel:
                          Selectors.timeframeSelectors[selectedTimeframe] ??
                              "Period"),
                  const SizedBox(height: 16.0),
                  CardList(
                    title: 'Top Orders',
                    items: r.rankedOrders
                        .map((e) =>
                            '${e.customer} - ${moneyFormatter.format(e.cost / 100)} - ${dateFormatter.format(e.created)}')
                        .toList(),
                  ),
                  const SizedBox(height: 16.0),
                  const Divider(),
                  Center(
                    child: Wrap(
                      alignment: WrapAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            const Text("Order Status"),
                            const SizedBox(
                              height: 10,
                            ),
                            PieChartStats(pie: r.filledPie)
                          ],
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          children: [
                            const Text("Used Methods"),
                            const SizedBox(
                              height: 10,
                            ),
                            PieChartStats(pie: r.methodPie)
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Divider(),
                  const SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: CardList(
                          title: 'Top Sellers',
                          items: r.toppedSellers
                              .map((e) =>
                                  '${e.name} - ${e.category} - ${e.sold}')
                              .toList(),
                        ),
                      ),
                      const SizedBox(width: 16.0),
                      Expanded(
                        child: CardList(
                          title: 'Top Gainers',
                          items: r.toppedGainers
                              .map((e) =>
                                  '${e.name} - ${e.category} - ${moneyFormatter.format(e.gained / 100)}')
                              .toList(),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: CardList(
                          title: 'Flop Sellers',
                          items: r.floppedSellers
                              .map((e) =>
                                  '${e.name} - ${e.category} - ${e.sold}')
                              .toList(),
                        ),
                      ),
                      const SizedBox(width: 16.0),
                      Expanded(
                        child: CardList(
                          title: 'Flop Gainers',
                          items: r.floppedGainers
                              .map((e) =>
                                  '${e.name} - ${e.category} - ${moneyFormatter.format(e.gained / 100)}')
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
