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
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width / 10,
                        top: MediaQuery.of(context).size.width / 20),
                    child: _materiaName()),
                Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width / 10,
                        top: MediaQuery.of(context).size.width / 60),
                    child: _matriculamateria()),
                Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width / 10,
                      top: MediaQuery.of(context).size.width / 60),
                  child: _semestremateria(),
                ),
                /*  IconButton(
                    icon: Icon(Icons.more, color: Colors.white),
                    onPressed: null), */
                Padding(
                    padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width / 10,
                    ),
                    child: DividerLine(
                        width: MediaQuery.of(context).size.width * 0.75,
                        color: Colors.white)),
              ],
            )
          ],
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
