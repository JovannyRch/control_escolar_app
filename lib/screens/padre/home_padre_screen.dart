import 'package:control_escolar/const/const.dart';
import 'package:control_escolar/models/AlumnoModel.dart';
import 'package:control_escolar/widgets/HijoListItemWidget.dart';
import 'package:control_escolar/widgets/SideMenu.dart';
import 'package:control_escolar/widgets/TitleWidget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePadreScreen extends StatefulWidget {
  static const routeName = '/homePadre';
  HomePadreScreen({Key key}) : super(key: key);

  @override
  _HomePadreScreenState createState() => _HomePadreScreenState();
}

class _HomePadreScreenState extends State<HomePadreScreen> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  List<AlumnoModel> hijos = [
    AlumnoModel(
        id: 1,
        apellidoMaterno: 'Perez',
        apellidoPaterno: 'Ramirez',
        nombre: 'Juan',
        matricula: 1520934,
        semestre: 1,
        img: 'assets/images/icon-student.png'),
    AlumnoModel(
        id: 1,
        apellidoMaterno: 'Perez',
        apellidoPaterno: 'Ramirez',
        nombre: 'Martha',
        matricula: 1520934,
        semestre: 6,
        img: 'assets/images/icon-student2.png')
  ];

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
      children: [
        _bannerDescriptivo(),
        SizedBox(height: 20.0),
        _hijosColumn(context),
      ],
    );
  }

  Widget _bannerDescriptivo() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      padding: EdgeInsets.symmetric(horizontal: 28.0, vertical: 22.0),
      child: Text(
        "Aquí podríamos dejar un texto descriptivo de este apartdo, informativo ",
        maxLines: 3,
        overflow: TextOverflow.clip,
        style: TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  Widget _hijosColumn(BuildContext context) {
    final mq = MediaQuery.of(context);
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 40.0),
        decoration: BoxDecoration(
          color: kMainColor,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(38.0),
            topRight: const Radius.circular(38.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TitleWidget(
              title: "Hijos Registrados",
              color: kGreenPistache,
            ),
            Expanded(
              child: Container(
                child: hijos.length == 0
                    ? _empty()
                    : SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: hijos
                              .map((e) => HijoListItemWidget(hijo: e))
                              .toList(),
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _menuIcon() {
    return Container(
      padding: EdgeInsets.only(right: 13.0),
      child: IconButton(
        icon: Icon(Icons.menu, color: Colors.black),
        onPressed: () => scaffoldKey.currentState.openEndDrawer(),
      ),
    );
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

  Widget _empty() {
    return Center(
      child: Container(
        height: 170,
        width: 170,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: kBabyBlue,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FaIcon(FontAwesomeIcons.chair, size: 64),
            SizedBox(height: 8),
            Text(
              "!No tienes registros!",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 12.0,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
