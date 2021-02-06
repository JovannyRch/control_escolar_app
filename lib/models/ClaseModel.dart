import 'package:control_escolar/helpers/time_helper.dart';
import 'package:control_escolar/models/HorarioModel.dart';

class ClaseModel {

  int id;
  String grupo;
  String grado;
  String materia;

  List<HorarioModel> horarios;
  ClaseModel({this.id, this.grupo, this.grado, this.materia, this.horarios});

   static ClaseModel getCurrentClase(List<ClaseModel> clases){
    int currentTimeInMinutes = TimeHelper.currentTimeInMinutes();
    int currentDay = TimeHelper.currentDayInt();
    for(ClaseModel clase in clases){
      for(HorarioModel h in clase.horarios){
        if(h.dia ==  currentDay && ( currentTimeInMinutes >= h.entrada && currentTimeInMinutes < h.salida )){
          return clase;
        }
      }
    }

    return null;
  }
}
