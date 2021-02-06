import 'package:control_escolar/models/AlumnoModel.dart';
import 'package:control_escolar/models/ClaseModel.dart';
import 'package:control_escolar/models/GruposMateriaModel.dart';
import 'package:control_escolar/models/HorarioModel.dart';
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

  static Future<List<AlumnoModel>> alumnos() async {
    await delay();
    return [
      new AlumnoModel(
          id: 1, nombre: "alumno 1", paterno: "paterno", materno: "materno"),
      new AlumnoModel(
          id: 2, nombre: "alumno 2", paterno: "paterno", materno: "materno"),
      new AlumnoModel(
          id: 3, nombre: "alumno 3", paterno: "paterno", materno: "materno"),
      new AlumnoModel(
          id: 4, nombre: "alumno 4", paterno: "paterno", materno: "materno"),
      new AlumnoModel(
          id: 5, nombre: "alumno 5", paterno: "paterno", materno: "materno"),
      new AlumnoModel(
          id: 6, nombre: "alumno 6", paterno: "paterno", materno: "materno"),
      new AlumnoModel(
          id: 7, nombre: "alumno 7", paterno: "paterno", materno: "materno"),
      new AlumnoModel(
          id: 8, nombre: "alumno 8", paterno: "paterno", materno: "materno"),
      new AlumnoModel(
          id: 9, nombre: "alumno 9", paterno: "paterno", materno: "materno"),
      new AlumnoModel(
          id: 10, nombre: "alumno 10", paterno: "paterno", materno: "materno"),
      new AlumnoModel(
          id: 11, nombre: "alumno 11", paterno: "paterno", materno: "materno"),
      new AlumnoModel(
          id: 12, nombre: "alumno 12", paterno: "paterno", materno: "materno"),
      new AlumnoModel(
          id: 13, nombre: "alumno 13", paterno: "paterno", materno: "materno"),
      new AlumnoModel(
          id: 14, nombre: "alumno 14", paterno: "paterno", materno: "materno"),
      new AlumnoModel(
          id: 15, nombre: "alumno 15", paterno: "paterno", materno: "materno"),
      new AlumnoModel(
          id: 16, nombre: "alumno 16", paterno: "paterno", materno: "materno"),
      new AlumnoModel(
          id: 17, nombre: "alumno 17", paterno: "paterno", materno: "materno"),
      new AlumnoModel(
          id: 18, nombre: "alumno 18", paterno: "paterno", materno: "materno"),
      new AlumnoModel(
          id: 19, nombre: "alumno 19", paterno: "paterno", materno: "materno"),
    ];
  }

  static Future<List<ClaseModel>> clasesProfesor() async {
    await delay();
    return [
      new ClaseModel(
          id: 1,
          materia: "Matemáticas 1",
          grado: "1",
          grupo: "B",
          horarios: [
            new HorarioModel(entrada: 0, salida: 100000000, dia: 1),
            new HorarioModel(entrada: 0, salida: 100000000, dia: 2),
            new HorarioModel(entrada: 0, salida: 100000000, dia: 3),
            new HorarioModel(entrada: 0, salida: 100000000, dia: 4),
            new HorarioModel(entrada: 0, salida: 100000000, dia: 5),
          ]),
      new ClaseModel(
          id: 2,materia: "Español 1", grado: "1", grupo: "B", horarios: []),
      new ClaseModel(
          id: 3, materia: "Historia 1", grado: "2", grupo: "A", horarios: []),
      new ClaseModel(
          id: 4,materia: "Formación Cívica y Ética", grado: "3", grupo: "C", horarios: []),
    ];
  }
}
