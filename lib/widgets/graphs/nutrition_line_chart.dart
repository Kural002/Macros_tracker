import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:macros_tracker/constants/app_colors.dart';

class NutritionLineChart extends StatelessWidget {
  final String title;
  final Color lineColor;
  final List<FlSpot> spots;

  const NutritionLineChart({
    super.key,
    required this.title,
    this.lineColor = AppColors.darkGreen,
    required this.spots,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        AspectRatio(aspectRatio: 1.7, child: LineChart(_buildLineChartData())),
      ],
    );
  }

  LineChartData _buildLineChartData() {
    return LineChartData(
      gridData: _buildGridData(),
      titlesData: _buildTitlesData(),
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: AppColors.gridColor, width: 1),
      ),
      minX: 0,
      maxX: 6,
      minY: 0,
      maxY: 1.0,
      lineBarsData: [_buildLineChartBarData()],
    );
  }

  FlGridData _buildGridData() {
    return FlGridData(
      show: true,
      drawVerticalLine: true,
      horizontalInterval: 0.5,
      verticalInterval: 1,
      getDrawingHorizontalLine: (value) =>
          FlLine(color: AppColors.gridColor, strokeWidth: 1, dashArray: [5, 5]),
      getDrawingVerticalLine: (value) =>
          FlLine(color: AppColors.gridColor, strokeWidth: 1, dashArray: [5, 5]),
    );
  }

  FlTitlesData _buildTitlesData() {
    return FlTitlesData(
      show: true,
      rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
      topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
      leftTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          interval: 0.5,
          getTitlesWidget: (value, meta) => Text(
            value.toStringAsFixed(1),
            style: const TextStyle(fontSize: 12, color: Colors.grey),
          ),
          reservedSize: 30,
        ),
      ),
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          getTitlesWidget: (value, meta) => _buildDayLabel(value.toInt()),
        ),
      ),
    );
  }

  Widget _buildDayLabel(int dayIndex) {
    const days = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
    if (dayIndex >= 0 && dayIndex < days.length) {
      return Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Text(
          days[dayIndex],
          style: const TextStyle(fontSize: 10, color: Colors.grey),
        ),
      );
    }
    return const Text('');
  }

  LineChartBarData _buildLineChartBarData() {
    return LineChartBarData(
      spots: spots,
      isCurved: false,
      color: lineColor,
      barWidth: 2,
      dotData: FlDotData(
        show: true,
        getDotPainter: (spot, percent, barData, index) =>
            FlDotCirclePainter(radius: 3, color: lineColor, strokeWidth: 0),
      ),
    );
  }
}
