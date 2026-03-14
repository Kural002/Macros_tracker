import 'package:flutter/material.dart';
import '../models/food_item.dart';

class MacroViewModel extends ChangeNotifier {
  List<FoodItem> _foodItems = [];
  double _totalCalories = 0.0;
  double _totalProtein = 0.0;

  List<FoodItem> get foodItems => _foodItems;
  double get totalCalories => _totalCalories;
  double get totalProtein => _totalProtein;

  void addFoodItem(FoodItem item) {
    _foodItems.add(item);
    _totalCalories += item.calories;
    _totalProtein += item.protein;
    notifyListeners();
  }
}
