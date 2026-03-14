import 'package:flutter/material.dart';
import 'package:macros_tracker/widgets/simple_line_chart.dart';
import 'package:provider/provider.dart';
import '../viewmodels/trends_viewmodel.dart';

class NutritionTrendsScreen extends StatefulWidget {
  const NutritionTrendsScreen({super.key});

  @override
  State<NutritionTrendsScreen> createState() => _NutritionTrendsScreenState();
}

class _NutritionTrendsScreenState extends State<NutritionTrendsScreen> {
  int _selectedTabIndex = 0;

  final List<String> _tabs = ['Weekly', 'Monthly', 'Yearly', 'Heatmap'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Nutrition Trends',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),

              Container(
                height: 40,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: _tabs.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 8),
                  itemBuilder: (context, index) {
                    final isSelected = _selectedTabIndex == index;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedTabIndex = index;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: isSelected ? Colors.blue : Colors.transparent,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: isSelected ? Colors.blue : Colors.grey[400]!,
                          ),
                        ),
                        child: Text(
                          _tabs[index],
                          style: TextStyle(
                            color: isSelected ? Colors.white : Colors.grey[700],
                            fontWeight: isSelected
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 24),

              // "All Nutrients" header
              const Text(
                'All Nutrients',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 16),

              // Calories card with graph
              Consumer<TrendsViewModel>(
                builder: (context, viewModel, child) {
                  final data = viewModel.weeklyData;
                  final caloriesValues = data.map((e) => e.calories).toList();
                  final days = data.map((e) => e.day).toList();

                  return _buildNutrientCard(
                    title: 'Calories',
                    values: caloriesValues,
                    days: days,
                  );
                },
              ),
              const SizedBox(height: 16),

              // Protein card with graph
              Consumer<TrendsViewModel>(
                builder: (context, viewModel, child) {
                  final data = viewModel.weeklyData;
                  final proteinValues = data.map((e) => e.protein).toList();
                  final days = data.map((e) => e.day).toList();

                  return _buildNutrientCard(
                    title: 'Protein',
                    values: proteinValues,
                    days: days,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNutrientCard({
    required String title,
    required List<double> values,
    required List<String> days,
  }) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 12),
            SimpleLineChart(values: values, xLabels: days),
          ],
        ),
      ),
    );
  }
}
