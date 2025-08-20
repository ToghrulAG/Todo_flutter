import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/features/sharedPreferences.dart';
import '../models/todo_model.dart';

final todoProvider = StateNotifierProvider<TodoNotifier, List<TodoModel>>((
  ref,
) {
  return TodoNotifier();
});

class TodoNotifier extends StateNotifier<List<TodoModel>> {
  TodoNotifier() : super([]) {
    _loadTodos();
  }

  Future<void> _loadTodos() async {
    final loadedTodos = await loadTodos();
    state = loadedTodos;
  }

  Future<void> addNewTodo(String title) async {
    final newTodo = TodoModel(
      id: state.length + 1,
      title: title,
      isCompleted: false,
    );
    state = [...state, newTodo];
    await saveTodos(state);
  }

  Future <void> deleteTodo(int id) async {
    state = state.where((todo) => todo.id != id).toList();
    await saveTodos(state);

  }

  
}
