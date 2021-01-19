import 'package:control_escolar/models/GruposMateriaModel.dart';
import 'package:control_escolar/models/MateriaProfesorModel.dart';
import 'package:control_escolar/models/User.dart';
import 'package:control_escolar/responses/auth_response.dart';

class Mock {
  static delay() async {
    await Future.delayed(Duration(seconds: 1));
  }

  static Future<AuthResponse> mockTeacherUser() async {
    await delay();
    User user = new User(
        id: 1,
        email: "profesor1@gmail.com",
        role: "profesor",
        materno: "materno",
        paterno: "paterno",
        cuenta: "1521004",
        nombre: "Profesor");
    return new AuthResponse(user: user, accessToken: "123asd");
  }

  static Future<List<MateriaProfesorModel>> materiasProfesor() async {
    await delay();
    return [
      new MateriaProfesorModel(
        id: 1,
        nombre: "Matemáticas 1",
      ),
      new MateriaProfesorModel(
        id: 2,
        nombre: "Matemáticas 2",
      ),
      new MateriaProfesorModel(
        id: 3,
        nombre: "Programación",
      ),
    ];
  }

  static Future<List<GruposMateriaModel>> gruposPorMateriaProfesor() async {
    await delay();
    return [
      new GruposMateriaModel(id: 1, nombre: "Grupo a "),
      new GruposMateriaModel(id: 2, nombre: "Grupo b "),
      new GruposMateriaModel(id: 3, nombre: "Grupo c "),
    ];
  }
}
