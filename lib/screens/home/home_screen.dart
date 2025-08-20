import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/features/sharedPreferences.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/providers/todo_provider.dart';
import 'package:todo_app/screens/home/widgets/add_todo_dialog.dart';


class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final todos = ref.watch(todoProvider);
    final todoNotifier = ref.read(todoProvider.notifier);

    return Scaffold(
      appBar: AppBar(title: Text('My Todos'), centerTitle: true),
      body: todos.isEmpty
          ? Center(child: Text('Todo List Is Empty'))
          : ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                final todo = todos[index];
                return ListTile(
                  leading: Checkbox(
                    value: todo.isCompleted,
                    onChanged: (value) {
                      setState(() {
                        todo.isCompleted = value ?? false;
                      });
                      saveTodos(todos);
                    },
                  ),
                  title: Text(
                    todo.title,
                    style: TextStyle(
                      decoration: todo.isCompleted
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                  ),
                  trailing: IconButton(
                    onPressed: () {
                      todoNotifier.deleteTodo(todo.id);
                    },

                    icon: Icon(Icons.delete, color: Colors.redAccent),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newTitle = await showDialog<String>(
            context: context,
            builder: (context) => const AddTodoDialog(),
          );
          if (newTitle != null && newTitle.isNotEmpty) {
            todoNotifier.addNewTodo(newTitle);
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}





