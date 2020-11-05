import 'package:control_escolar/const/const.dart';
import 'package:control_escolar/screens/auth/login_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          appBarTheme: AppBarTheme(
        color: Colors.grey.shade100,
      )),
      title: 'Control Escolar',
      home: LoginScreen(),
    );
  }
}
