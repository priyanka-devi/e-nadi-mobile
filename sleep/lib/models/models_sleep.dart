// To parse this JSON data, do
//
//     final sleep = sleepFromJson(jsonString);

import 'dart:convert';

List<Sleep> sleepFromJson(String str) =>
    List<Sleep>.from(json.decode(str).map((x) => Sleep.fromJson(x)));

String sleepToJson(List<Sleep> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Sleep {
  Sleep({
    required this.model,
    required this.pk,
    required this.fields,
  });

  String model;
  int pk;
  Fields fields;

  factory Sleep.fromJson(Map<String, dynamic> json) => Sleep(
        model: json["model"],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
      );

  Map<String, dynamic> toJson() => {
        "model": model,
        "pk": pk,
        "fields": fields.toJson(),
      };
}

class Fields {
  Fields({
    required this.user,
    required this.today,
    required this.time,
  });

  int user;
  String today;
  int time;

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"],
        // today: DateTime.parse(json["today"]),
        today: json["today"],
        time: json["time"],
      );

  Map<String, dynamic> toJson() => {
        "user": user,
        // "today":
        //     "${today.year.toString().padLeft(4, '0')}-${today.month.toString().padLeft(2, '0')}-${today.day.toString().padLeft(2, '0')}",
        "today": today,
        "time": time,
      };
}
