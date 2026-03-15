import 'package:flutter/material.dart';
import 'package:macros_tracker/widgets/custom_drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const darkGreen = Color(0xFF4C662B);
    const lightGreen = Color(0xFFD8E6A7);
    const backgroundColor = Color(0xFFF9F9F0);

    return Scaffold(
      backgroundColor: backgroundColor,
      drawer: CustomDrawer(),
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              color: Colors.black,
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        title: const Text(
          "Macros Tracker",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),

            Center(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: lightGreen,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(
                      Icons.calendar_today_outlined,
                      size: 18,
                      color: darkGreen,
                    ),
                    SizedBox(width: 8),
                    Text(
                      "Saturday, March 14",
                      style: TextStyle(
                        color: darkGreen,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 30),

            // 2. Daily Progress Card
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Daily Progress",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  _buildMacroRow("Calories", "0.0/2000 kcal", 0.0, darkGreen),
                  const SizedBox(height: 20),
                  _buildMacroRow("Protein", "0.0/50 g", 0.0, darkGreen),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // 3. Food Items Section Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Food Items",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text("0 items", style: TextStyle(color: Colors.grey.shade600)),
              ],
            ),
            const Text(
              "Track your daily nutrition",
              style: TextStyle(color: Colors.grey),
            ),

            const SizedBox(height: 60),

            // 4. Empty State
            Center(
              child: Column(
                children: [
                  Icon(
                    Icons.restaurant,
                    size: 80,
                    color: lightGreen.withOpacity(0.7),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "No food items added for today",
                    style: TextStyle(fontSize: 16, color: Colors.black54),
                  ),
                  const Text(
                    "Tap the + button to add food items",
                    style: TextStyle(color: Colors.black54),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      // 5. Floating Action Button
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        backgroundColor: darkGreen,
        icon: const Icon(Icons.add, color: Colors.white),
        label: const Text("Add Food", style: TextStyle(color: Colors.white)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
    );
  }

  // Helper method to build the progress bar rows
  Widget _buildMacroRow(
    String title,
    String trailing,
    double progress,
    Color color,
  ) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
            Text(trailing, style: const TextStyle(color: Colors.grey)),
          ],
        ),
        const SizedBox(height: 8),
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: LinearProgressIndicator(
            value: progress, // 0.0 to 1.0
            minHeight: 10,
            backgroundColor: Colors.grey.shade200,
            valueColor: AlwaysStoppedAnimation<Color>(color),
          ),
        ),
      ],
    );
  }
}
