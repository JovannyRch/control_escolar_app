import 'package:control_escolar/const/const.dart';
import 'package:control_escolar/models/MateriaModel.dart';
import 'package:control_escolar/widgets/DividerLine.dart';
import 'package:control_escolar/widgets/MateriaCardWidget.dart';
import 'package:control_escolar/widgets/TitleWidget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MateriasWidget extends StatefulWidget {
  MateriasWidget({Key key}) : super(key: key);

  @override
  _MateriasWidget createState() => _MateriasWidget();
}

class _MateriasWidget extends State<MateriasWidget> {
  Size _size;

  List<MateriaCalificacionModel> calificaciones = [
    MateriaCalificacionModel(
        nombre: "Languaje de programación Orientada a Objetos",
        calificacion: 9.9),
    MateriaCalificacionModel(nombre: "Sistemas Operativos", calificacion: 4.9),
    MateriaCalificacionModel(
        nombre: "Tipos de Sistemas Operativos", calificacion: 5.9),
    MateriaCalificacionModel(
        nombre: "Lenguaje de programación visual", calificacion: 7.9),
  ];

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;
    return Expanded(
      child: Container(
        padding: EdgeInsets.only(left: 27.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 20.0),
            TitleWidget(title: "Mis materias", color: kMainColor),
            SizedBox(height: 16.0),
            _materiasContainer(),
            SizedBox(height: 16.0),
            TitleWidget(title: "Mis profesores", color: kMainColor),
            SizedBox(height: 18.0),
            Expanded(
                child: Container(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _profesoreContainer(),
                    _profesoreContainer(),
                    _profesoreContainer(),
                  ],
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }

  //Materias container
  Widget _materiasContainer() {
    return Container(
      height: 120.0,
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        child: Row(
          children: calificaciones
              .map((c) => MateriaCalificacionCardWidget(materia: c))
              .toList(),
        ),
      ),
    );
  }

  //Profesor container
  Widget _profesoreContainer() {
    return Container(
        margin: EdgeInsets.only(bottom: 14.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 18.0,
              backgroundColor: Colors.transparent,
              child: Image.asset("assets/images/icon-teacher.png"),
            ),
            SizedBox(width: 16.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _profesorName(),
                _materiaName(),
                DividerLine(width: _size.width * 0.75),
              ],
            )
          ],
        ));
  }

  Widget _profesorName() {
    return Text(
      "Francisco Chavez Castañeda",
      style: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 13.0,
      ),
    );
  }

  Widget _materiaName() {
    return Text(
      "Lenguaje de Programación Orientada a Objetos",
      style: TextStyle(
          fontWeight: FontWeight.w400, fontSize: 10.0, color: Colors.black54),
    );
  }
}
