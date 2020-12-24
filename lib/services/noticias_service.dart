

import 'package:control_escolar/models/NoticiaModel.dart';
import 'package:control_escolar/services/api_service.dart';

class NoticiasService {
  Api api = new Api();



  Future<List<NoticiaModel>> fetchNoticias() async{
    final resp = await api.get("/noticias");
    if(resp == ""){
      return []; 
    }
    List<NoticiaModel> data = noticiaModelFromJson(resp);
    return data;
  }
}