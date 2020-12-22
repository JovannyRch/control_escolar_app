class UserRole {
  static final String alumno = "alumno";
  static final String padre = "padre";
  static final String profesor = "profesor";
}

class User {
  User(
      {this.id,
      this.email,
      this.nombre,
      this.role,
      this.materno,
      this.paterno});

  int id;
  String email;
  String nombre;
  String paterno;
  String materno;
  String role;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        email: json["email"],
        nombre: json["nombre"],
        role: json["role"],
        materno: json['materno'],
        paterno: json['paterno'],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "nombre": nombre,
        "role": role,
        "materno": materno,
        "paterno": paterno
      };
}
