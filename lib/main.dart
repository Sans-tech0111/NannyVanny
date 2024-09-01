import 'package:flutter/material.dart';
import 'package:nannyvanny/drawer_screen.dart';
import 'package:nannyvanny/home_screen.dart';
import 'package:nannyvanny/theme/custom_theme.dart';

void main() {
  runApp(HomePage());
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: customThemeData(),
      home: Scaffold(
      body: Stack(
        children: [DrawerScreen(),HomeScreen()],
      ),
    ),
    );
  }
}
