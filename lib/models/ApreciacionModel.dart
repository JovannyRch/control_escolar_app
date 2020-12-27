// To parse this JSON data, do
//
//     final apreciacionModel = apreciacionModelFromJson(jsonString);

import 'dart:convert';

ApreciacionModel apreciacionModelFromJson(String str) => ApreciacionModel.fromJson(json.decode(str));

String apreciacionModelToJson(ApreciacionModel data) => json.encode(data.toJson());

class ApreciacionModel {
    ApreciacionModel({
        this.id,
        this.instrucciones,
        this.ciclo,
    });

    int id;
    String instrucciones;
    String ciclo;

    factory ApreciacionModel.fromJson(Map<String, dynamic> json) => ApreciacionModel(
        id: json["id"],
        instrucciones: json["instrucciones"],
        ciclo: json["ciclo"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "instrucciones": instrucciones,
        "ciclo": ciclo,
    };
}
