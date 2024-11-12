import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:rosadmin/models/dataset.dart';
import 'package:rosadmin/utils/formatters.dart';
import 'package:rosadmin/utils/responsive.dart';

class StatsChart extends StatelessWidget {
  final String title;
  final String dateFilterLabel;
  final List<Dataset> stats;
  final bool divisible;

  const StatsChart(
      {super.key,
      required this.stats,
      required this.title,
      required this.dateFilterLabel,
      this.divisible = false});

  String _truncateLabel(String label, double screenWidth) {
    if (label.contains('-')) {
      return label;
    }
    return label.substring(0, 3);
  }

  Widget _leftTitleWidgets(double value, TitleMeta meta, double screenWidth) {
    String textValue = !divisible
        ? value.toInt().toString()
        : moneyFormatter.format(value / 100);

    final style = TextStyle(
      color: Colors.amber,
      fontSize: calculateFontSize(screenWidth),
    );
    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: Padding(
          padding: EdgeInsets.all(2.0), child: Text(textValue, style: style)),
    );
  }

  Widget _bottomTitleWidgets(double value, TitleMeta meta, double screenWidth) {
    String label = stats[0].horizontal[value.round()];
    label = _truncateLabel(label, screenWidth);

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 4,
      child: Text(
        label,
        style: TextStyle(
          fontSize: calculateFontSize(screenWidth),
          color: Colors.amber,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double aspectRatio = responsiveAspectRatio(screenWidth) *
        0.8; // Adjust aspect ratio for more height
    double maxY = stats.fold<double>(0, (max, stat) {
      double maxStatValue =
          stat.vertical.reduce((a, b) => a > b ? a : b).toDouble();
      return max > maxStatValue ? max : maxStatValue;
    });

    double interval = (maxY / 5).ceilToDouble();
    if (interval == 0) {
      interval = 1;
    }

    double reservedSize = screenWidth > 600 ? 100 : 50;

    return AspectRatio(
      aspectRatio: aspectRatio,
      child: Padding(
        padding: EdgeInsets.only(
          left: 20,
          right: 20,
          top: 22,
          bottom: 12,
        ),
        child: LineChart(
          LineChartData(
            lineTouchData: const LineTouchData(
              handleBuiltInTouches: true,
            ),
            lineBarsData: stats
                .map((stat) => LineChartBarData(
                      barWidth: responsiveBarWidth(screenWidth),
                      color: stat.color == 0
                          ? Theme.of(context).colorScheme.primary
                          : Color(0xFF000000 | stat.color),
                      isStrokeCapRound: true,
                      dotData: const FlDotData(show: true),
                      belowBarData: BarAreaData(show: false),
                      spots: stat.horizontal
                          .mapWithIndex(
                            (_, index) => FlSpot(
                              index.toDouble(),
                              stat.vertical[index].toDouble(),
                            ),
                          )
                          .toList(),
                    ))
                .toList(),
            minY: 0,
            borderData: FlBorderData(
              show: true,
              border: Border.all(
                color: Theme.of(context).colorScheme.tertiary,
              ),
            ),
            gridData: const FlGridData(
              show: false,
            ),
            titlesData: FlTitlesData(
              show: true,
              topTitles: const AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
              rightTitles: const AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
              bottomTitles: AxisTitles(
                axisNameWidget: Text(
                  title,
                  style: TextStyle(
                    fontSize: calculateFontSize(screenWidth),
                    color: Theme.of(context).colorScheme.secondary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                sideTitles: SideTitles(
                  showTitles: true,
                  reservedSize: 22,
                  interval: 1,
                  getTitlesWidget: (value, meta) {
                    return _bottomTitleWidgets(value, meta, screenWidth);
                  },
                ),
              ),
              leftTitles: AxisTitles(
                axisNameSize: 20,
                axisNameWidget: Text(
                  dateFilterLabel,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                sideTitles: SideTitles(
                  showTitles: true,
                  interval: interval,
                  reservedSize: reservedSize,
                  getTitlesWidget: (value, meta) =>
                      _leftTitleWidgets(value, meta, screenWidth),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
