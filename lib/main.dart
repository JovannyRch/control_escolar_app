import 'package:control_escolar/const/const.dart';
import 'package:control_escolar/providers/app_state_provider.dart';
import 'package:control_escolar/providers/apreciacion_provider.dart';
import 'package:control_escolar/providers/auth_provider.dart';
import 'package:control_escolar/routes/routes.dart';
import 'package:control_escolar/screens/alumno/home_alumno_screen.dart';
import 'package:control_escolar/screens/auth/login_screen.dart';
import 'package:control_escolar/screens/padre/home_padre_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:control_escolar/shared/user_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  UserPrefrences userPrefrences = new UserPrefrences();
  await userPrefrences.initPrefs();

  //Validamos si el usuario esta ya autentificado
  String initialRoute;
  if (userPrefrences.isLogged) {
    initialRoute = getHomeName(userPrefrences.role);
  } else {
    initialRoute = LoginScreen.routeName;
  }

  runApp(MyApp(initialRoute));
}

String getHomeName(String role) {
  if (role == "alumno") {
    return HomeAlumnoScreen.routeName;
  }
  if (role == "padre") {
    return HomePadreScreen.routeName;
  }
  return LoginScreen.routeName;
}

class MyApp extends StatelessWidget {
  final initialRoute;
  MyApp(this.initialRoute);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => AppStateProvider()),
        ChangeNotifierProvider(create: (_) => ApreciacionProvider()),
      ],
      child: MaterialApp(
        theme: ThemeData(primaryColor: kGreyColor),
        debugShowCheckedModeBanner: false,
        title: 'Control Escolar',
        initialRoute: initialRoute,
        routes: routes,
      ),
    );
  }
}
