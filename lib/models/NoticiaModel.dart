// To parse this JSON data, do
//
//     final noticiaModel = noticiaModelFromJson(jsonString);

import 'dart:convert';

List<NoticiaModel> noticiaModelFromJson(String str) => List<NoticiaModel>.from(json.decode(str).map((x) => NoticiaModel.fromJson(x)));

String noticiaModelToJson(List<NoticiaModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class NoticiaModel {
    NoticiaModel({
        this.id,
        this.title,
        this.body,
        this.img,
        this.createdAt,
        this.updatedAt,
    });

    int id;
    String title;
    String body;
    String img;
    DateTime createdAt;
    DateTime updatedAt;

    factory NoticiaModel.fromJson(Map<String, dynamic> json) => NoticiaModel(
        id: json["id"],
        title: json["title"],
        body: json["body"],
        img: json["img"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "body": body,
        "img": img,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
