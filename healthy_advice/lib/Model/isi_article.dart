// To parse this JSON data, do
//
//     final isiArticle = isiArticleFromJson(jsonString);

import 'dart:convert';

List<IsiArticle> isiArticleFromJson(String str) => List<IsiArticle>.from(json.decode(str).map((x) => IsiArticle.fromJson(x)));

String isiArticleToJson(List<IsiArticle> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class IsiArticle {
  IsiArticle({
    required this.model,
    required this.pk,
    required this.fields,
  });

  String model;
  int pk;
  FieldsArticle fields;

  factory IsiArticle.fromJson(Map<String, dynamic> json) => IsiArticle(
    model: json["model"],
    pk: json["pk"],
    fields: FieldsArticle.fromJson(json["fields"]),
  );

  Map<String, dynamic> toJson() => {
    "model": model,
    "pk": pk,
    "fields": fields.toJson(),
  };
}

class FieldsArticle {
  FieldsArticle({
    required this.title,
    required this.imageLink,
    required this.imageArticle,
    required this.deskripsi,
    required this.createdAt,
  });

  String title;
  String imageLink;
  String imageArticle;
  String deskripsi;
  String createdAt;

  factory FieldsArticle.fromJson(Map<String, dynamic> json) => FieldsArticle(
    title: json["title"],
    imageLink: json["image_link"],
    imageArticle: json["image_article"],
    deskripsi: json["deskripsi"],
    createdAt: json["created_at"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "image_link": imageLink,
    "image_article": imageArticle,
    "deskripsi": deskripsi,
    "created_at": createdAt,
  };
}
