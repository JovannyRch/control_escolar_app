// To parse this JSON data, do
//
//     final profesorPreviewModel = profesorPreviewModelFromJson(jsonString);

import 'dart:convert';

List<ProfesorPreviewModel> profesorPreviewModelFromJson(String str) => List<ProfesorPreviewModel>.from(json.decode(str).map((x) => ProfesorPreviewModel.fromJson(x)));

String profesorPreviewModelToJson(List<ProfesorPreviewModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProfesorPreviewModel {
    ProfesorPreviewModel({
        this.materiaId,
        this.profesorId,
        this.claseId,
        this.profesor,
        this.nombre,
    });

    int materiaId;
    int profesorId;
    int claseId;
    String profesor;
    String nombre;

    factory ProfesorPreviewModel.fromJson(Map<String, dynamic> json) => ProfesorPreviewModel(
        materiaId: json["materia_id"],
        profesorId: json["profesor_id"],
        claseId: json["clase_id"],
        profesor: json["profesor"],
        nombre: json["nombre"],
    );

    Map<String, dynamic> toJson() => {
        "materia_id": materiaId,
        "profesor_id": profesorId,
        "clase_id": claseId,
        "profesor": profesor,
        "nombre": nombre,
    };
}
