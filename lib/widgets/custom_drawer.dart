import 'package:flutter/material.dart';
import 'package:macros_tracker/views/export_data_screen.dart';
import 'package:macros_tracker/views/reminders_screen.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    const darkGreen = Color(0xFF4C662B);
    const lightGreen = Color(0xFFD8E6A7);
    const backgroundColor = Color(0xFFF9F9F0);

    return Drawer(
      backgroundColor: backgroundColor,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(top: 60, bottom: 30),
            color: lightGreen,
            child: Column(
              children: [
                const Icon(Icons.health_and_safety, size: 60, color: darkGreen),
                const SizedBox(height: 12),
                const Text(
                  "Macros Tracker",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: darkGreen,
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                _buildDrawerItem(
                  context: context,
                  icon: Icons.notifications_active_outlined,
                  title: "Reminders",
                  subtitle: "Manage your daily reminders",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RemindersScreen(),
                      ),
                    );
                  },
                ),
                _buildDrawerItem(
                  context: context,
                  icon: Icons.file_download_outlined,
                  title: "Export Data",
                  subtitle: "Export your macros data",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ExportDataScreen(),
                      ),
                    );
                  },
                ),

                const Divider(indent: 16, endIndent: 16),
                _buildDrawerItem(
                  context: context,
                  icon: Icons.home,
                  title: "Home",
                  isSelected: true,
                  activeColor: darkGreen,
                ),
                _buildDrawerItem(
                  context: context,
                  icon: Icons.bar_chart,
                  title: "Graph",
                ),
                _buildDrawerItem(
                  context: context,
                  icon: Icons.settings,
                  title: "Settings",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem({
    required BuildContext context,
    required IconData icon,
    required String title,
    String? subtitle,
    bool isSelected = false,
    Color? activeColor,
    VoidCallback? onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: isSelected ? activeColor : Colors.black87),
      title: Text(
        title,
        style: TextStyle(
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          color: isSelected ? activeColor : Colors.black87,
        ),
      ),
      subtitle: subtitle != null
          ? Text(subtitle, style: const TextStyle(fontSize: 12))
          : null,
      onTap:
          onTap ??
          () {
            Navigator.pop(context);
          },
    );
  }
}
