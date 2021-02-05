import 'package:control_escolar/const/const.dart';
import 'package:control_escolar/helpers/global_helpers.dart';
import 'package:control_escolar/screens/profesor/asistencias_tab.dart';
import 'package:control_escolar/screens/profesor/clases_profesor_screen.dart';
import 'package:control_escolar/shared/user_preferences.dart';
import 'package:control_escolar/widgets/CustomAppBar.dart';
import 'package:control_escolar/widgets/SideMenu.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeProfesorScreen extends StatefulWidget {
  static const routeName = '/homeProfesor';
  HomeProfesorScreen({Key key}) : super(key: key);

  @override
  _HomeProfesorScreenState createState() => _HomeProfesorScreenState();
}

class _HomeProfesorScreenState extends State<HomeProfesorScreen> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  int _currentIndex = 0;

  UserPrefrences userPrefrences = new UserPrefrences();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      endDrawer: SideMenu(),
      appBar: CustomAppBar(
        color: kMainColor,
        fontColor: Colors.white,
        title: userPrefrences.fullName,
        subtitle: formatRole(userPrefrences.role.toString()),
        actions: [
          IconButton(
            icon: Icon(Icons.menu, color: Colors.white),
            onPressed: () => scaffoldKey.currentState.openEndDrawer(),
          )
        ],
      ),
      body: _body(),
     /*  bottomNavigationBar: _bottomNavigation(), */
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
              FontAwesomeIcons.book,
            ),
            label: "Clases"),
        BottomNavigationBarItem(
            icon: FaIcon(
              FontAwesomeIcons.check,
            ),
            label: "Pase de lista",
            backgroundColor: Colors.white),
        BottomNavigationBarItem(
            icon: Icon(
              Icons.grade,
            ),
            label: "Calificaciones"),
      ],
    );
  }

  Widget _body() {
    return  ClasesProfesor();
  }
}
