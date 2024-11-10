import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:rosadmin/models/dataset.dart';
import 'package:rosadmin/utils/responsive.dart';

class StatsChart extends StatelessWidget {
  final String title;
  final String dateFilterLabel;
  final List<Dataset> stats;

  const StatsChart(
      {super.key,
      required this.stats,
      required this.title,
      required this.dateFilterLabel});

  // Function to truncate horizontal values if they are strings
  String _truncateLabel(String label, double screenWidth) {
    if (label.contains('-')) {
      return label;
    }
    return screenWidth < 950 ? label.substring(0, 3) : label;
  }

  Widget _leftTitleWidgets(double value, TitleMeta meta, double screenWidth) {
    final style = TextStyle(
      color: Colors.amber,
      fontSize: calculateFontSize(screenWidth),
    );
    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: Padding(
          padding: EdgeInsets.all(2.0),
          child: Text('${value.toInt()}', style: style)),
    );
  }

  Widget _bottomTitleWidgets(double value, TitleMeta meta, double screenWidth) {
    // Get the label to display on the horizontal axis
    String label = stats[0].horizontal[value.round()];

    // If the label is a string, truncate it on small screens
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
    // Get the screen width to adapt the aspect ratio and padding dynamically
    double screenWidth = MediaQuery.of(context).size.width;

    // Calculate dynamic aspect ratio based on screen width (you can adjust the logic as needed)
    double aspectRatio = responsiveAspectRatio(screenWidth);

    // Find the maximum value in the vertical axis
    double maxY = stats.fold<double>(0, (max, stat) {
      double maxStatValue =
          stat.vertical.reduce((a, b) => a > b ? a : b).toDouble();
      return max > maxStatValue ? max : maxStatValue;
    });

    // Calculate dynamic interval and reserved size based on screen width and max Y value
    double interval = (maxY / 5).ceilToDouble();
    if (interval == 0) {
      interval =
          1; // Set a minimum interval of 1 if the calculated interval is zero
    }

    double reservedSize =
        screenWidth > 600 ? 32 : 22; // Larger screens get more space for titles

    return AspectRatio(
      aspectRatio: aspectRatio,
      child: Padding(
        padding: EdgeInsets.only(
          left: 12,
          right: 28,
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
                          : Color(stat.color),
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
                  dateFilterLabel,
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
                  title,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                sideTitles: SideTitles(
                  showTitles: true,
                  interval: interval, // Use dynamic interval for Y-axis titles
                  reservedSize:
                      reservedSize, // Adjust reserved size dynamically
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
