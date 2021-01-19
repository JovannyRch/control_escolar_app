import 'package:control_escolar/const/const.dart';
import 'package:control_escolar/models/ClasePreviewModel.dart';
import 'package:control_escolar/models/MateriaProfesorModel.dart';
import 'package:control_escolar/models/ProfesorPreviewModel.dart';
import 'package:control_escolar/services/api_service.dart';
import 'package:control_escolar/services/mock_service.dart';

class ProfesorService {
  Api api = new Api();

  Future<List<MateriaProfesorModel>> fetchMaterias() async {
      if(IS_TESTING) {
        return await Mock.materiasProfesor();
      }

      return [];
    //TODO: Change endpoint
  }

  Future<List<ProfesorPreviewModel>> fetchProfesores() async {
    final resp = await api.get("/profesores");
    if (resp == "") {
      return [];
    }
    List<ProfesorPreviewModel> data = profesorPreviewModelFromJson(resp);
    return data;
  }
}
