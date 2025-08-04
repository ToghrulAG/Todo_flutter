import 'package:todo_app/models/todo_model.dart';

 List<TodoModel> todos = [
    TodoModel(
      id: 1,
      title: 'Buy groceries',
      isCompleted: false,
      priority: TodoPriority.medium,
    ),
    TodoModel(
      id: 2,
      title: 'Walk the dog',
      isCompleted: true,
      priority: TodoPriority.low,
    ),
    TodoModel(
      id: 3,
      title: 'Read a book',
      isCompleted: false,
      priority: TodoPriority.high,
    ),
  ];