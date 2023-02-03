import 'dart:convert';

TodosModel todosModelFromMap(Map<String, dynamic> str) =>
    TodosModel.fromMap(str);

String todosModelToMap(TodosModel data) => json.encode(data.toMap());

class TodosModel {
  TodosModel({
    required this.data,
  });

  final List<Todo> data;

  factory TodosModel.fromMap(Map<String, dynamic> json) => TodosModel(
        data: List<Todo>.from(json["data"].map((x) => Todo.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
      };
}

class Todo {
  Todo({
    this.id,
    this.title,
    this.description,
    this.status,
  });

  final int? id;
  final String? title;
  final String? description;
  final String? status;

  factory Todo.fromMap(Map<String, dynamic> json) => Todo(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        status: json["status"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "description": description,
        "status": status,
      };
}
