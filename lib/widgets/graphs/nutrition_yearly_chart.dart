import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:macros_tracker/constants/app_colors.dart';

class NutritionYearlyChart extends StatelessWidget {
  final String title;
  final double maxY;
  final List<FlSpot> spots;

  const NutritionYearlyChart({
    super.key,
    required this.title,
    required this.maxY,
    required this.spots,
  });

  @override
  Widget build(BuildContext context) {
    // Define the common color for grid and borders
    final borderColor = Colors.grey.withOpacity(0.3);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        AspectRatio(
          aspectRatio: 1.5,
          child: LineChart(
            LineChartData(
              // All four sides are now defined for a complete frame
              borderData: FlBorderData(
                show: true,
                border: Border(
                  left: BorderSide(color: borderColor, width: 1.0),
                  bottom: BorderSide(color: borderColor, width: 1.0),
                  top: BorderSide(color: borderColor, width: 1.0),
                  right: BorderSide(color: borderColor, width: 1.0),
                ),
              ),
              gridData: FlGridData(
                show: true,
                drawVerticalLine: true,
                horizontalInterval: maxY / 2,
                getDrawingHorizontalLine: (v) =>
                    FlLine(color: borderColor, dashArray: [5, 5]),
                getDrawingVerticalLine: (v) =>
                    FlLine(color: borderColor, dashArray: [5, 5]),
              ),
              titlesData: FlTitlesData(
                rightTitles: const AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                topTitles: const AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 35,
                    getTitlesWidget: (value, meta) => Text(
                      value.toStringAsFixed(1),
                      style: const TextStyle(fontSize: 10, color: Colors.grey),
                    ),
                  ),
                ),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    interval: 1,
                    getTitlesWidget: (value, meta) {
                      const months = [
                        'Apr',
                        'May',
                        'Jun',
                        'Jul',
                        'Aug',
                        'Sep',
                        'Oct',
                        'Nov',
                        'Dec',
                        'Jan',
                        'Feb',
                        'Mar',
                      ];
                      if (value.toInt() >= 0 && value.toInt() < months.length) {
                        return Text(
                          months[value.toInt()],
                          style: const TextStyle(fontSize: 9),
                        );
                      }
                      return const Text('');
                    },
                  ),
                ),
              ),
              lineBarsData: [
                LineChartBarData(
                  spots: spots,
                  isCurved: true,
                  color: AppColors.darkGreen,
                  barWidth: 2,
                  belowBarData: BarAreaData(
                    show: true,
                    color: AppColors.darkGreen.withOpacity(0.1),
                  ),
                  dotData: const FlDotData(show: true),
                ),
              ],
              minX: 0,
              maxX: 11,
              minY: 0,
              maxY: maxY,
            ),
          ),
        ),
      ],
    );
  }
}
