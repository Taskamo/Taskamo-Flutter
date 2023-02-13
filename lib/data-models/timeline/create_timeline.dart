import 'dart:convert';

CreateTimelineModel createTimelineModelFromMap(String str) => CreateTimelineModel.fromMap(json.decode(str));

String createTimelineModelToMap(CreateTimelineModel data) => json.encode(data.toMap());

class CreateTimelineModel {
  CreateTimelineModel({
    required this.title,
    required this.description,
    required this.startAt,
    required this.endAt,
  });

  final String title;
  final String description;
  final DateTime startAt;
  final DateTime endAt;

  factory CreateTimelineModel.fromMap(Map<String, dynamic> json) => CreateTimelineModel(
    title: json["title"],
    description: json["description"],
    startAt: DateTime.parse(json["start_at"]),
    endAt: DateTime.parse(json["end_at"]),
  );

  Map<String, dynamic> toMap() => {
    "title": title,
    "description": description,
    "start_at": startAt.toIso8601String(),
    "end_at": endAt.toIso8601String(),
  };
}
