import 'package:flutter/material.dart';

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
                  icon: Icons.notifications_active_outlined,
                  title: "Reminders",
                  subtitle: "Manage your daily reminders",
                ),
                _buildDrawerItem(
                  icon: Icons.file_download_outlined,
                  title: "Export Data",
                  subtitle: "Export your macros data",
                ),
                const Divider(indent: 16, endIndent: 16),
                _buildDrawerItem(
                  icon: Icons.home,
                  title: "Home",
                  isSelected: true,
                  activeColor: darkGreen,
                ),
                _buildDrawerItem(icon: Icons.bar_chart, title: "Graph"),
                _buildDrawerItem(icon: Icons.settings, title: "Settings"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem({
    required IconData icon,
    required String title,
    String? subtitle,
    bool isSelected = false,
    Color? activeColor,
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
      subtitle: subtitle != null ? Text(subtitle) : null,
      onTap: () {},
    );
  }
}
