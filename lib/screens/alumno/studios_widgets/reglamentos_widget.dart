import 'package:control_escolar/const/const.dart';
import 'package:control_escolar/widgets/DividerLine.dart';
import 'package:control_escolar/widgets/TitleWidget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ReglamentosWidget extends StatefulWidget {
  ReglamentosWidget({Key key}) : super(key: key);

  @override
  _ReglamentosWidget createState() => _ReglamentosWidget();
}

class _ReglamentosWidget extends State<ReglamentosWidget> {
  Size _size;

  List<PlanEstudioModel> planes = [
    PlanEstudioModel(
        nombre: "Nombre del reglamento",
        descripcion: "Descripcion del reglamento"),
    PlanEstudioModel(
        nombre: "Nombre del reglamento 1",
        descripcion: "Descripcion del reglamento"),
    PlanEstudioModel(
        nombre: "Nombre del reglamento 21",
        descripcion: "Descripcion del reglamento"),
    PlanEstudioModel(
        nombre: "Nombre del reglamento 101",
        descripcion: "Descripcion del reglamento"),
    PlanEstudioModel(
        nombre: "Nombre del plan del reglamento 200222",
        descripcion: "Descripcion del reglamento"),
  ];
  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(right: 26, left: 26, top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TitleWidget(title: "Reglamento", color: kMainColor),
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
    return Container(
      height: 50.0,
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 16.0),
      decoration: BoxDecoration(),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          FaIcon(FontAwesomeIcons.bookmark),
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
                      _downloadContainer(),
                    ],
                  ),
                ),
              ),
              DividerLine(width: _size.width * 0.7),
            ],
          ),
        ],
      ),
    );
  }

  Widget _downloadContainer() {
    return Container(
      width: 28.0,
      height: 28.0,
      decoration: BoxDecoration(
        border: Border.all(color: kSecondaryColor, width: 2.0),
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: Center(
        child: FaIcon(
          FontAwesomeIcons.download,
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
  String nombre;
  String descripcion;

  PlanEstudioModel({this.nombre, this.descripcion});
}
