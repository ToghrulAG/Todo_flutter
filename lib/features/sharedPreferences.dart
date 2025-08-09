import 'package:shared_preferences/shared_preferences.dart';
import '../models/todo_model.dart';
import 'dart:convert';

class SharedPreferenceStorage {
  final String todosKey = 'Todo';

  Future<List<TodoModel>> loadTodos() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(todosKey);

    if (jsonString == null || jsonString.isEmpty) {
      return [];
    } else {
      final List<dynamic> decoded = jsonDecode(jsonString);

      final todoObjects = decoded
          .map((e) => TodoModel.fromMap(Map<String, dynamic>.from(e as Map)))
          .toList();

      return todoObjects;
    }
  }
  Future<void> saveTodos(List<TodoModel> todos) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonList = todos.map((todo) => todo.toMap()).toList();
    final jsonString = jsonEncode(jsonList);
    await prefs.setString(todosKey, jsonString);
  }
}


 