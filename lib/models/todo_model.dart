class TodoModel {
  //    ToDo MODEL FIELDS

  int id;
  String title;
  bool isComplated;
  Priority priority;

  //    CONSTRUCTOR FOR THESE FIELDS

  TodoModel({
    required this.id,
    required this.title,
    this.isComplated = false,
    this.priority = Priority.no,
  });

  //    FROM DART-OBJECT TO MAP (READY TO BE JSON FORMAT)

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'isComplated': isComplated,
      'priority': priority,
    };
  }

  //    FROM MAP (READY TO BE JSON FORMAT) TO DART-OJBECT FORMAT

  factory TodoModel.fromMap(Map<String, dynamic> mapData) {
    return TodoModel(
      id: mapData['id'],
      title: mapData['title'],
      isComplated: mapData['isComplated'],

//      JUST TRYING TO FIND FIRST FINDABLE ENUM VALUE FROM MAP
//      AND REPLACE IT TO priority FIELD OF NEW TodoModel OBJECT
//      WHEN IT CANT FIND ENUM VALUE, IT WILL KEEP A DEFAULT VALUE "no"

      priority: Priority.values.firstWhere(
        (find) => find.name == mapData['Priority'],
        orElse: () => Priority.no,
      ),
    );
  }
}
//    ToDo Priority levels enum

enum Priority { low, medium, high, no }
