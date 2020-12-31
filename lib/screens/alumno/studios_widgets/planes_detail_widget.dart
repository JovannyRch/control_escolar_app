import 'package:control_escolar/const/const.dart';
import 'package:control_escolar/screens/alumno/studios_widgets/planes_tab_widget.dart';
import 'package:control_escolar/widgets/DividerLine.dart';
import 'package:control_escolar/widgets/TitleWidget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PlanesDetailWidget extends StatelessWidget {
  final PlanEstudioModel plan;
  PlanesDetailWidget({this.plan});

  Size _size;

  List<MateriaPlanModel> primerSemestre = [
    MateriaPlanModel(
        id: 1,
        nombre: 'MATEMÁTICAS I',
        urlPrograma: '',
        campoDisciplinar: 'MATEMÁTICAS'),
    MateriaPlanModel(
        id: 2,
        nombre: 'QUÍMICA I',
        urlPrograma: '',
        campoDisciplinar: 'CIENCIAS EXPERIMENTALES'),
    MateriaPlanModel(
        id: 3,
        nombre: 'METODOLOGÍA DE LA INVESTIGACIÓN',
        urlPrograma: '',
        campoDisciplinar: 'CIENCIAS SOCIALES'),
    MateriaPlanModel(
        id: 4,
        nombre: 'TALLER DE LECTURA Y REDACCIÓN I',
        urlPrograma: '',
        campoDisciplinar: 'COMUNICACIÓN'),
    MateriaPlanModel(
        id: 5,
        nombre: 'INGLÉS I',
        urlPrograma: '',
        campoDisciplinar: 'COMUNICACIÓN'),
    MateriaPlanModel(
        id: 6,
        nombre: 'INFORMÁTICA I',
        urlPrograma: '',
        campoDisciplinar: 'COMUNICACIÓN'),
    MateriaPlanModel(
        id: 7,
        nombre: 'ÉTICA I',
        urlPrograma: '',
        campoDisciplinar: 'HUMANIDADES'),
  ];
  List<MateriaPlanModel> segundoSemestre = [
    MateriaPlanModel(
        id: 1,
        nombre: 'MATEMÁTICAS II',
        urlPrograma: '',
        campoDisciplinar: 'MATEMÁTICAS'),
    MateriaPlanModel(
        id: 2,
        nombre: 'QUÍMICA II',
        urlPrograma: '',
        campoDisciplinar: 'CIENCIAS EXPERIMENTALES'),
    MateriaPlanModel(
        id: 3,
        nombre: 'INTRODUCCIÓN A LAS CIENCIAS SOCIALES',
        urlPrograma: '',
        campoDisciplinar: 'CIENCIAS SOCIALES'),
    MateriaPlanModel(
        id: 4,
        nombre: 'TALLER DE LECTURA Y REDACCIÓN II',
        urlPrograma: '',
        campoDisciplinar: 'COMUNICACIÓN'),
    MateriaPlanModel(
        id: 5,
        nombre: 'INGLÉS II',
        urlPrograma: '',
        campoDisciplinar: 'COMUNICACIÓN'),
    MateriaPlanModel(
        id: 6,
        nombre: 'INFORMÁTICA II',
        urlPrograma: '',
        campoDisciplinar: 'COMUNICACIÓN'),
    MateriaPlanModel(
        id: 7,
        nombre: 'ÉTICA II',
        urlPrograma: '',
        campoDisciplinar: 'HUMANIDADES'),
  ];
  List<MateriaPlanModel> tercerSemestre = [
    MateriaPlanModel(
        id: 1,
        nombre: 'MATEMÁTICAS III',
        urlPrograma: '',
        campoDisciplinar: 'MATEMÁTICAS'),
    MateriaPlanModel(
        id: 2,
        nombre: 'BIOLOGÍA I',
        urlPrograma: '',
        campoDisciplinar: 'CIENCIAS EXPERIMENTALES'),
    MateriaPlanModel(
        id: 3,
        nombre: 'FÍSICA I',
        urlPrograma: '',
        campoDisciplinar: 'CIENCIAS EXPERIMENTALES'),
    MateriaPlanModel(
        id: 4,
        nombre: 'HISTORIA DE MÉXICO I',
        urlPrograma: '',
        campoDisciplinar: 'CIENCIAS SOCIALES'),
    MateriaPlanModel(
        id: 5,
        nombre: 'INGLÉS III',
        urlPrograma: '',
        campoDisciplinar: 'COMUNICACIÓN'),
    MateriaPlanModel(
        id: 6,
        nombre: 'GESTIÓN DE ARCHIVOS DE TEXTO',
        urlPrograma: '',
        campoDisciplinar: 'COMUNICACIÓN'),
    MateriaPlanModel(
        id: 7,
        nombre: 'HOJA DE CÁLCULO APLICADA',
        urlPrograma: '',
        campoDisciplinar: 'COMUNICACIÓN'),
    MateriaPlanModel(
        id: 8,
        nombre: 'LITERATURA I',
        urlPrograma: '',
        campoDisciplinar: 'HUMANIDADES'),
  ];
  List<MateriaPlanModel> cuartoSemestre = [
    MateriaPlanModel(
        id: 1,
        nombre: 'MATEMÁTICAS IV',
        urlPrograma: '',
        campoDisciplinar: 'MATEMÁTICAS'),
    MateriaPlanModel(
        id: 2,
        nombre: 'BIOLOGÍA II',
        urlPrograma: '',
        campoDisciplinar: 'CIENCIAS EXPERIMENTALES'),
    MateriaPlanModel(
        id: 3,
        nombre: 'FÍSICA II',
        urlPrograma: '',
        campoDisciplinar: 'CIENCIAS EXPERIMENTALES'),
    MateriaPlanModel(
        id: 4,
        nombre: 'HISTORIA DE MÉXICO II',
        urlPrograma: '',
        campoDisciplinar: 'CIENCIAS SOCIALES'),
    MateriaPlanModel(
        id: 5,
        nombre: 'INGLÉS IV',
        urlPrograma: '',
        campoDisciplinar: 'COMUNICACIÓN'),
    MateriaPlanModel(
        id: 6,
        nombre: 'COMUNIDADES VIRTUALES',
        urlPrograma: '',
        campoDisciplinar: 'COMUNICACIÓN'),
    MateriaPlanModel(
        id: 7,
        nombre: 'MANTENIMIENTO Y REDES DE COMPUTO',
        urlPrograma: '',
        campoDisciplinar: 'COMUNICACIÓN'),
    MateriaPlanModel(
        id: 8,
        nombre: 'LITERATURA II',
        urlPrograma: '',
        campoDisciplinar: 'HUMANIDADES'),
  ];
  List<MateriaPlanModel> quintoSemestre = [
    MateriaPlanModel(
        id: 1,
        nombre: 'MATEMÁTICAS V',
        urlPrograma: '',
        campoDisciplinar: 'MATEMÁTICAS'),
    MateriaPlanModel(
        id: 2,
        nombre: 'GEOGRAFÍA',
        urlPrograma: '',
        campoDisciplinar: 'CIENCIAS EXPERIMENTALES'),
    MateriaPlanModel(
        id: 3,
        nombre: 'ESTRUCTURA SOCIOECONÓMICA DE MÉXICO',
        urlPrograma: '',
        campoDisciplinar: 'CIENCIAS SOCIALES'),
    MateriaPlanModel(
        id: 4,
        nombre: 'ECONOMÍA I',
        urlPrograma: '',
        campoDisciplinar: 'CIENCIAS SOCIALES'),
    MateriaPlanModel(
        id: 5,
        nombre: 'PSICOLOGÍA I',
        urlPrograma: '',
        campoDisciplinar: 'CIENCIAS SOCIALES'),
    MateriaPlanModel(
        id: 6,
        nombre: 'DERECHO I',
        urlPrograma: '',
        campoDisciplinar: 'CIENCIAS SOCIALES'),
    MateriaPlanModel(
        id: 7,
        nombre: 'INGLÉS V',
        urlPrograma: '',
        campoDisciplinar: 'COMUNICACIÓN'),
    MateriaPlanModel(
        id: 8,
        nombre: 'SISTEMAS DE INFORMACIÓN',
        urlPrograma: '',
        campoDisciplinar: 'COMUNICACIÓN'),
    MateriaPlanModel(
        id: 9,
        nombre: 'PROGRAMACIÓN',
        urlPrograma: '',
        campoDisciplinar: 'COMUNICACIÓN'),
    MateriaPlanModel(
        id: 10,
        nombre: 'INTRODUCCIÓN A LA FILOSOFÍA',
        urlPrograma: '',
        campoDisciplinar: 'HUMANIDADES'),
  ];
  List<MateriaPlanModel> sextoSemestre = [
    MateriaPlanModel(
        id: 1,
        nombre: 'MATEMÁTICAS VI',
        urlPrograma: '',
        campoDisciplinar: 'MATEMÁTICAS'),
    MateriaPlanModel(
        id: 2,
        nombre: 'ECOLOGÍA Y MEDIO AMBIENTE',
        urlPrograma: '',
        campoDisciplinar: 'CIENCIAS EXPERIMENTALES'),
    MateriaPlanModel(
        id: 3,
        nombre: 'HISTORIA UNIVERSAL CONTEMPORANEA',
        urlPrograma: '',
        campoDisciplinar: 'CIENCIAS SOCIALES'),
    MateriaPlanModel(
        id: 4,
        nombre: 'ECONOMÍA II',
        urlPrograma: '',
        campoDisciplinar: 'CIENCIAS SOCIALES'),
    MateriaPlanModel(
        id: 5,
        nombre: 'PSICOLOGÍA II',
        urlPrograma: '',
        campoDisciplinar: 'CIENCIAS SOCIALES'),
    MateriaPlanModel(
        id: 6,
        nombre: 'DERECHO II',
        urlPrograma: '',
        campoDisciplinar: 'CIENCIAS SOCIALES'),
    MateriaPlanModel(
        id: 7,
        nombre: 'INGLÉS VI',
        urlPrograma: '',
        campoDisciplinar: 'CIENCIAS SOCIALES'),
    MateriaPlanModel(
        id: 8,
        nombre: 'PAGINAS WEB',
        urlPrograma: '',
        campoDisciplinar: 'COMUNICACIÓN'),
    MateriaPlanModel(
        id: 9,
        nombre: 'DISEñO DIGITAL',
        urlPrograma: '',
        campoDisciplinar: 'COMUNICACIÓN'),
    MateriaPlanModel(
        id: 10,
        nombre: 'FILOSOFÍA',
        urlPrograma: '',
        campoDisciplinar: 'HUMANIDADES'),
  ];

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: Text(plan.nombre)),
      body: Container(
        padding: EdgeInsets.only(right: 26, left: 26, top: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TitleWidget(title: "Materias a cursar", color: kMainColor),
            SizedBox(height: 10.0),
            Expanded(
                child: Container(
              padding: EdgeInsets.only(right: 0, left: 7, top: 10),
              child: SingleChildScrollView(
                child: Column(
                  children: _selectSemestre(plan.id)
                      .map((p) => _materiasTile(p))
                      .toList(),
                ),
              ),
            )),
          ],
        ),
      ),
    );
  }

  List<MateriaPlanModel> _selectSemestre(int semestre) {
    switch (semestre) {
      case 1:
        return primerSemestre;
        break;
      case 2:
        return segundoSemestre;
        break;
      case 3:
        return tercerSemestre;
        break;
      case 4:
        return cuartoSemestre;
        break;
      case 5:
        return quintoSemestre;
        break;
      case 6:
        return sextoSemestre;
        break;
      default:
    }
  }

  Widget _materiasTile(MateriaPlanModel materia) {
    return Container(
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
                          _nombreMateria(materia.nombre),
                          SizedBox(height: 2.0),
                          _descripcionMateria(materia.campoDisciplinar),
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
          FontAwesomeIcons.download,
          size: 12,
          color: kSecondaryColor,
        ),
      ),
    );
  }

  Widget _nombreMateria(String text) {
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

  Widget _descripcionMateria(String text) {
    return Container(
      child: Text(
        'Campo Disciplinar - ' + text,
        style: TextStyle(
          fontSize: 10.0,
          fontWeight: FontWeight.w300,
          color: Color(0xFF787878),
        ),
      ),
    );
  }
}

class MateriaPlanModel {
  int id;
  String nombre;
  String urlPrograma;
  String campoDisciplinar;

  MateriaPlanModel(
      {this.id, this.nombre, this.urlPrograma, this.campoDisciplinar});
}
