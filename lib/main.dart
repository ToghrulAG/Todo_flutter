import 'package:flutter/material.dart';
import 'screens/home/home_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: AppLaunch()));
}

class AppLaunch extends StatelessWidget {
  const AppLaunch({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(body: HomeScreen()));
  }
}
