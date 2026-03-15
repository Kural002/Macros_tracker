import 'package:flutter/material.dart';
import 'package:macros_tracker/widgets/main_navigation.dart';
import 'package:provider/provider.dart';
import 'viewmodels/macro_viewmodel.dart';
import 'viewmodels/trends_viewmodel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MacroViewModel()),
        ChangeNotifierProvider(create: (_) => TrendsViewModel()),
      ],
      child: MaterialApp(
        title: 'Macros Tracker',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFF4C662B),
            primary: const Color(0xFF4C662B),
            surface: const Color(0xFFF9F9F0),
            secondaryContainer: const Color(0xFFD8E6A7),
            onSecondaryContainer: const Color(0xFF131F00),
          ),
          navigationBarTheme: NavigationBarThemeData(
            backgroundColor: const Color(0xFFF3F4E9),
            indicatorColor: const Color(0xFFD8E6A7),
            labelTextStyle: WidgetStateProperty.all(
              const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
            ),
          ),
        ),
        home: MainNavigation(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
