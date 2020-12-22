import 'dart:ui';

import 'package:control_escolar/const/const.dart';
import 'package:control_escolar/providers/auth_provider.dart';
import 'package:control_escolar/screens/alumno/home_alumno_screen.dart';
import 'package:control_escolar/screens/auth/widgets/background_widget.dart';
import 'package:control_escolar/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:adaptive_dialog/adaptive_dialog.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Size _size;

  TextEditingController password = new TextEditingController();
  TextEditingController username = new TextEditingController();

  AuthProvider auth;
  AuthService authService = new AuthService();
  bool isCheckingUser = false;
  BuildContext _globalContext;

  @override
  Widget build(BuildContext context) {
    _globalContext = context;
    auth = Provider.of<AuthProvider>(context);
    _size = MediaQuery.of(context).size;
    return Scaffold(
      body: _scaffold(),
    );
  }

  Widget _scaffold() {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                BackgroundWidget(),
                _mainContent(),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _mainContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _logo(),
        _form(),
      ],
    );
  }

  Widget _form() {
    return Container(
      margin: EdgeInsets.only(top: _size.height * 0.22),
      padding: EdgeInsets.symmetric(
        horizontal: 35.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _authTitle(),
          SizedBox(height: 16.0),
          _input("Número de Cuenta", Icons.person, controller: this.username),
          _input("Contraseña", Icons.lock,
              isPassword: true, controller: this.password),
          _loginButton(),
        ],
      ),
    );
  }

  Widget _loginButton() {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        onPressed: !isCheckingUser ? checkInputData : null,
        color: kSecondaryColor,
        textColor: Colors.white,
        child: !isCheckingUser
            ? Text(
                "Iniciar sesión".toUpperCase(),
                style: TextStyle(fontSize: 14),
              )
            : CircularProgressIndicator(),
      ),
    );
  }

  Widget _input(String text, IconData icon,
      {bool isPassword = false, TextEditingController controller}) {
    return Container(
      margin: EdgeInsets.only(bottom: 14.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: kMainColor,
          ),
          labelText: text,
          labelStyle: TextStyle(
            color: kMainColor,
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: kMainColor),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: kMainColor),
          ),
          border: UnderlineInputBorder(
            borderSide: BorderSide(color: kMainColor),
          ),
        ),
      ),
    );
  }

  Widget _authTitle() {
    return Text(
      "Iniciar sesión",
      style: TextStyle(
        color: kMainColor,
        fontWeight: FontWeight.w700,
        fontSize: 24.0,
      ),
    );
  }

  Widget _logo() {
    var container = Container(
      width: 120.0,
      height: 120.0,
      margin: EdgeInsets.only(top: 82.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(300.0),
        child: Image.asset(
          "assets/images/logo.jpeg",
          fit: BoxFit.fitWidth,
        ),
      ),
    );

    var name = Text(
      "EPO 60",
      style: TextStyle(
        color: Colors.white,
        fontSize: 16.0,
        fontWeight: FontWeight.w700,
      ),
    );
    return Column(children: [
      container,
      SizedBox(height: 16.0),
      name,
    ]);
  }

  //Handlers
  void handleLogin() async {
    setCheckingUser(true);
    bool isUserValid = await authService.login(username.text, password.text);
    if (isUserValid) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeAlumnoScreen()),
      );
    }
    setCheckingUser(false);
  }

  void tryLogin() {
    try {
      handleLogin();
    } catch (e) {
      showLoginErrorAlert();
    }
  }

  void showLoginErrorAlert() {
    showOkAlertDialog(
        context: _globalContext, message: "Ocurrió un error al hacer el login");
  }

  void checkInputData() {
    if (this.password.text.isEmpty || this.username.text.isEmpty) {
      this.showInvalidAlerts();
    } else {
      this.tryLogin();
    }
  }

  void showInvalidAlerts() {
    if (this.username.text.isEmpty) {
      showOkAlertDialog(
          context: _globalContext,
          message: "Ingrese un nombre de usuario o correo inválido");
    } else if (this.password.text.isEmpty) {
      showOkAlertDialog(
          context: _globalContext,
          message: "La contraseña no puede estar vacía");
    }
  }

  void setCheckingUser(bool value) {
    setState(() {
      isCheckingUser = value;
    });
  }
}
