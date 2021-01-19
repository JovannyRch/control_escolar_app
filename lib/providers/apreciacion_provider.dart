import 'package:control_escolar/models/ClasePreviewModel.dart';
import 'package:control_escolar/models/PreguntaApreciacionModel.dart';
import 'package:control_escolar/models/ProfesorPreviewModel.dart';
import 'package:flutter/material.dart';

class ApreciacionProvider with ChangeNotifier {
  List<PreguntaApreciacionModel> _preguntas;
  List<ProfesorPreviewModel> _profesores;
  List<ClasePreviewModel> _clases;
  int _indexPreguntaActual;
  int _totalPreguntas;

  List<PreguntaApreciacionModel> get preguntas {
    return _preguntas;
  }

  set preguntas(List<PreguntaApreciacionModel> preguntas) {
    _preguntas = preguntas;
    notifyListeners();
  }

  List<ProfesorPreviewModel> get profesores {
    return _profesores;
  }

  set profesores(List<ProfesorPreviewModel> profesores) {
    _profesores = profesores;
    notifyListeners();
  }

  List<ClasePreviewModel> get clases {
    return _clases;
  }

  set clases(List<ClasePreviewModel> clases) {
    _clases = clases;
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
