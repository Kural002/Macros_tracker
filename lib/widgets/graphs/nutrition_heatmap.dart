import 'package:flutter/material.dart';
import 'package:macros_tracker/constants/app_colors.dart';

class NutritionHeatmap extends StatelessWidget {
  final String title;
  final String target;
  final String month;
  final int daysInMonth;

  const NutritionHeatmap({
    super.key,
    required this.title,
    required this.target,
    this.month = "December 2025",
    this.daysInMonth = 31,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.lightGreen,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text(
            target,
            style: const TextStyle(
              color: AppColors.darkGreen,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 16),
          Center(
            child: Text(
              month,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 16),
          _buildHeatmapGrid(),
          const SizedBox(height: 16),
          _buildHeatmapLegend(),
        ],
      ),
    );
  }

  Widget _buildHeatmapGrid() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 7,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
      ),
      itemCount: daysInMonth,
      itemBuilder: (context, index) {
        return Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.5),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text("${index + 1}", style: const TextStyle(fontSize: 10)),
        );
      },
    );
  }

  Widget _buildHeatmapLegend() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("0%", style: TextStyle(fontSize: 10)),
        const SizedBox(width: 4),
        _buildLegendBox(AppColors.heatmap0),
        _buildLegendBox(AppColors.heatmap25),
        _buildLegendBox(AppColors.heatmap50),
        _buildLegendBox(AppColors.heatmap75),
        _buildLegendBox(AppColors.heatmap100),
        const SizedBox(width: 4),
        const Text("100%", style: TextStyle(fontSize: 10)),
      ],
    );
  }

  Widget _buildLegendBox(Color color) => Container(
    width: 18,
    height: 12,
    margin: const EdgeInsets.symmetric(horizontal: 2),
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(4),
    ),
  );
}
