import 'package:control_escolar/models/HorarioModel.dart';

class ClaseModel {
  String grupo;
  String grado;
  String materia;

  List<HorarioModel> horarios;
  ClaseModel({this.grupo, this.grado, this.materia, this.horarios});
}
