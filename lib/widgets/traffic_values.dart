import 'package:flutter/material.dart';
import 'package:rosadmin/helpers/prettifier.dart';
import 'package:rosadmin/widgets/statistic_item.dart';

class TrafficValues extends StatelessWidget {
  final String current;
  final String total;
  final String unique;
  final String views;
  final String bounce;
  final int duration;

  const TrafficValues(
      {super.key,
      required,
      required this.current,
      required this.total,
      required this.unique,
      required this.views,
      required this.bounce,
      required this.duration});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.spaceEvenly,
      children: [
        StatisticItem(
          label: 'Current',
          value: current,
        ),
        StatisticItem(label: 'Total Visits', value: total),
        StatisticItem(label: 'Total Unique Visits', value: unique),
        StatisticItem(label: 'Total Views', value: views),
        StatisticItem(
            label: 'Average Visit Duration',
            value: prettyDuration(Duration(milliseconds: duration))),
        StatisticItem(label: 'Bounce Rate', value: bounce),
      ],
    );
  }
}
