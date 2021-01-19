import 'package:control_escolar/const/const.dart';
import 'package:control_escolar/models/GruposMateriaModel.dart';
import 'package:control_escolar/models/MateriaProfesorModel.dart';
import 'package:control_escolar/widgets/CustomAppBar.dart';
import 'package:control_escolar/widgets/LoaderWidget.dart';
import 'package:flutter/material.dart';

class AlumnosProfesorScreen extends StatefulWidget {
  final GruposMateriaModel grupo;
  final MateriaProfesorModel materia;

  AlumnosProfesorScreen({@required this.grupo, @required this.materia});

  @override
  _AlumnosProfesorScreenState createState() => _AlumnosProfesorScreenState();
}

class _AlumnosProfesorScreenState extends State<AlumnosProfesorScreen> {
  bool isLoading = false;
  Size _size;

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: CustomAppBar(
            title: widget.grupo.nombre, leading: _backIcon(), tabs: _tabs()),
        body: _body(),
      ),
    );
  }

  Widget _tabs() {
    return TabBar(
      labelColor: kSecondaryColor,
      indicatorColor: kSecondaryColor,
      unselectedLabelColor: kMainColor,
      labelStyle: TextStyle(fontSize: 11.0, fontWeight: FontWeight.w700),
      tabs: [
        Tab(text: "Asistencias"),
        Tab(text: "Calificaciones"),
      ],
    );
  }

  Widget _backIcon() {
    return IconButton(
      icon: Icon(Icons.arrow_back, color: kMainColor),
      onPressed: () => Navigator.of(context).pop(),
    );
  }

  Widget _body() {
    return TabBarView(
      children: [
        Container(),
        Container(),
      ],
    );
  }

  Widget _materiaInfo() {
    return Container(
      child: Text(
        "${widget.materia.nombre}",
        style: TextStyle(
          fontWeight: FontWeight.w300,
          color: kMainColor,
          fontSize: 15.0,
        ),
      ),
    );
  }

  Widget _renderGrupos() {
    if (isLoading) {
      return LoaderWidget.expanded(_size);
    }
    return Column(
      children: [],
    );
  }
}
