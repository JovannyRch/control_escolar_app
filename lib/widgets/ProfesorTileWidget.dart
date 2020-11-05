import 'package:control_escolar/widgets/DividerLine.dart';
import 'package:flutter/material.dart';

class ProfesorTileWidget extends StatelessWidget {
  const ProfesorTileWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
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
            DividerLine(width: MediaQuery.of(context).size.width * 0.75),
          ],
        )
      ],
    );
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
