import 'package:control_escolar/widgets/DividerLine.dart';
import 'package:flutter/material.dart';

class ProfesorTileWidget extends StatelessWidget {
  final String nombreProfesor;
  final String nombreMateria;

  ProfesorTileWidget({@required this.nombreProfesor, this.nombreMateria = ""});

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
            this.nombreMateria.isEmpty
                ? Container()
                : DividerLine(
                    width: MediaQuery.of(context).size.width * 0.65,
                    color: Colors.black26),
          ],
        )
      ],
    );
  }

  Widget _profesorName() {
    return Text(
      nombreProfesor,
      style: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 13.0,
      ),
    );
  }

  Widget _materiaName() {
    if (nombreMateria.isEmpty) {
      return Container();
    }
    return Text(
      nombreMateria,
      style: TextStyle(
          fontWeight: FontWeight.w400, fontSize: 10.0, color: Colors.black54),
    );
  }
}
