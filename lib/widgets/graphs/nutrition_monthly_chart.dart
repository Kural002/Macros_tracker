import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class NutritionMonthlyChart extends StatelessWidget {
  final String title;
  final double maxY;
  final List<FlSpot> spots;

  const NutritionMonthlyChart({
    super.key,
    required this.title,
    required this.maxY,
    required this.spots,
  });

  @override
  Widget build(BuildContext context) {
    const darkGreen = Color(0xFF4C662B);
    const gridColor = Color(0xFFD1D1D1);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        AspectRatio(
          aspectRatio: 1.7,
          child: LineChart(
            LineChartData(
              gridData: FlGridData(
                show: true,
                drawVerticalLine: true,
                horizontalInterval: maxY / 2,
                getDrawingHorizontalLine: (value) =>
                    FlLine(color: gridColor, strokeWidth: 1, dashArray: [5, 5]),
                getDrawingVerticalLine: (value) =>
                    FlLine(color: gridColor, strokeWidth: 1, dashArray: [5, 5]),
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
                    getTitlesWidget: (value, meta) {
                      switch (value.toInt()) {
                        case 0:
                          return const Text(
                            'W1',
                            style: TextStyle(fontSize: 10),
                          );
                        case 2:
                          return const Text(
                            'W2',
                            style: TextStyle(fontSize: 10),
                          );
                        case 4:
                          return const Text(
                            'W3',
                            style: TextStyle(fontSize: 10),
                          );
                        case 6:
                          return const Text(
                            'W4',
                            style: TextStyle(fontSize: 10),
                          );
                      }
                      return const Text('');
                    },
                  ),
                ),
              ),
              borderData: FlBorderData(
                show: true,
                border: Border.all(color: gridColor),
              ),
              lineBarsData: [
                LineChartBarData(
                  spots: spots,
                  isCurved: true,
                  color: darkGreen,
                  barWidth: 2,
                  isStrokeCapRound: true,
                  dotData: const FlDotData(show: true),
                  belowBarData: BarAreaData(
                    show: true,
                    color: darkGreen.withOpacity(0.1),
                  ),
                ),
              ],
              minX: 0,
              maxX: 6,
              minY: 0,
              maxY: maxY,
            ),
          ),
        ),
      ],
    );
  }
}
