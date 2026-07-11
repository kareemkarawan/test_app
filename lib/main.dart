import 'package:flutter/material.dart';
import 'navigation/main_navigation.dart';

void main() {
  runApp(const HouseholdApp());
}

class HouseholdApp extends StatelessWidget {
  const HouseholdApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Household',
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 90, 22, 18),),
      ),
      home: const MainNavigation(),
    );
  }
}