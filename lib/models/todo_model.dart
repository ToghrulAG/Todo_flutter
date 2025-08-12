class TodoModel {
  int id;
  String title;
  bool isCompleted;

  TodoModel({required this.id, required this.title, this.isCompleted = false});

  factory TodoModel.fromMap(Map<String, dynamic> map) {
    return TodoModel(
      id: map['id'],
      title: map['title'],
      isCompleted: map['isCompleted'],
    );
  }

  Map<String, dynamic> toMap() {
    return {'id': id, 'title': title, 'isCompleted': isCompleted};
  }
}
