import 'package:control_escolar/const/const.dart';
import 'package:control_escolar/models/AlumnoModel.dart';
import 'package:control_escolar/models/GruposMateriaModel.dart';
import 'package:control_escolar/models/MateriaProfesorModel.dart';
import 'package:control_escolar/providers/profesor_provider.dart';
import 'package:control_escolar/screens/profesor/asistencias_tab.dart';
import 'package:control_escolar/services/profesor_service.dart';
import 'package:control_escolar/widgets/CustomAppBar.dart';
import 'package:control_escolar/widgets/LoaderWidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AlumnosProfesorScreen extends StatefulWidget {
  final GruposMateriaModel grupo;
  final MateriaProfesorModel materia;

  AlumnosProfesorScreen({@required this.grupo, @required this.materia});

  @override
  _AlumnosProfesorScreenState createState() => _AlumnosProfesorScreenState();
}

class _AlumnosProfesorScreenState extends State<AlumnosProfesorScreen> {
  Size _size;
  ProfesorService _service = new ProfesorService();
  ProfesorProvider _provider;

  List<AlumnoModel> alumnos;

  @override
  void initState() {
    // TODO: implement initState

    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _provider = context.read<ProfesorProvider>();
      _provider.materia = widget.materia;
      this.fetchData();
    });
  }

  void fetchData() async {
    _provider.isLoadingAlumnos = true;
    alumnos = await _service.fetchAlumnos(widget.grupo.id);
    _provider.alumnos = alumnos;
    _provider.isLoadingAlumnos = false;
  }

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: CustomAppBar(
          title: "${widget.grupo.nombre}",
          leading: _backIcon(),
          tabs: _tabs(),
          subtitle: "${widget.materia.nombre}"
        ),
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
        AsisTenciasTab(),
        Container(),
      ],
    );
  }
}
