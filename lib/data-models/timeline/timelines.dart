import 'dart:convert';

TimelinesModel timelinesModelFromMap(Map<String, dynamic> str) => TimelinesModel.fromMap(str);

String timelinesModelToMap(TimelinesModel data) => json.encode(data.toMap());

class TimelinesModel {
  TimelinesModel({
    required this.data,
  });

  final List<TimelineModel> data;

  factory TimelinesModel.fromMap(Map<String, dynamic> json) => TimelinesModel(
    data: List<TimelineModel>.from(json["data"].map((x) => TimelineModel.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "data": List<dynamic>.from(data.map((x) => x.toMap())),
  };
}

class TimelineModel {
  TimelineModel({
    required this.id,
    required this.title,
    required this.description,
    required this.startAt,
    required this.endAt,
  });

  final int id;
  final String title;
  final String description;
  final DateTime startAt;
  final DateTime endAt;

  factory TimelineModel.fromMap(Map<String, dynamic> json) => TimelineModel(
    id: json["id"],
    title: json["title"],
    description: json["description"],
    startAt: DateTime.parse(json["start_at"]),
    endAt: DateTime.parse(json["end_at"]),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "title": title,
    "description": description,
    "start_at": startAt.toIso8601String(),
    "end_at": endAt.toIso8601String(),
  };
}
