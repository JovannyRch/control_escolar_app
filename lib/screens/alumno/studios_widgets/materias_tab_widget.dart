import 'package:control_escolar/const/const.dart';
import 'package:control_escolar/models/ClasePreviewModel.dart';
import 'package:control_escolar/models/MateriaModel.dart';
import 'package:control_escolar/models/ProfesorPreviewModel.dart';
import 'package:control_escolar/services/alumnos_services.dart';
import 'package:control_escolar/widgets/DividerLine.dart';
import 'package:control_escolar/widgets/LoaderWidget.dart';
import 'package:control_escolar/widgets/MateriaCardWidget.dart';
import 'package:control_escolar/widgets/ProfesorTileWidget.dart';
import 'package:control_escolar/widgets/TitleWidget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MateriasTabWidget extends StatefulWidget {
  MateriasTabWidget({Key key}) : super(key: key);

  @override
  _MateriasTabWidget createState() => _MateriasTabWidget();
}

class _MateriasTabWidget extends State<MateriasTabWidget> {
  Size _size;
  bool isFetchingClases = false;
  bool isFetchingProfesores = false;
  List<ClasePreviewModel> clases = [];
  List<ProfesorPreviewModel> profesores = [];
  AlumnosService alumnosService = new AlumnosService();

  @override
  void initState() {
    // TODO: implement initState
    fetchClases();
    fetchProfesores();
    super.initState();
  }

  void setFetchingClases(bool val) {
    setState(() {
      isFetchingClases = val;
    });
  }

  void setFetchingProfesores(bool val) {
    setState(() {
      isFetchingProfesores = val;
    });
  }

  void fetchClases() async {
    setFetchingClases(true);
    clases = await alumnosService.fetchClases();
    setFetchingClases(false);
  }

  void fetchProfesores() async {
    setFetchingProfesores(true);
    profesores = await alumnosService.fetchProfesores();
    setFetchingProfesores(false);
  }

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;
    return Expanded(
      child: Container(
        padding: EdgeInsets.only(left: 27.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 20.0),
            TitleWidget(title: "Mis materias", color: kMainColor),
            SizedBox(height: 16.0),
            _materiasContainer(),
            SizedBox(height: 16.0),
            TitleWidget(title: "Mis profesores", color: kMainColor),
            SizedBox(height: 18.0),
            Expanded(
                child: Container(
              child: SingleChildScrollView(
                child: showItemsOrLoader(),
              ),
            ))
          ],
        ),
      ),
    );
  }

  Widget showItemsOrLoader() {
    if (isFetchingProfesores) {
      return LoaderWidget();
    }
    return Column(
        children: profesores.map((p) => _profesoreContainer(p)).toList());
  }

  //Materias container
  Widget _materiasContainer() {
    return Container(
      height: 120.0,
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        child: _renderMateriasOrLoading(),
      ),
    );
  }

  Widget _renderMateriasOrLoading() {
    if (isFetchingClases) {
      return Row(
        children: [CircularProgressIndicator()],
        mainAxisAlignment: MainAxisAlignment.center,
      );
    }
    return Row(
      children:
          clases.map((c) => MateriaCalificacionCardWidget(clase: c)).toList(),
    );
  }

  //Profesor container
  Widget _profesoreContainer(ProfesorPreviewModel profesor) {
    return Container(
      margin: EdgeInsets.only(bottom: 14.0),
      child: ProfesorTileWidget(profesor: profesor),
    );
  }
}
