import 'package:control_escolar/models/PreguntaApreciacionModel.dart';
import 'package:flutter/material.dart';

class ApreciacionProvider with ChangeNotifier {
  List<PreguntaApreciacionModel> _preguntas;
  int _indexPreguntaActual;
  int _totalPreguntas;

  List<PreguntaApreciacionModel> get preguntas {
    return _preguntas;
  }

  set preguntas(List<PreguntaApreciacionModel> preguntas) {
    _preguntas = preguntas;
    notifyListeners();
  }

  int get totalPreguntas {
    return _totalPreguntas;
  }

  set totalPreguntas(int totalPreguntas) {
    _totalPreguntas = totalPreguntas;
    notifyListeners();
  }

  int get indexPreguntaActual {
    return _indexPreguntaActual;
  }

  set indexPreguntaActual(int indexPreguntaActual) {
    _indexPreguntaActual = indexPreguntaActual;
    notifyListeners();
  }
}
