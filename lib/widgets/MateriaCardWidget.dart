import 'package:control_escolar/const/const.dart';
import 'package:control_escolar/models/ClasePreviewModel.dart';
import 'package:control_escolar/screens/alumno/screens/materia_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MateriaCalificacionCardWidget extends StatelessWidget {
  final ClasePreviewModel clase;

  MateriaCalificacionCardWidget({@required this.clase});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => MateriaDetailsScreen(clase: clase)),
        );
      },
      child: Container(
        margin: EdgeInsets.only(right: 13.0),
        width: 200.0,
        height: 100.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
                offset: Offset(4, 4), blurRadius: 2.0, color: Colors.black12),
          ],
        ),
        child: Row(children: [
          _infoContainer(),
          _linkContainer(),
        ]),
      ),
    );
  }

  Widget _infoContainer() {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        decoration: BoxDecoration(
          color: Color(0xFFF8F8F8),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _circle(),
            _nombreMateria(),
            _calificacion(),
          ],
        ),
      ),
    );
  }

  Widget _circle() {
    return Container(
      width: 44.0,
      height: 44.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Color(0xFF52DE97),
      ),
      child: Center(
        child: FaIcon(FontAwesomeIcons.copy),
      ),
    );
  }

  Widget _calificacion() {
    return Container(
      margin: EdgeInsets.only(top: 2.0),
      child: Text(
        "Promedio: ${clase.promedio}",
        style: TextStyle(
          color: kMainColor,
          fontSize: 10.0,
          fontWeight: FontWeight.w400,
        ),
        textAlign: TextAlign.left,
      ),
    );
  }

  Widget _nombreMateria() {
    return Container(
      margin: EdgeInsets.only(top: 9.0),
      child: Text(
        clase.materia,
        style: TextStyle(
          fontSize: 11.0,
          fontWeight: FontWeight.w400,
          color: kMainColor,
        ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.left,
      ),
    );
  }

  Widget _linkContainer() {
    return Container(
      width: 32.0,
      height: 100.0,
      decoration: BoxDecoration(
        color: Color(0xFFEDEDED),
      ),
      child: Center(
        child: FaIcon(
          FontAwesomeIcons.chevronRight,
          size: 12.0,
        ),
      ),
    );
  }
}
