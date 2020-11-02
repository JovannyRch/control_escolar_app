import 'package:control_escolar/const/const.dart';
import 'package:control_escolar/screens/alumno/alumno_asistencia_screen.dart';
import 'package:control_escolar/screens/alumno/alumno_estudios_screen.dart';
import 'package:control_escolar/screens/alumno/alumno_noticias_screen.dart';
import 'package:control_escolar/widgets/SideMenu.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeAlumnoScreen extends StatefulWidget {
  HomeAlumnoScreen({Key key}) : super(key: key);

  @override
  _HomeAlumnoScreenState createState() => _HomeAlumnoScreenState();
}

class _HomeAlumnoScreenState extends State<HomeAlumnoScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: SideMenu(),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: _titleAppbar(),
        backgroundColor: kGreyColor,
        elevation: 1,
        actions: [
          _menuIcon(),
        ],
      ),
      body: _body(),
      bottomNavigationBar: _bottomNavigation(),
    );
  }

  Widget _bottomNavigation() {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      backgroundColor: kMainColor,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey.withOpacity(0.82),
      onTap: (value) {
        setState(() {
          _currentIndex = value;
        });
      },
      items: [
        BottomNavigationBarItem(
            icon: FaIcon(
              FontAwesomeIcons.newspaper,
            ),
            label: "Noticias"),
        BottomNavigationBarItem(
            icon: FaIcon(
              FontAwesomeIcons.graduationCap,
            ),
            label: "Estudios",
            backgroundColor: Colors.white),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            label: "Asistencia"),
      ],
    );
  }

  Widget _body() {
    return IndexedStack(
      index: _currentIndex,
      children: [
        AlumnoNoticiasScreen(),
        AlumnoEstudiosScreen(),
        AlumnoAsistenciasScreen(),
      ],
    );
  }

  Widget _menuIcon() {
    return Container(
      padding: EdgeInsets.only(right: 13.0),
      child: Icon(Icons.menu, color: Colors.black),
    );
  }

  Widget _titleAppbar() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Jovanny Ramírez Chimal",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w400,
            fontSize: 14,
          ),
        ),
        Text(
          "Alumno",
          style: TextStyle(
            color: kDisableColor,
            fontWeight: FontWeight.w300,
            fontSize: 13,
          ),
        )
      ],
    );
  }
}
