class TodoModel {
  int id;
  String title;
  bool isCompleted;
  TodoPriority priority;

  TodoModel({
    required this.id,
    required this.title,
    this.isCompleted = false,
    required this.priority
  });
}

enum TodoPriority {
  low,
  medium,
  high
}