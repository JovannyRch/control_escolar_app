import 'package:control_escolar/const/const.dart';
import 'package:control_escolar/models/AlumnoModel.dart';
import 'package:control_escolar/models/MateriaModel.dart';
import 'package:control_escolar/widgets/MateriaListItemWidget.dart';
import 'package:control_escolar/widgets/SideMenu.dart';
import 'package:control_escolar/widgets/TitleWidget.dart';
import 'package:flutter/material.dart';

class PadreMateriasScreen extends StatefulWidget {
  PadreMateriasScreen({Key key}) : super(key: key);

  @override
  _PadreMateriasScreenState createState() => _PadreMateriasScreenState();
}

class _PadreMateriasScreenState extends State<PadreMateriasScreen> {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  List<MateriaModel> materias = [
    MateriaModel(
        nombre: 'Matematicas 2',
        nombreProfesor: 'Fernandeo Beltran Perez',
        status: true),
    MateriaModel(
        nombre: 'Español', nombreProfesor: 'Julian Guerra Paz', status: true),
    MateriaModel(
        nombre: 'Ingles', nombreProfesor: 'Victoria Cruz Cruz', status: true),
  ];

  AlumnoModel hijo = new AlumnoModel(
      id: 1,
      apellidoMaterno: 'Perez',
      apellidoPaterno: 'Ramirez',
      nombre: 'Juan',
      matricula: 1520934,
      semestre: 1,
      img: 'assets/images/icon-student.png');

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      endDrawer: SideMenu(),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: _titleAppbar(),
        elevation: 0,
        actions: [_menuIcon()],
        backgroundColor: kGreyColor,
      ),
      body: _body(),
    );
  }

  Widget _body() {
    return Column(
      children: [_bannerDescriptivo(), _materiasColumn(context)],
    );
  }

  Widget _bannerDescriptivo() {
    return Container(
      height: 90.0,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width / 15,
                  top: MediaQuery.of(context).size.width / 20),
              child: _hijoName()),
          Padding(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width / 15,
                  top: MediaQuery.of(context).size.width / 60),
              child: _matriculaHijo()),
          Padding(
            padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width / 15,
                top: MediaQuery.of(context).size.width / 60),
            child: _semestreHijo(),
          ),
        ],
      ),
    );
  }

  Widget _materiasColumn(BuildContext context) {
    final mq = MediaQuery.of(context);
    return Column(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              color: kGreenPistache,
              borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(38.0),
                  topRight: const Radius.circular(38.0))),
          child: Container(
            width: double.infinity,
            height: mq.size.height - 170.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(height: mq.size.width / 10),
                Padding(
                    padding: EdgeInsets.only(left: mq.size.width / 10),
                    child: TitleWidget(title: "Materias", color: kMainColor)),
                Expanded(
                  child: Container(
                    child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: materias
                            .map((e) => MateriaListItemWidget(materia: e))
                            .toList(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _menuIcon() {
    return Container(
        padding: EdgeInsets.only(right: 13.0),
        child: IconButton(
          icon: Icon(Icons.menu, color: Colors.black),
          onPressed: () => scaffoldKey.currentState.openEndDrawer(),
        ));
  }

  Widget _titleAppbar() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Juan Michua Rojas",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w400,
            fontSize: 14,
          ),
        ),
        Text(
          "Padre de familia",
          style: TextStyle(
            color: kDisableColor,
            fontWeight: FontWeight.w300,
            fontSize: 13,
          ),
        )
      ],
    );
  }

  Widget _hijoName() {
    return Text(
      '${hijo.nombre} ${hijo.apellidoPaterno} ${hijo.apellidoMaterno}',
      style: TextStyle(
          fontWeight: FontWeight.w400, fontSize: 16.0, color: kSecondaryColor),
    );
  }

  Widget _matriculaHijo() {
    return Text(
      'Matricula: ${hijo.matricula}',
      style: TextStyle(
          fontWeight: FontWeight.w400, fontSize: 14.0, color: Colors.black),
    );
  }

  Widget _semestreHijo() {
    var semestre;
    switch (hijo.semestre) {
      case 1:
        semestre = 'Primer';
        break;
      case 2:
        semestre = 'Segundo';
        break;
      case 3:
        semestre = 'Tercer';
        break;
      case 4:
        semestre = 'Cuarto';
        break;
      case 5:
        semestre = 'Quinto';
        break;
      case 6:
        semestre = 'Sexto';
        break;
      default:
        semestre = 'ND';
    }

    return Text(
      '$semestre Semestre',
      style: TextStyle(
          fontWeight: FontWeight.w400, fontSize: 12.0, color: Colors.black),
    );
  }
}
