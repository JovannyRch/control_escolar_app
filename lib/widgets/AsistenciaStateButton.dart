import 'package:control_escolar/models/AsistenciaModel.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AsistenciaStateButton extends StatelessWidget {
  final int valorAsistencia;
  Function onTap;
  AsistenciaStateButton({this.valorAsistencia, this.onTap});


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
          child: Container(
        width: 30.0,
        height: 30.0,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _getColor(),
            boxShadow: [
              BoxShadow(
                offset: Offset(1, 1),
                color: Colors.black.withOpacity(0.3),
              )
            ]),
        margin: EdgeInsets.only(left: 10.0, right: 10.0),
        child: Center(
          child: FaIcon(
            _getIcon(),
            color: Colors.white,
            size: 15.0,
          ),
        ),
      ),
    );
  }

  IconData _getIcon() {
    switch (valorAsistencia) {
      case AsistenciaModel.SIN_ASIGNAR:
        return FontAwesomeIcons.ad;
      case AsistenciaModel.ASISTENCIA:
        return FontAwesomeIcons.check;
      case AsistenciaModel.INASISTENCIA:
        return FontAwesomeIcons.times;
      case AsistenciaModel.RETARDO:
        return FontAwesomeIcons.clock;
    }
    return FontAwesomeIcons.adjust;
  }

  Color _getColor() {
    switch (valorAsistencia) {
      case AsistenciaModel.SIN_ASIGNAR:
        return Colors.grey;
      case AsistenciaModel.ASISTENCIA:
        return Colors.green;
      case AsistenciaModel.INASISTENCIA:
        return Colors.red;
      case AsistenciaModel.RETARDO:
        return Colors.orange;
    }
    return Colors.grey;
  }


}
