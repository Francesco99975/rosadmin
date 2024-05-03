import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart' as fp;
import 'package:rosadmin/models/pie.dart';

class PieChartStats extends StatefulWidget {
  final Pie pie;
  const PieChartStats({super.key, required this.pie});

  @override
  State<PieChartStats> createState() => _PieChartStatsState();
}

class _PieChartStatsState extends State<PieChartStats> {
  int touchedIndex = 0;

  @override
  Widget build(BuildContext context) {
    if (widget.pie.items.isEmpty ||
        widget.pie.items.fold<double>(
                0, (previousValue, element) => element.value + previousValue) <
            100.0) {
      return Container(
        width: 200, // Adjust width as needed
        height: 200, // Adjust height as needed
        decoration: BoxDecoration(
          color: Theme.of(context)
              .colorScheme
              .onSecondary, // Background color of the container
          borderRadius:
              BorderRadius.circular(20), // Adjust corner radius as needed
        ),
        child: Center(
          child: Text(
            'NO DATA',
            style: TextStyle(
              fontSize: 20, // Adjust font size as needed
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
      );
    }
    return AspectRatio(
      aspectRatio: 1.3,
      child: AspectRatio(
        aspectRatio: 1,
        child: PieChart(
          PieChartData(
            pieTouchData: PieTouchData(
              touchCallback: (FlTouchEvent event, pieTouchResponse) {
                setState(() {
                  if (!event.isInterestedForInteractions ||
                      pieTouchResponse == null ||
                      pieTouchResponse.touchedSection == null) {
                    touchedIndex = -1;
                    return;
                  }
                  touchedIndex =
                      pieTouchResponse.touchedSection!.touchedSectionIndex;
                });
              },
            ),
            borderData: FlBorderData(
              show: false,
            ),
            sectionsSpace: 0,
            centerSpaceRadius: 0,
            sections: showingSections(widget.pie),
          ),
        ),
      ),
    );
  }

  List<PieChartSectionData> showingSections(Pie pie) {
    return pie.items.mapWithIndex((item, i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 20.0 : 16.0;
      final radius = isTouched ? 110.0 : 100.0;
      final widgetSize = isTouched ? 55.0 : 40.0;
      const shadows = [Shadow(color: Colors.black, blurRadius: 2)];

      return PieChartSectionData(
        color: Color(item.color),
        value: item.value,
        title: "${item.value}%",
        radius: radius,
        titleStyle: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
          color: const Color(0xffffffff),
          shadows: shadows,
        ),
        badgeWidget: _Badge(
          _getIconDynamically(item.label),
          size: widgetSize,
          borderColor: Colors.black,
        ),
        badgePositionPercentageOffset: .98,
      );
    }).toList();
  }
}

IconData _getIconDynamically(String text) {
  switch (text) {
    case 'cash':
      return Icons.attach_money;
    case 'stripe':
      return Icons.credit_card;
    case 'paypal':
      return Icons.paypal;
    default:
      return Icons.no_accounts;
  }
}

class _Badge extends StatelessWidget {
  const _Badge(
    this.icon, {
    required this.size,
    required this.borderColor,
  });
  final IconData icon;
  final double size;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: PieChart.defaultDuration,
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        border: Border.all(
          color: borderColor,
          width: 2,
        ),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withOpacity(.5),
            offset: const Offset(3, 3),
            blurRadius: 3,
          ),
        ],
      ),
      padding: EdgeInsets.all(size * .15),
      child: Center(
        child: Icon(icon),
      ),
    );
  }
}
