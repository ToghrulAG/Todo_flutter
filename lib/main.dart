import 'package:flutter/material.dart';
import 'screens/home/home_screen.dart';

void main() {
  runApp(const AppLaunch());
}

class AppLaunch extends StatelessWidget {
  const AppLaunch({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: HomeScreen(),
      ),
    );
  }
}