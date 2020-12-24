import 'package:control_escolar/const/const.dart';
import 'package:control_escolar/screens/alumno/studios_widgets/credencial_widget.dart';
import 'package:control_escolar/screens/alumno/studios_widgets/materias_widget.dart';
import 'package:control_escolar/screens/alumno/studios_widgets/planes_widget.dart';
import 'package:control_escolar/screens/alumno/studios_widgets/reglamentos_widget.dart';
import 'package:flutter/material.dart';

class AlumnoEstudiosScreen extends StatefulWidget {
  AlumnoEstudiosScreen({Key key}) : super(key: key);

  @override
  _AlumnoEstudiosScreenState createState() => _AlumnoEstudiosScreenState();
}

class _AlumnoEstudiosScreenState extends State<AlumnoEstudiosScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey.shade100,
          bottom: TabBar(
            labelColor: kSecondaryColor,
            indicatorColor: kSecondaryColor,
            unselectedLabelColor: kMainColor,
            labelStyle: TextStyle(fontSize: 11.0, fontWeight: FontWeight.w700),
            tabs: [
              Tab(text: "Credencial"),
              Tab(text: "Materias"),
              Tab(text: "Planes"),
              Tab(text: "Reglamentos"),
            ],
          ),
          toolbarHeight: 50.0,
          elevation: 0,
        ),
        body: TabBarView(
          children: [
            CredencialTabWidget(),
            MateriasTabWidget(),
            PlanesTabWidget(),
            ReglamentosTabWidget(),
          ],
        ),
      ),
    );
  }
}
