import 'dart:convert';

EventsModel eventsModelFromMap(Map<String, dynamic> str) =>
    EventsModel.fromMap(str);

String eventsModelToMap(EventsModel data) => json.encode(data.toMap());

class EventsModel {
  EventsModel({
    required this.data,
  });

  final List<EventModel> data;

  factory EventsModel.fromMap(Map<String, dynamic> json) => EventsModel(
        data: List<EventModel>.from(json["data"].map((x) => EventModel.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
      };
}

class EventModel {
  EventModel({
    this.id,
    this.title,
    this.dateAgo,
    this.month,
    this.day,
    this.year,
  });

  final int? id;
  final String? title;
  final String? dateAgo;
  final String? month;
  final int? day;
  final int? year;

  factory EventModel.fromMap(Map<String, dynamic> json) => EventModel(
        id: json["id"],
        title: json["title"],
        dateAgo: json["date_ago"],
        month: json["month"],
        day: json["day"],
        year: json["year"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "date_ago": dateAgo,
        "month": month,
        "day": day,
        "year": year,
      };
}
