// To parse this JSON data, do
//
//     final preguntaApreciacionModel = preguntaApreciacionModelFromJson(jsonString);

import 'dart:convert';

List<PreguntaApreciacionModel> preguntaApreciacionModelFromJson(String str) =>
    List<PreguntaApreciacionModel>.from(
        json.decode(str).map((x) => PreguntaApreciacionModel.fromJson(x)));

String preguntaApreciacionModelToJson(List<PreguntaApreciacionModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PreguntaApreciacionModel {
  PreguntaApreciacionModel({
    this.id,
    this.pregunta,
  });

  int id;
  String pregunta;

  factory PreguntaApreciacionModel.fromJson(Map<String, dynamic> json) =>
      PreguntaApreciacionModel(
        id: json["id"],
        pregunta: json["pregunta"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "pregunta": pregunta,
      };
}
