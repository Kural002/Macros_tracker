import 'package:flutter/material.dart';

class TrackingTile extends StatelessWidget {
  final String title;
  final String goal;
  final VoidCallback? onTap;

  const TrackingTile({
    super.key,
    required this.title,
    required this.goal,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 1),
      title: Text(
        title,
        style: const TextStyle(fontSize: 16, color: Colors.black87),
      ),
      subtitle: Text(goal, style: const TextStyle(color: Colors.black54)),
      trailing: const Icon(Icons.edit_outlined, size: 20, color: Colors.black),
      onTap: onTap,
    );
  }
}
