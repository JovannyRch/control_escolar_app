import 'package:control_escolar/const/const.dart';
import 'package:control_escolar/models/MateriaModel.dart';
import 'package:control_escolar/screens/padre/padre_materia_details.dart';
import 'package:control_escolar/widgets/DividerLine.dart';
import 'package:flutter/material.dart';

class MateriaListItemWidget extends StatelessWidget {
  final MateriaModel materia;
  MateriaListItemWidget({this.materia});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PadreMateriaDetails()),
          );
        },
        child: Container(
          margin: EdgeInsets.only(top: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _materiaName(),
              SizedBox(height: 2.0),
              _matriculamateria(),
              SizedBox(height: 2.0),
              _semestremateria(),
              DividerLine(
                width: MediaQuery.of(context).size.width * 0.65,
                color: Colors.white,
              ),
            ],
          ),
        ));
  }

  Widget _materiaName() {
    return Text(
      '${materia.nombre}',
      style: TextStyle(
          fontWeight: FontWeight.w500, fontSize: 16.0, color: Colors.white),
    );
  }

  Widget _matriculamateria() {
    return Text(
      'Matricula: ${materia.nombreProfesor}',
      style: TextStyle(
          fontWeight: FontWeight.w500, fontSize: 14.0, color: kSecondaryColor),
    );
  }

  Widget _semestremateria() {
    var estado;
    if (materia.status) {
      estado = 'Inscrito';
    } else {
      estado = 'No inscrito';
    }

    return Text(
      '$estado',
      style: TextStyle(
          fontWeight: FontWeight.w500, fontSize: 12.0, color: kSecondaryColor),
    );
  }
}
