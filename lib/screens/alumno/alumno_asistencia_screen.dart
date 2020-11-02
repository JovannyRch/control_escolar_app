import 'package:flutter/material.dart';

class AlumnoAsistenciasScreen extends StatefulWidget {
  AlumnoAsistenciasScreen({Key key}) : super(key: key);

  @override
  _AlumnoAsistenciasScreenState createState() =>
      _AlumnoAsistenciasScreenState();
}

class _AlumnoAsistenciasScreenState extends State<AlumnoAsistenciasScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Asistencias"),
    );
  }
}
