import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:rosadmin/models/dataset.dart';

class StatsChart extends StatelessWidget {
  final String title;
  final String dateFilterLabel;
  final List<Dataset> stats;

  const StatsChart(
      {super.key,
      required this.stats,
      required this.title,
      required this.dateFilterLabel});

  Widget _leftTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Colors.amber,
      fontSize: 12,
    );
    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: Text('${value.toInt()}', style: style),
    );
  }

  Widget _bottomTitleWidgets(double value, TitleMeta meta) {
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 4,
      child: Text(
        stats[0].horizontal[value.round()],
        style: const TextStyle(
          fontSize: 10,
          color: Colors.amber,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        aspectRatio: 2,
        child: Padding(
          padding:
              const EdgeInsets.only(left: 12, right: 28, top: 22, bottom: 12),
          child: LineChart(
            LineChartData(
                lineTouchData: const LineTouchData(
                  handleBuiltInTouches: true,
                ),
                lineBarsData: stats
                    .map((stat) => LineChartBarData(
                        barWidth: 3,
                        color: stat.color == 0
                            ? Theme.of(context).colorScheme.primary
                            : Color(stat.color),
                        isStrokeCapRound: true,
                        dotData: const FlDotData(show: true),
                        belowBarData: BarAreaData(show: false),
                        spots: stat.horizontal
                            .mapWithIndex(
                              (_, index) => FlSpot(index.toDouble(),
                                  stat.vertical[index].toDouble()),
                            )
                            .toList()))
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
                        dateFilterLabel,
                        style: TextStyle(
                          fontSize: 12,
                          color: Theme.of(context).colorScheme.secondary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      sideTitles: SideTitles(
                          showTitles: true,
                          reservedSize: 22,
                          interval: 1,
                          getTitlesWidget: _bottomTitleWidgets),
                    ),
                    leftTitles: AxisTitles(
                        axisNameSize: 20,
                        axisNameWidget: Text(
                          title,
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                        sideTitles: SideTitles(
                            showTitles: true,
                            interval: 1,
                            reservedSize: 22,
                            getTitlesWidget: _leftTitleWidgets)))),
          ),
        ));
  }
}
