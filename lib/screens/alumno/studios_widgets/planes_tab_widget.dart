import 'package:control_escolar/const/const.dart';
import 'package:control_escolar/screens/alumno/studios_widgets/planes_detail_widget.dart';
import 'package:control_escolar/widgets/DividerLine.dart';
import 'package:control_escolar/widgets/TitleWidget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PlanesTabWidget extends StatefulWidget {
  PlanesTabWidget({Key key}) : super(key: key);

  @override
  _PlanesWidget createState() => _PlanesWidget();
}

class _PlanesWidget extends State<PlanesTabWidget> {
  Size _size;

  List<PlanEstudioModel> planes = [
    PlanEstudioModel(
        id: 1, nombre: "Primer Semestre", descripcion: "7 Asisgnaturas"),
    PlanEstudioModel(
        id: 2, nombre: "Segundo Semestre", descripcion: "7 Asisgnaturas"),
    PlanEstudioModel(
        id: 3, nombre: "Tercer Semestre", descripcion: "8 Asisgnaturas"),
    PlanEstudioModel(
        id: 4, nombre: "Cuarto Semestre", descripcion: "8 Asisgnaturas"),
    PlanEstudioModel(
        id: 5, nombre: "Quinto Semestre", descripcion: "10 Asisgnaturas"),
    PlanEstudioModel(
        id: 6, nombre: "Sexto Semestre", descripcion: "10 Asisgnaturas")
  ];
  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(right: 26, left: 26, top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TitleWidget(title: "Plan de estudios", color: kMainColor),
          SizedBox(height: 10.0),
          Expanded(
              child: Container(
            padding: EdgeInsets.only(right: 0, left: 7, top: 10),
            child: SingleChildScrollView(
              child: Column(
                children: planes.map((p) => _planTile(p)).toList(),
              ),
            ),
          )),
        ],
      ),
    );
  }

  Widget _planTile(PlanEstudioModel plan) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PlanesDetailWidget(plan: plan)));
      },
      child: Container(
        height: 50.0,
        width: double.infinity,
        margin: EdgeInsets.only(bottom: 16.0),
        decoration: BoxDecoration(),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            FaIcon(FontAwesomeIcons.book),
            SizedBox(width: 16.0),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    width: _size.width * 0.7,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _nombrePlan(plan.nombre),
                            SizedBox(height: 2.0),
                            _descripcionPlan(plan.descripcion),
                          ],
                        ),
                        SizedBox(width: 20.0),
                        _viewContainer(),
                      ],
                    ),
                  ),
                ),
                DividerLine(width: _size.width * 0.7, color: Colors.black26),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _viewContainer() {
    return Container(
      width: 28.0,
      height: 28.0,
      decoration: BoxDecoration(
        border: Border.all(color: kSecondaryColor, width: 2.0),
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: Center(
        child: FaIcon(
          FontAwesomeIcons.eye,
          size: 12,
          color: kSecondaryColor,
        ),
      ),
    );
  }

  Widget _nombrePlan(String text) {
    return Container(
      child: Text(
        text,
        style: TextStyle(
          fontSize: 13.0,
          fontWeight: FontWeight.w700,
          color: Color(0xFF535353),
        ),
      ),
    );
  }

  Widget _descripcionPlan(String text) {
    return Container(
      child: Text(
        text,
        style: TextStyle(
          fontSize: 10.0,
          fontWeight: FontWeight.w300,
          color: Color(0xFF787878),
        ),
      ),
    );
  }
}

class PlanEstudioModel {
  int id;
  String nombre;
  String descripcion;

  PlanEstudioModel({this.id, this.nombre, this.descripcion});
}
