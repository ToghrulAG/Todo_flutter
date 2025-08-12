import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/todo_model.dart';

final stringKey = 'todos';

Future<void> saveTodos(List<TodoModel> listObject) async {
  final prefs = await SharedPreferences.getInstance();

  List<Map<String, dynamic>> mappedList = listObject
      .map((todos) => todos.toMap())
      .toList();

  String jsonString = jsonEncode(mappedList);

  await prefs.setString(stringKey, jsonString);
}

Future<List<TodoModel>> loadTodos() async {
  final prefs = await SharedPreferences.getInstance();
  final jsonString = prefs.getString(stringKey);

  if (jsonString == null || jsonString.isEmpty) {
    return [];
  } else {
    final deCoded = jsonDecode(jsonString) as List<dynamic>;
    final List<TodoModel> todosObject = deCoded
        .map<TodoModel>((e) => TodoModel.fromMap(e as Map<String, dynamic>))
        .toList();
    return todosObject;
  }
}
