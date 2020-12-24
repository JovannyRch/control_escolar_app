

import 'package:control_escolar/models/ClasePreviewModel.dart';
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
}