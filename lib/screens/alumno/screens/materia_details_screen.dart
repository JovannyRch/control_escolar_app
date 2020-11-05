import 'package:control_escolar/const/const.dart';
import 'package:control_escolar/widgets/CustomAppBar.dart';
import 'package:control_escolar/widgets/ProfesorTileWidget.dart';
import 'package:control_escolar/widgets/TitleWidget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MateriaDetailsScreen extends StatefulWidget {
  @override
  _MateriaDetailsScreenState createState() => _MateriaDetailsScreenState();
}

class _MateriaDetailsScreenState extends State<MateriaDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          title: "Programacion Orientada a Objetos",
          subtitle: "",
          actions: [
            Container(
              padding: EdgeInsets.only(right: 13.0),
              child: IconButton(
                icon: Icon(Icons.close),
                color: Colors.black,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            )
          ]),
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TitleWidget(title: "Docente", color: kMainColor),
            SizedBox(height: 5.0),
            ProfesorTileWidget(),
            SizedBox(height: 25.0),
            TitleWidget(title: "Calificaciones", color: kMainColor),
            SizedBox(height: 15.0),
            _calificacionTile("Primer parcial", 8.5),
            _calificacionTile("Segundo parcial", 6.8),
            _calificacionTile("Tercer parcial", 5.9),
            _calificacionTile("Tercer parcial", 9.9),
            _calificacionTile("Tercer parcial", 8.5),
            _calificacionTile("Tercer parcial", 10.0),
            SizedBox(height: 25.0),
            TitleWidget(title: "Asistencia", color: kMainColor),
            SizedBox(height: 5.0),
            Text(
              "100%",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _calificacionTile(String title, double calificacion) {
    Widget icon = _getIcon(calificacion);
    Widget circleContainer = Container(
      width: 32,
      height: 32,
      decoration: BoxDecoration(
        color: Color(0xFF52de97),
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          "$calificacion",
          style: TextStyle(
            fontSize: 12.0,
            color: kMainColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
    return Container(
      height: 44.0,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          icon,
          SizedBox(width: 22.0),
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                color: kMainColor,
                fontWeight: FontWeight.w400,
                fontSize: 12.0,
              ),
            ),
          ),
          circleContainer,
        ],
      ),
    );
  }

  Widget _getIcon(double calificacion) {
    if (calificacion < 6.0) {
      return FaIcon(FontAwesomeIcons.sadTear);
    }
    if (calificacion < 8.0) {
      return FaIcon(FontAwesomeIcons.meh);
    }
    if (calificacion < 9.0) {
      return FaIcon(FontAwesomeIcons.smile);
    }
    if (calificacion <= 9.9) {
      return FaIcon(FontAwesomeIcons.grin);
    }
    return FaIcon(FontAwesomeIcons.smileBeam);
  }
}
