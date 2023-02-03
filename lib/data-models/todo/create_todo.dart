import 'dart:convert';

CreateTodoModel createTodoModelFromMap(String str) =>
    CreateTodoModel.fromMap(json.decode(str));

String createTodoModelToMap(CreateTodoModel data) => json.encode(data.toMap());

class CreateTodoModel {
  CreateTodoModel({
    this.title,
    this.description,
    this.status,
  });

  String? title;
  String? description;
  String? status;

  factory CreateTodoModel.fromMap(Map<String, dynamic> json) => CreateTodoModel(
        title: json["title"],
        description: json["description"],
        status: json["status"],
      );

  Map<String, dynamic> toMap() => {
        "title": title,
        "description": description,
        "status": status,
      };
}
