import 'package:control_escolar/const/const.dart';
import 'package:control_escolar/models/AlumnoModel.dart';
import 'package:control_escolar/models/AsistenciaModel.dart';
import 'package:control_escolar/models/ClaseModel.dart';
import 'package:control_escolar/providers/profesor_provider.dart';
import 'package:control_escolar/screens/profesor/asistencias_tab.dart';
import 'package:control_escolar/services/profesor_service.dart';
import 'package:control_escolar/widgets/CustomAppBar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class AlumnosProfesorScreen extends StatefulWidget {
 
  final ClaseModel clase;


  AlumnosProfesorScreen({@required this.clase});

  @override
  _AlumnosProfesorScreenState createState() => _AlumnosProfesorScreenState();
}

class _AlumnosProfesorScreenState extends State<AlumnosProfesorScreen> {
  Size _size;
  ProfesorService _service = new ProfesorService();
  ProfesorProvider _provider;
  List<AlumnoModel> alumnos;
  GlobalKey key;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();


  @override
  void initState() {
    // TODO: implement initState

    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {

      this.fetchData();
    });
  }

  void fetchData() async {
    _provider = Provider.of<ProfesorProvider>(context, listen: false);
    _provider.isLoadingAlumnos = true;
    alumnos = await _service.fetchAlumnosFromClase(widget.clase);
    _provider.alumnos = alumnos;
    _provider.asistencias = alumnos.map((e) => AsistenciaModel(alumno: e)).toList();
    _provider.isLoadingAlumnos = false;
  }

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        key: scaffoldKey,
        appBar: CustomAppBar(
            
            color: kMainColor,
            fontColor: Colors.white,
            title: "${widget.clase.grado}° ${widget.clase.grupo}",
            leading: _backIcon(),
            tabs: _tabs(),
            subtitle: "${widget.clase.materia}"),
        body: _body(),
      ),
    );
  }

  Widget _tabs() {
    return TabBar(
      labelColor: Colors.white,
      indicatorColor: kSecondaryColor,
      unselectedLabelColor:Colors.white60,
      indicatorWeight: 3.0,
      labelStyle: TextStyle(fontSize: 11.0, fontWeight: FontWeight.w700),
      tabs: [
        Tab(text: "Asistencias"),
        Tab(text: "Calificaciones"),
      ],
    );
  }

  Widget _backIcon() {
    return IconButton(
      icon: Icon(Icons.arrow_back, color: Colors.white),
      onPressed: () => Navigator.of(context).pop(),
    );
  }

  Widget _body() {
    return TabBarView(
      children: [
        AsisTenciasTab(scaffoldKey: scaffoldKey),
        Container(),
      ],
    );
  }
}
