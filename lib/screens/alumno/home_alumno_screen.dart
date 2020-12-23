import 'package:control_escolar/const/const.dart';
import 'package:control_escolar/providers/auth_provider.dart';
import 'package:control_escolar/screens/alumno/alumno_asistencia_screen.dart';
import 'package:control_escolar/screens/alumno/alumno_estudios_screen.dart';
import 'package:control_escolar/screens/alumno/alumno_noticias_screen.dart';
import 'package:control_escolar/shared/user_preferences.dart';
import 'package:control_escolar/widgets/CustomAppBar.dart';
import 'package:control_escolar/widgets/SideMenu.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeAlumnoScreen extends StatefulWidget {
  static const routeName = '/homeAlumno';
  HomeAlumnoScreen({Key key}) : super(key: key);

  @override
  _HomeAlumnoScreenState createState() => _HomeAlumnoScreenState();
}

class _HomeAlumnoScreenState extends State<HomeAlumnoScreen> {



  int _currentIndex = 0;
  var scaffoldKey = GlobalKey<ScaffoldState>();
  
  UserPrefrences userPrefrences = new UserPrefrences();

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      endDrawer: SideMenu(),
      appBar: CustomAppBar(
        title:
            userPrefrences.fullName,
        subtitle: userPrefrences.role.toString(),
        actions: [
          IconButton(
            icon: Icon(Icons.menu, color: Colors.black),
            onPressed: () => scaffoldKey.currentState.openEndDrawer(),
          )
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
}
