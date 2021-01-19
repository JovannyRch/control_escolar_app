
import 'package:control_escolar/helpers/global_helpers.dart';
import 'package:control_escolar/screens/profesor/materias_profesor_screen.dart';
import 'package:control_escolar/shared/user_preferences.dart';
import 'package:control_escolar/widgets/CustomAppBar.dart';
import 'package:control_escolar/widgets/SideMenu.dart';
import 'package:flutter/material.dart';

class HomeProfesorScreen extends StatefulWidget {
  static const routeName = '/homeProfesor';
  HomeProfesorScreen({Key key}) : super(key: key);

  @override
  _HomeProfesorScreenState createState() => _HomeProfesorScreenState();
}

class _HomeProfesorScreenState extends State<HomeProfesorScreen> {

  var scaffoldKey = GlobalKey<ScaffoldState>();

  UserPrefrences userPrefrences = new UserPrefrences();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      endDrawer: SideMenu(),
      appBar: CustomAppBar(
        title: userPrefrences.fullName,
        subtitle: formatRole(userPrefrences.role.toString()),
        actions: [
          IconButton(
            icon: Icon(Icons.menu, color: Colors.black),
            onPressed: () => scaffoldKey.currentState.openEndDrawer(),
          )
        ],
      ),
      body: _body(),
    );
  }

  Widget _body() {
    return MateriasProfesor();
  }
}
