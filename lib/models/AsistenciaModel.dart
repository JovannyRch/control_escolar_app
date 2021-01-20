import 'package:control_escolar/models/AlumnoModel.dart';

class AsistenciaModel {
  static const int SIN_ASIGNAR = 1;
  static const int ASISTENCIA = 2;
  static const int INASISTENCIA = 3;
  static const int RETARDO = 4;

  AlumnoModel alumno;
  int asistencia = SIN_ASIGNAR;

  AsistenciaModel({this.alumno}) {
    this.asistencia = SIN_ASIGNAR;
  }

  void siguienteEstado(){
    if(this.asistencia == SIN_ASIGNAR){
      this.asistencia = ASISTENCIA;
    }
    else if(this.asistencia == ASISTENCIA){
      this.asistencia = INASISTENCIA;
    }
    else if(this.asistencia == INASISTENCIA){
      this.asistencia = RETARDO;
    }
    else if(this.asistencia == RETARDO){
      this.asistencia = ASISTENCIA;
    }
  }

}
