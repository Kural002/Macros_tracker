import 'package:flutter/material.dart';
import 'package:macros_tracker/widgets/custom_drawer.dart';
import 'package:macros_tracker/widgets/settings_card.dart';
import 'package:macros_tracker/widgets/tracking_tile.dart';
import 'package:macros_tracker/constants/app_colors.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      drawer: const CustomDrawer(),
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
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
          "Settings",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          SettingsCard(
            icon: Icons.track_changes,
            title: 'Tracking',
            subtitle: 'Select nutrients to track',
          ),
          const SizedBox(height: 24),
          const Text(
            'Currently Tracking',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Container(
            decoration: BoxDecoration(
              color: AppColors.settingsCardBg,
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Column(
              children: [
                TrackingTile(title: "Calories", goal: "Goal: 2000.0 kcal"),
                Divider(height: 1, indent: 16, endIndent: 16),
                TrackingTile(title: "Protein", goal: "Goal: 50.0 g"),
              ],
            ),
          ),
          const SizedBox(height: 12),
          const Divider(),
          const SizedBox(height: 12),
          SettingsCard(
            icon: Icons.public,
            title: 'Language',
            subtitle: 'English',
          ),
          const SizedBox(height: 12),
          SettingsCard(
            icon: Icons.shield_outlined,
            title: 'Privacy Policy',
            subtitle: 'View our privacy policy',
          ),
          const SizedBox(height: 12),
          SettingsCard(
            icon: Icons.gavel,
            title: 'Terms & Conditions',
            subtitle: 'Read our terms of service',
          ),
          const SizedBox(height: 12),
          SettingsCard(
            icon: Icons.support,
            title: 'Support',
            subtitle: 'Get help and contact us',
          ),
          const SizedBox(height: 12),
          SettingsCard(
            icon: Icons.lightbulb_outline,
            title: 'Request Feature',
            subtitle: 'Suggest new features',
          ),
        ],
      ),
    );
  }
}
