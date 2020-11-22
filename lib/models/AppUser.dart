// To parse this JSON data, do
//
//     final appUser = appUserFromJson(jsonString);

import 'dart:convert';

AppUser appUserFromJson(String str) => AppUser.fromJson(json.decode(str));

String appUserToJson(AppUser data) => json.encode(data.toJson());

class AppUser {
  AppUser({
    this.id,
    this.email,
    this.role,
    this.nombre,
    this.paterno,
    this.materno,
  });

  int id;
  String email;
  String role;
  String nombre;
  String paterno;
  String materno;

  factory AppUser.fromJson(Map<String, dynamic> json) => AppUser(
        id: json["id"],
        email: json["email"],
        role: json["role"],
        nombre: json["nombre"],
        paterno: json["paterno"],
        materno: json["materno"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "role": role,
        "nombre": nombre,
        "paterno": paterno,
        "materno": materno,
      };
}
