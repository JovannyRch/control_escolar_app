import 'package:control_escolar/const/const.dart';
import 'package:control_escolar/widgets/TitleWidget.dart';
import 'package:flutter/material.dart';

class MateriasWidget extends StatefulWidget {
  MateriasWidget({Key key}) : super(key: key);

  @override
  _MateriasWidget createState() => _MateriasWidget();
}

class _MateriasWidget extends State<MateriasWidget> {
  Size _size;

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
            TitleWidget(title: "Mis materias"),
            SizedBox(height: 8.0),
            Placeholder(fallbackHeight: 200),
            SizedBox(height: 16.0),
            TitleWidget(title: "Mis profesores"),
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
                Container(
                  margin: EdgeInsets.only(top: 17.0),
                  height: 0.5,
                  width: _size.width * 0.75,
                  color: Colors.black26,
                ),
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
