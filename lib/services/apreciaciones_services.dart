import 'package:control_escolar/models/ApreciacionModel.dart';
import 'package:control_escolar/models/PreguntaApreciacionModel.dart';
import 'package:control_escolar/services/api_service.dart';

class ApreciacionesService {
  Api api = new Api();

  Future<ApreciacionModel> fetchApreciacionActiva() async {
    final resp = await api.get("/apreciaciones/activo");
    if (resp == "") {
      return null;
    }
    ApreciacionModel data = apreciacionModelFromJson(resp);
    return data;
  }

  Future<List<PreguntaApreciacionModel>> fetchPreguntas(
      int apreciacionId) async {
    print("Ir por las preguntas $apreciacionId");
    final resp = await api.get("/apreciaciones/$apreciacionId/preguntas");
    if (resp == "") {
      return null;
    }
    List<PreguntaApreciacionModel> data =
        preguntaApreciacionModelFromJson(resp);
    return data;
  }
}
