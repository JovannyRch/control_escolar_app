import 'package:control_escolar/const/const.dart';
import 'package:control_escolar/helpers/token_helper.dart';
import 'package:control_escolar/screens/auth/widgets/background_widget.dart';
import 'package:control_escolar/screens/padre/home_padre_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Size _size;

  TextEditingController password = new TextEditingController();
  TextEditingController username = new TextEditingController();

  @override
  Widget build(BuildContext context) {
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
          _input("Número de Cuenta", Icons.person),
          _input("Contraseña", Icons.lock),
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
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomePadreScreen()),
          );
        },
        color: kSecondaryColor,
        textColor: Colors.white,
        child: Text("Iniciar sesión".toUpperCase(),
            style: TextStyle(fontSize: 14)),
      ),
    );
  }

  Widget _input(String text, IconData icon) {
    return Container(
      margin: EdgeInsets.only(bottom: 14.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: Icon(icon),
          labelText: text,
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
    //Focus.of(context).unfocus();
    /* //final auth = Provider.of<AuthService>(context, listen: false);
    //bool ok = await auth.login(username.text, password.text);
    if (ok) {
      //await saveToken(auth.token);
      if (!auth.user.isPremium) {
        Navigator.pushReplacementNamed(context, '/noPremium');
      } else {
        Navigator.pushReplacementNamed(context, '/home');
      }
    } else {
      //final error = auth.error;
    } */
  }
}
