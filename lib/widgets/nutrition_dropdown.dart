import 'package:flutter/material.dart';
import 'package:macros_tracker/constants/app_colors.dart';

class NutritionDropdown extends StatefulWidget {
  final List<String> items;
  final String selectedValue;
  final ValueChanged<String> onChanged;

  const NutritionDropdown({
    super.key,
    required this.items,
    required this.selectedValue,
    required this.onChanged,
  });

  @override
  State<NutritionDropdown> createState() => _NutritionDropdownState();
}

class _NutritionDropdownState extends State<NutritionDropdown> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.lightGreen,
        borderRadius: BorderRadius.circular(12),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: widget.selectedValue,
          isExpanded: true,
          icon: const Icon(Icons.arrow_drop_down, color: AppColors.darkGreen),
          items: widget.items.map((String value) {
            return DropdownMenuItem<String>(value: value, child: Text(value));
          }).toList(),
          onChanged: (newValue) {
            if (newValue != null) {
              widget.onChanged(newValue);
            }
          },
        ),
      ),
    );
  }
}
