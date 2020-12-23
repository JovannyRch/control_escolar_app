
import 'package:control_escolar/screens/alumno/home_alumno_screen.dart';
import 'package:control_escolar/screens/auth/login_screen.dart';
import 'package:control_escolar/screens/padre/home_padre_screen.dart';

final routes = {
  LoginScreen.routeName: (context) => LoginScreen(),
  HomeAlumnoScreen.routeName: (_) =>  HomeAlumnoScreen(),
  HomePadreScreen.routeName: (_) =>  HomePadreScreen(),
};