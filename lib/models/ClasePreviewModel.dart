// To parse this JSON data, do
//
//     final clasePreviewModel = clasePreviewModelFromJson(jsonString);

import 'dart:convert';

List<ClasePreviewModel> clasePreviewModelFromJson(String str) =>
    List<ClasePreviewModel>.from(
        json.decode(str).map((x) => ClasePreviewModel.fromJson(x)));

String clasePreviewModelToJson(List<ClasePreviewModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ClasePreviewModel {
  ClasePreviewModel({this.claseId, this.materia, this.promedio, this.profesor});

  int claseId;
  String materia;
  String promedio;
  String profesor;

  factory ClasePreviewModel.fromJson(Map<String, dynamic> json) =>
      ClasePreviewModel(
        claseId: json["clase_id"],
        materia: json["materia"],
        promedio: json["promedio"],
        profesor: json["profesor"],
      );

  Map<String, dynamic> toJson() => {
        "clase_id": claseId,
        "materia": materia,
        "promedio": promedio,
        "profesor": profesor,
      };
}
