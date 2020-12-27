

import 'package:control_escolar/models/ClasePreviewModel.dart';
import 'package:control_escolar/models/ProfesorPreviewModel.dart';
import 'package:control_escolar/services/api_service.dart';

class AlumnosService {
  Api api = new Api();



  Future<List<ClasePreviewModel>> fetchClases() async{
    final resp = await api.get("/clases");
  
    if(resp == ""){
      return []; 
    }
    List<ClasePreviewModel> data = clasePreviewModelFromJson(resp);
    return data;
  }


  Future<List<ProfesorPreviewModel>> fetchProfesores() async{
    final resp = await api.get("/profesores0");
    if(resp == ""){
      return []; 
    }
    List<ProfesorPreviewModel> data = profesorPreviewModelFromJson(resp);
    return data;
  }

}