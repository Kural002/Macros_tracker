import 'package:flutter/material.dart';
import 'package:macros_tracker/widgets/main_navigation.dart';
import 'package:provider/provider.dart';
import 'viewmodels/macro_viewmodel.dart';
import 'viewmodels/trends_viewmodel.dart';
import 'views/home_screen.dart';
import 'views/nutrition_trends_screen.dart';

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
        theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
        home: MainNavigation(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
