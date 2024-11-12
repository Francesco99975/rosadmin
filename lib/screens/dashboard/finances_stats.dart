import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:intl/intl.dart';
import 'package:rosadmin/constants/selectors.dart';
import 'package:rosadmin/providers/fins.dart';
import 'package:rosadmin/providers/socket.dart';
import 'package:rosadmin/widgets/async_provider_comparer.dart';
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
  late String selectedTimeframeOrd;
  late String selectedMethodOrd;
  late String selectedStatusOrd;

  late String selectedTimeframeMon;
  late String selectedMethodMon;
  late String selectedStatusMon;

  late String selectedTimeframePay;
  late String selectedStatusPay;

  late StreamSubscription<dynamic> sub;

  @override
  void initState() {
    super.initState();
    selectedTimeframeOrd = Selectors.timeframeSelectors.keys.toList()[0];
    selectedMethodOrd = Selectors.methodSelectors.keys.toList()[0];
    selectedStatusOrd = Selectors.statusSelectors.keys.toList()[0];

    selectedTimeframeMon = Selectors.timeframeSelectors.keys.toList()[0];
    selectedMethodMon = Selectors.methodSelectors.keys.toList()[0];
    selectedStatusMon = Selectors.statusSelectors.keys.toList()[0];

    selectedTimeframePay = Selectors.timeframeSelectors.keys.toList()[0];
    selectedStatusPay = Selectors.statusSelectors.keys.toList()[0];

    sub = ref.read(socketProvider).subscribe((event) {
      if (jsonDecode(event)['type'] == "ufadmin") {}
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
    final dateFormatter = DateFormat.yMMMd();

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
            AsyncProviderComparer(
              provider: finstsProvider,
              future: finstsProvider.future,
              render: (data) => Center(
                child: Wrap(
                  alignment: WrapAlignment.spaceEvenly,
                  children: [
                    StatisticItem(
                      label: 'Orders received',
                      value: data.ordersAmount.toString(),
                    ),
                    StatisticItem(
                        label: 'Outstanding Cash',
                        value:
                            moneyFormatter.format(data.outstandingCash / 100)),
                    StatisticItem(
                        label: 'Pending Money',
                        value: moneyFormatter.format(data.pendingMoney / 100)),
                    StatisticItem(
                        label: 'Gains',
                        value: moneyFormatter.format(data.gains / 100)),
                    StatisticItem(
                        label: 'TOTAL',
                        value: moneyFormatter.format(data.total / 100)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            Wrap(
              alignment: WrapAlignment.spaceEvenly,
              children: [
                DropdownButton<String>(
                    value: selectedTimeframeOrd,
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
                          selectedTimeframeOrd = value;
                        });
                      }
                    }),
                const SizedBox(
                  width: 20,
                ),
                DropdownButton<String>(
                    value: selectedMethodOrd,
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
                          selectedMethodOrd = value;
                        });
                      }
                    }),
                const SizedBox(
                  width: 20,
                ),
                DropdownButton<String>(
                    value: selectedStatusOrd,
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
                          selectedStatusOrd = value;
                        });
                      }
                    })
              ],
            ),
            const SizedBox(height: 10.0),
            AsyncProviderComparer(
                provider: finordProvider(
                    selectedTimeframeOrd, selectedMethodOrd, selectedStatusOrd),
                future: finordProvider(selectedTimeframeOrd, selectedMethodOrd,
                        selectedStatusOrd)
                    .future,
                render: (graph) => StatsChart(
                    stats: [graph.data],
                    title: "Orders Data",
                    dateFilterLabel:
                        Selectors.timeframeSelectors[selectedTimeframeOrd] ??
                            "Period")),
            const SizedBox(height: 16.0),
            Wrap(
              alignment: WrapAlignment.spaceEvenly,
              children: [
                DropdownButton<String>(
                    value: selectedTimeframeMon,
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
                          selectedTimeframeMon = value;
                        });
                      }
                    }),
                const SizedBox(
                  width: 20,
                ),
                DropdownButton<String>(
                    value: selectedMethodMon,
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
                          selectedMethodMon = value;
                        });
                      }
                    }),
                const SizedBox(
                  width: 20,
                ),
                DropdownButton<String>(
                    value: selectedStatusMon,
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
                          selectedStatusMon = value;
                        });
                      }
                    })
              ],
            ),
            AsyncProviderComparer(
                provider: finmonProvider(
                    selectedTimeframeMon, selectedMethodMon, selectedStatusMon),
                future: finmonProvider(selectedTimeframeMon, selectedMethodMon,
                        selectedStatusMon)
                    .future,
                render: (graph) => StatsChart(
                    divisible: true,
                    stats: [graph.data],
                    title: "Monetary Data",
                    dateFilterLabel:
                        Selectors.timeframeSelectors[selectedTimeframeMon] ??
                            "Period")),
            const SizedBox(height: 16.0),
            Wrap(
              alignment: WrapAlignment.spaceEvenly,
              children: [
                DropdownButton<String>(
                    value: selectedTimeframePay,
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
                          selectedTimeframePay = value;
                        });
                      }
                    }),
                const SizedBox(
                  width: 20,
                ),
                DropdownButton<String>(
                    value: selectedStatusPay,
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
                          selectedStatusPay = value;
                        });
                      }
                    })
              ],
            ),
            AsyncProviderComparer(
                provider:
                    finpayProvider(selectedTimeframePay, selectedStatusPay),
                future: finpayProvider(selectedTimeframePay, selectedStatusPay)
                    .future,
                render: (graph) => StatsChart(
                    stats: graph.datapoints,
                    title: "Payment Method Data",
                    dateFilterLabel:
                        Selectors.timeframeSelectors[selectedTimeframePay] ??
                            "Period")),
            const SizedBox(height: 16.0),
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
                      AsyncProviderComparer(
                          provider: finstatusProvider,
                          future: finstatusProvider.future,
                          render: (r) => PieChartStats(pie: r.pie))
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
                      AsyncProviderComparer(
                          provider: finmethodsProvider,
                          future: finmethodsProvider.future,
                          render: (r) => PieChartStats(pie: r.pie))
                    ],
                  ),
                ],
              ),
            ),
            const Divider(),
            const SizedBox(height: 16.0),
            AsyncProviderComparer(
                provider: finstadsProvider,
                future: finstadsProvider.future,
                render: (r) => Column(
                      children: [
                        CardList(
                          title: 'Top Orders',
                          items: r.rankedOrders
                              .map((e) =>
                                  '${e.customer} - ${moneyFormatter.format(e.cost / 100)} - ${dateFormatter.format(e.created)}')
                              .toList(),
                        ),
                        const SizedBox(height: 16.0),
                        const Divider(),
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
                    ))
          ],
        ),
      ),
    );
  }
}
