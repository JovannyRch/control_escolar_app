import 'package:control_escolar/models/ApreciacionModel.dart';
import 'package:flutter/material.dart';

class AppStateProvider with ChangeNotifier {
  ApreciacionModel _apreciacion;

  ApreciacionModel get apreciacion {
    return _apreciacion;
  }

  set apreciacion(ApreciacionModel apreciacion) {
    _apreciacion = apreciacion;
    notifyListeners();
  }
}
