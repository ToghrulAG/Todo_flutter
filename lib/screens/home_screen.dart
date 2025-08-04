import 'package:flutter/material.dart';
import '../data/list_db.dart';
import '../models/todo_model.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo App'),
        centerTitle: true,
      ),

      body: Column(
        children: [Text('data')],
        
      ),
    );
  }
}
