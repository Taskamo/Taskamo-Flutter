import 'dart:convert';

CreateEventModel createEventModelFromMap(String str) => CreateEventModel.fromMap(json.decode(str));

String createEventModelToMap(CreateEventModel data) => json.encode(data.toMap());

class CreateEventModel {
  CreateEventModel({
    this.title,
    this.date,
  });

  String? title;
  DateTime? date;

  factory CreateEventModel.fromMap(Map<String, dynamic> json) => CreateEventModel(
    title: json["title"],
    date: DateTime.parse(json["date"]),
  );

  Map<String, dynamic> toMap() => {
    "title": title,
    "date": date!.toIso8601String(),
  };
}
