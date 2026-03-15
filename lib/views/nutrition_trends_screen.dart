import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:macros_tracker/widgets/custom_drawer.dart';
import 'package:macros_tracker/widgets/nutrition_dropdown.dart';
import 'package:macros_tracker/widgets/graphs/nutrition_line_chart.dart';
import 'package:macros_tracker/widgets/graphs/nutrition_heatmap.dart';
import 'package:macros_tracker/constants/app_colors.dart';
import 'package:macros_tracker/widgets/graphs/nutrition_monthly_chart.dart';
import 'package:macros_tracker/widgets/graphs/nutrition_yearly_chart.dart';

class NutritionTrendsScreen extends StatefulWidget {
  const NutritionTrendsScreen({super.key});

  @override
  State<NutritionTrendsScreen> createState() => _NutritionTrendsScreenState();
}

class _NutritionTrendsScreenState extends State<NutritionTrendsScreen> {
  String selectedNutrient = "All Nutrients";
  final List<String> nutrients = ["All Nutrients", "Calories", "Protein"];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        drawer: const CustomDrawer(),
        appBar: AppBar(
          backgroundColor: AppColors.backgroundColor,
          elevation: 0,
          leading: Builder(
            builder: (context) => IconButton(
              icon: const Icon(Icons.menu, color: Colors.black),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          ),
          title: const Text(
            "Nutrition Trends",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          bottom: const TabBar(
            isScrollable: true,
            indicatorColor: AppColors.darkGreen,
            labelColor: AppColors.darkGreen,
            unselectedLabelColor: Colors.grey,
            indicatorWeight: 3,
            dividerColor: Colors.transparent,
            tabs: [
              Tab(text: "Weekly"),
              Tab(text: "Monthly"),
              Tab(text: "Yearly"),
              Tab(text: "Heatmap"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildLineChartView(),
            _buildMonthlyView(),
            _buildYearlyView(),
            _buildHeatmapView(),
          ],
        ),
      ),
    );
  }

  Widget _buildLineChartView() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          NutritionDropdown(
            items: nutrients,
            selectedValue: selectedNutrient,
            onChanged: (value) {
              setState(() {
                selectedNutrient = value;
              });
            },
          ),
          const SizedBox(height: 30),
          if (selectedNutrient == "All Nutrients" ||
              selectedNutrient == "Calories")
            Column(
              children: [
                NutritionLineChart(
                  title: "Calories",
                  lineColor: AppColors.darkGreen,
                  spots: const [
                    FlSpot(0, 0),
                    FlSpot(1, 0),
                    FlSpot(2, 0),
                    FlSpot(3, 0),
                    FlSpot(4, 0),
                    FlSpot(5, 0),
                    FlSpot(6, 0),
                  ],
                ),
                const SizedBox(height: 40),
              ],
            ),
          if (selectedNutrient == "All Nutrients" ||
              selectedNutrient == "Protein")
            NutritionLineChart(
              title: "Protein",
              lineColor: AppColors.darkGreen,
              spots: const [
                FlSpot(0, 0),
                FlSpot(1, 0),
                FlSpot(2, 0),
                FlSpot(3, 0),
                FlSpot(4, 0),
                FlSpot(5, 0),
                FlSpot(6, 0),
              ],
            ),
        ],
      ),
    );
  }

  Widget _buildMonthlyView() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          NutritionDropdown(
            items: nutrients,
            selectedValue: selectedNutrient,
            onChanged: (value) => setState(() => selectedNutrient = value),
          ),
          const SizedBox(height: 30),
          if (selectedNutrient == "All Nutrients" ||
              selectedNutrient == "Calories")
            const NutritionMonthlyChart(
              title: "Calories",
              maxY: 876.0,
              spots: [FlSpot(0, 0), FlSpot(2, 550), FlSpot(6, 0), FlSpot(6, 0)],
            ),
          const SizedBox(height: 40),
          if (selectedNutrient == "All Nutrients" ||
              selectedNutrient == "Protein")
            const NutritionMonthlyChart(
              title: "Protein",
              maxY: 22.0,
              spots: [FlSpot(0, 0), FlSpot(2, 8), FlSpot(6, 0), FlSpot(6, 0)],
            ),
        ],
      ),
    );
  }

  Widget _buildYearlyView() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          NutritionDropdown(
            items: nutrients,
            selectedValue: selectedNutrient,
            onChanged: (value) => setState(() => selectedNutrient = value),
          ),
          const SizedBox(height: 30),
          if (selectedNutrient == "All Nutrients" ||
              selectedNutrient == "Calories")
            const NutritionYearlyChart(
              title: "Calories",
              maxY: 876.0,
              spots: [
                FlSpot(0, 0),
                FlSpot(1, 0),
                FlSpot(2, 0),
                FlSpot(3, 0),
                FlSpot(4, 0),
                FlSpot(5, 0),
                FlSpot(6, 0),
                FlSpot(7, 0),
                FlSpot(8, 0),
                FlSpot(9, 0),
                FlSpot(10, 0),
                FlSpot(11, 700),
              ],
            ),
          const SizedBox(height: 40),
          if (selectedNutrient == "All Nutrients" ||
              selectedNutrient == "Protein")
            const NutritionYearlyChart(
              title: "Protein",
              maxY: 22.0,
              spots: [
                FlSpot(0, 0),
                FlSpot(1, 0),
                FlSpot(2, 0),
                FlSpot(3, 0),
                FlSpot(4, 0),
                FlSpot(5, 0),
                FlSpot(6, 0),
                FlSpot(7, 0),
                FlSpot(8, 0),
                FlSpot(9, 0),
                FlSpot(10, 0),
                FlSpot(11, 18),
              ],
            ),
        ],
      ),
    );
  }

  Widget _buildHeatmapView() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          NutritionDropdown(
            items: nutrients,
            selectedValue: selectedNutrient,
            onChanged: (value) {
              setState(() {
                selectedNutrient = value;
              });
            },
          ),
          const SizedBox(height: 24),
          if (selectedNutrient == "All Nutrients" ||
              selectedNutrient == "Calories")
            Column(
              children: [
                const NutritionHeatmap(
                  title: "Calories",
                  target: "Target: 2000.0",
                ),
                const SizedBox(height: 24),
              ],
            ),
          if (selectedNutrient == "All Nutrients" ||
              selectedNutrient == "Protein")
            const NutritionHeatmap(title: "Protein", target: "Target: 50.0"),
        ],
      ),
    );
  }
}
