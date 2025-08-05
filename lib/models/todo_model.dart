import 'package:flutter/foundation.dart';

class TodoModel {
  int id;
  String title;
  bool isCompleted;
  TodoPriority priority;

  TodoModel({
    required this.id,
    required this.title,
    this.isCompleted = false,
    required this.priority,
  });

  // DATA TO JSON 

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'isCompleted': isCompleted,
      'priority': priority.index,
    };
  }

  // JSON TO DATA
  
  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
      id: json['id'],
      title: json['title'],
      isCompleted: json['isCompleted'] ?? false,
      priority: TodoPriority.values[json['priority']],
    );
  }
}

enum TodoPriority { low, medium, high }
