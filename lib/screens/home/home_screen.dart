import 'package:todo_app/features/sharedPreferences.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/screens/home/widgets/add_todo_dialog.dart';
import '../../models/todo_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<TodoModel> todos = [];

  @override
  void initState() {
    super.initState();
    _loadTodosFromStorage();
  }

  void _addTodosDialog() {
    showDialog(context: context, builder: (context) {
      return const AddTodoDialog();
    });
  }

  void _loadTodosFromStorage() async {
    // final loadedTodos = await loadTodos();
    // setState(() {
    //   todos = loadedTodos;
    // });
    setState(() {
      todos = [
        TodoModel(id: 1, title: 'Первая задача', isCompleted: false),
        TodoModel(id: 2, title: 'Вторая задача', isCompleted: true),
        TodoModel(id: 3, title: 'Трецая задача', isCompleted: false),
        TodoModel(id: 1, title: 'Первая задача', isCompleted: false),
        TodoModel(id: 2, title: 'Вторая задача', isCompleted: true),
        TodoModel(id: 3, title: 'Трецая задача', isCompleted: false),
      ];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My Todos'), centerTitle: true),
      body: todos.isEmpty ?
      Center(
        child: Text('Todo List Is Empty'),
      ) : ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          final todo = todos[index];
          return ListTile(title: Text(todo.title));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addTodosDialog,
        child: Icon(Icons.add),
      ),
    );
  }
}
