import 'package:flutter/material.dart';

class SettingsViewModel extends ChangeNotifier {
  final List<Map<String, dynamic>> _trackingItems = [
    {'name': 'Calories', 'goal': 2000.0, 'unit': 'kcal'},
    {'name': 'Protein', 'goal': 50.0, 'unit': 'g'},
  ];

  List<Map<String, dynamic>> get trackingItems => _trackingItems;

  String _language = 'English';
  String get language => _language;

  void updateLanguage(String newLanguage) {
    _language = newLanguage;
    notifyListeners();
  }
}
