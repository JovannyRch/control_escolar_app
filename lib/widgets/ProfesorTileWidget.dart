import 'package:control_escolar/models/ProfesorPreviewModel.dart';
import 'package:control_escolar/widgets/DividerLine.dart';
import 'package:flutter/material.dart';

class ProfesorTileWidget extends StatelessWidget {
  final ProfesorPreviewModel profesor;

  ProfesorTileWidget({@required this.profesor});

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
            DividerLine(
                width: MediaQuery.of(context).size.width * 0.65,
                color: Colors.black26),
          ],
        )
      ],
    );
  }

  Widget _profesorName() {
    return Text(
      profesor.profesor,
      style: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 13.0,
      ),
    );
  }

  Widget _materiaName() {
    return Text(
      profesor.materia,
      style: TextStyle(
          fontWeight: FontWeight.w400, fontSize: 10.0, color: Colors.black54),
    );
  }
}
