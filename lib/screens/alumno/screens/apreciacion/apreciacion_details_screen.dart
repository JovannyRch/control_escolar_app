import 'package:control_escolar/const/const.dart';
import 'package:control_escolar/models/ApreciacionModel.dart';
import 'package:control_escolar/models/PreguntaApreciacionModel.dart';
import 'package:control_escolar/models/ProfesorPreviewModel.dart';
import 'package:control_escolar/providers/app_state_provider.dart';
import 'package:control_escolar/providers/apreciacion_provider.dart';
import 'package:control_escolar/screens/alumno/screens/apreciacion/preguntas_apreciacion.dart';
import 'package:control_escolar/services/alumnos_services.dart';
import 'package:control_escolar/services/apreciaciones_services.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class ApreciacionDetailsScreen extends StatefulWidget {
  final ApreciacionModel apreciacion;
  ApreciacionDetailsScreen({@required this.apreciacion});

  @override
  _ApreciacionDetailsScreenState createState() =>
      _ApreciacionDetailsScreenState();
}

class _ApreciacionDetailsScreenState extends State<ApreciacionDetailsScreen> {
  AppStateProvider appStateProvider;
  ApreciacionProvider apreciacionProvider;
  ApreciacionesService apreciacionesService = new ApreciacionesService();
  AlumnosService alumnosService = new AlumnosService();
  bool isLoadingApreciacionData = true;

  @override
  void initState() {
    super.initState();
    fetchApreciacionData();
  }

  void setIsLoadingApreciacionData(bool val) {
    setState(() {
      isLoadingApreciacionData = val;
    });
  }

  void fetchApreciacionData() async {
    WidgetsFlutterBinding.ensureInitialized();
    setIsLoadingApreciacionData(true);
    List<PreguntaApreciacionModel> preguntas =
        await apreciacionesService.fetchPreguntas(widget.apreciacion.id);
    apreciacionProvider.preguntas = preguntas;
    apreciacionProvider.indexPreguntaActual = 0;
    apreciacionProvider.totalPreguntas = preguntas.length;
    List<ProfesorPreviewModel> profesores =
        await alumnosService.fetchProfesores();
    apreciacionProvider.profesores = profesores;
    setIsLoadingApreciacionData(false);
  }

  Size _size;
  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;
    appStateProvider = Provider.of<AppStateProvider>(context);
    apreciacionProvider = Provider.of<ApreciacionProvider>(context);
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: kMainColor),
        title: _titleApreciacion(),
      ),
      body: _body(),
    );
  }

  Widget _body() {
    return Container(
      color: Colors.grey.shade200,
      child: SafeArea(
          child: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _card(),
          ],
        ),
      )),
    );
  }

  Widget _card() {
    return Container(
      height: _size.height * 0.5,
      width: _size.width * 0.8,
      padding: EdgeInsets.symmetric(
        vertical: 20,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _instruccionesTitle(),
          _instruccionesText(),
          _buttonStart(),
        ],
      ),
    );
  }

  Widget _titleApreciacion() {
    return Text(
      "Apreciacion Estudiantil ${appStateProvider.apreciacion.ciclo}",
      style: TextStyle(
        color: kMainColor,
        fontSize: 18,
        fontWeight: FontWeight.w800,
      ),
    );
  }

  Widget _instruccionesTitle() {
    return Text(
      "Instrucciones",
      style: TextStyle(
        color: kMainColor,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget _instruccionesText() {
    return Container(
      width: _size.width * 0.65,
      child: Text(
        appStateProvider.apreciacion.instrucciones,
        style: TextStyle(
          color: kMainColor,
          fontSize: 19,
          fontWeight: FontWeight.w300,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  void handleStartApreciacion() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => PreguntasApreciacionScreen()));
  }

  Widget _buttonStart() {
    return RaisedButton(
      color: kSecondaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
      ),
      onPressed: isLoadingApreciacionData ? null : handleStartApreciacion,
      child: _contentButtonStart(),
    );
  }

  Widget _contentButtonStart() {
    /* if (isLoadingApreciacionData) {
      return LoaderWidget();
    } */
    return Container(
      width: _size.width * 0.35,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "  Comenzar  ",
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(width: 5),
          FaIcon(
            FontAwesomeIcons.arrowRight,
            size: 15,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
