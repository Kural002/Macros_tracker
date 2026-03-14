import 'package:flutter/material.dart';
import '../models/trend_data.dart';

class TrendsViewModel extends ChangeNotifier {
  // Dummy data for the week
  final List<DailyNutrient> _weeklyData = [
    DailyNutrient(day: 'Sun', calories: 0.3, protein: 0.6),
    DailyNutrient(day: 'Mon', calories: 0.7, protein: 0.4),
    DailyNutrient(day: 'Tue', calories: 0.5, protein: 0.8),
    DailyNutrient(day: 'Wed', calories: 0.9, protein: 0.3),
    DailyNutrient(day: 'Thu', calories: 0.4, protein: 0.7),
    DailyNutrient(day: 'Fri', calories: 0.8, protein: 0.5),
    DailyNutrient(day: 'Sat', calories: 0.2, protein: 0.9),
  ];

  List<DailyNutrient> get weeklyData => _weeklyData;

  // In a real app you would have methods to fetch data for different periods
}
