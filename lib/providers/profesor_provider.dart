import 'package:control_escolar/models/AlumnoModel.dart';
import 'package:control_escolar/models/GruposMateriaModel.dart';
import 'package:control_escolar/models/MateriaProfesorModel.dart';
import 'package:flutter/material.dart';

class ProfesorProvider with ChangeNotifier {
  List<AlumnoModel> _alumnos;
  MateriaProfesorModel _materia;
  GruposMateriaModel _grupo;

  bool _isLoadingMaterias = false;
  bool _isLoadingAlumnos = false;
  bool _isLoadingGrupos = false;
  //alumnos
  List<AlumnoModel> get alumnos {
    return _alumnos;
  }

  set alumnos(List<AlumnoModel> data) {
    _alumnos = data;
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
}
