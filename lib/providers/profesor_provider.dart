import 'package:control_escolar/models/AlumnoModel.dart';
import 'package:control_escolar/models/AsistenciaModel.dart';
import 'package:control_escolar/models/ClaseModel.dart';
import 'package:control_escolar/models/GruposMateriaModel.dart';
import 'package:control_escolar/models/MateriaProfesorModel.dart';
import 'package:flutter/material.dart';

class ProfesorProvider with ChangeNotifier {
  List<AlumnoModel> _alumnos;
  MateriaProfesorModel _materia;
  List<ClaseModel> _clases;
  GruposMateriaModel _grupo;

  List<AsistenciaModel> _asistencias = [];

  bool _isLoadingMaterias = false;
  bool _isLoadingAlumnos = false;
  bool _isLoadingGrupos = false;
  bool _isLoadingClases = false;


  //alumnos
  List<AlumnoModel> get alumnos {
    return _alumnos;
  }

  set alumnos(List<AlumnoModel> data) {
    _alumnos = data;
    _asistencias = data.map((a) => new AsistenciaModel(alumno: a)).toList();
    notifyListeners();
  }

  //Asistencias
  List<AsistenciaModel> get asistencias {
    return _asistencias;
  }

  set asistencias(List<AsistenciaModel> data) {
    _asistencias = data;
    notifyListeners();
  }

  //materia
  MateriaProfesorModel get materia {
    return _materia;
  }

  set materia(MateriaProfesorModel data) {
    _materia = data;
    notifyListeners();
  }

  //grupo
  GruposMateriaModel get grupo {
    return _grupo;
  }

  set grupo(GruposMateriaModel data) {
    _grupo = data;
    notifyListeners();
  }

  bool get isLoadingAlumnos {
    return _isLoadingAlumnos;
  }

  set isLoadingAlumnos(bool val) {
    _isLoadingAlumnos = val;
    notifyListeners();
  }

  bool get isLoadingMaterias {
    return _isLoadingMaterias;
  }

  set isLoadingMaterias(bool val) {
    _isLoadingMaterias = val;
    notifyListeners();
  }

  bool get isLoadingGrupos {
    return _isLoadingGrupos;
  }

  set isLoadingGrupos(bool val) {
    _isLoadingGrupos = val;
    notifyListeners();
  }

   bool get isLoadingClases {
    return _isLoadingClases;
  }

  set isLoadingClases(bool val) {
    _isLoadingClases = val;
    notifyListeners();
  }

  void updateAlumnoAsistenciaState(int alumnoId) {
    _asistencias = _asistencias.map((a) {
      if (a.alumno.id == alumnoId) {
        a.siguienteEstado();
      }
      return a;
    }).toList();
    notifyListeners();
  }

  //Clases
  List<ClaseModel> get clases{
    return _clases;
  }

  set clases(List<ClaseModel> clases){
    _clases = clases;
    notifyListeners();
  }
}
