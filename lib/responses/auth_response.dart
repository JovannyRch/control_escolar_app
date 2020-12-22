import 'dart:convert';

AuthResponse authResponseFromJson(String str) =>
    AuthResponse.fromJson(json.decode(str));

String authResponseToJson(AuthResponse data) => json.encode(data.toJson());

class AuthResponse {
  AuthResponse({
    this.user,
    this.access_token,
  });

  User user;
  String access_token;

  factory AuthResponse.fromJson(Map<String, dynamic> json) => AuthResponse(
        user: User.fromJson(json["user"]),
        access_token: json["access_token"],
      );

  Map<String, dynamic> toJson() => {
        "user": user.toJson(),
        "access_token": access_token,
      };
}

class User {
  User({
    this.id,
    this.createdAt,
    this.email,
    this.nombre,
    this.role,
  });

  int id;
  DateTime createdAt;
  String email;
  String nombre;
  String paterno;
  String materno;
  String role;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        createdAt: DateTime.parse(json["createdAt"]),
        email: json["email"],
        nombre: json["nombre"],
        role: json["role"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "createdAt": createdAt.toIso8601String(),
        "email": email,
        "nombre": nombre,
        "role": role,
      };
}
