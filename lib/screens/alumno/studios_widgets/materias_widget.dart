import 'package:control_escolar/const/const.dart';
import 'package:control_escolar/models/ClasePreviewModel.dart';
import 'package:control_escolar/models/MateriaModel.dart';
import 'package:control_escolar/services/alumnos_services.dart';
import 'package:control_escolar/widgets/DividerLine.dart';
import 'package:control_escolar/widgets/MateriaCardWidget.dart';
import 'package:control_escolar/widgets/ProfesorTileWidget.dart';
import 'package:control_escolar/widgets/TitleWidget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MateriasWidget extends StatefulWidget {
  MateriasWidget({Key key}) : super(key: key);

  @override
  _MateriasWidget createState() => _MateriasWidget();
}

class _MateriasWidget extends State<MateriasWidget> {
  Size _size;
  bool isFetching = false;
  List<ClasePreviewModel> clases = [];
  AlumnosService alumnosService = new AlumnosService();

  @override
  void initState() {
    // TODO: implement initState
    fetchData();
    super.initState();
  }

  void setFetching(bool val) {
    setState(() {
      isFetching = val;
    });
  }

  void fetchData() async {
    setFetching(true);
    clases = await alumnosService.fetchClases();
    setFetching(false);
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
                child: Column(
                  children: [
                    _profesoreContainer(),
                    _profesoreContainer(),
                    _profesoreContainer(),
                  ],
                ),
              ),
            ))
          ],
        ),
      ),
    );
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
    if (isFetching) {
      return Row(children: [CircularProgressIndicator()], mainAxisAlignment: MainAxisAlignment.center,);
    }
    return Row(
      children:
          clases.map((c) => MateriaCalificacionCardWidget(clase: c)).toList(),
    );
  }

  //Profesor container
  Widget _profesoreContainer() {
    return Container(
      margin: EdgeInsets.only(bottom: 14.0),
      child: ProfesorTileWidget(),
    );
  }
}
