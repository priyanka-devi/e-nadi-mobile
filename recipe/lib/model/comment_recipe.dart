// To parse this JSON data, do
//
//     final isiComment = isiCommentFromJson(jsonString);

import 'dart:convert';

List<IsiComment> isiCommentFromJson(String str) =>
    List<IsiComment>.from(json.decode(str).map((x) => IsiComment.fromJson(x)));

String isiCommentToJson(List<IsiComment> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class IsiComment {
  IsiComment({
    required this.model,
    required this.pk,
    required this.fields,
  });

  String model;
  int pk;
  Fields fields;

  factory IsiComment.fromJson(Map<String, dynamic> json) => IsiComment(
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
    required this.commentatorName,
    required this.commentField,
    required this.commentDate,
  });

  String commentatorName;
  String commentField;
  String commentDate;

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        commentatorName: json["username"],
        commentField: json["content"],
        commentDate: json["post_date"],
      );

  Map<String, dynamic> toJson() => {
        "username": commentatorName,
        "content": commentField,
        "post_date": commentDate,
      };
}
