import 'package:control_escolar/const/const.dart';
import 'package:control_escolar/providers/auth_provider.dart';
import 'package:control_escolar/screens/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child: MaterialApp(
        //theme: ThemeData(primaryColor: kBaseColor),
        debugShowCheckedModeBanner: false,
        title: 'Control Escolar',
        home: LoginScreen(),
      ),
    );
  }
}
