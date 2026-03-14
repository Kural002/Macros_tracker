class DailyNutrient {
  final String day; // e.g., "Sun", "Mon"
  final double calories; // value between 0 and 1 (normalized)
  final double protein; // value between 0 and 1

  DailyNutrient({
    required this.day,
    required this.calories,
    required this.protein,
  });
}
