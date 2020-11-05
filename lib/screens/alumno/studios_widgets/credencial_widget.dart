import 'dart:math';
import 'dart:ui';

import 'package:control_escolar/const/const.dart';
import 'package:flutter/material.dart';

class CredencialWidget extends StatefulWidget {
  CredencialWidget({Key key}) : super(key: key);

  @override
  _CredencialWidgetState createState() => _CredencialWidgetState();
}

class _CredencialWidgetState extends State<CredencialWidget> {
  Size _size;

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [
            0.12,
            1.0,
          ],
          colors: [
            Color(0xFFF8F8F8),
            Color(0xFF52DE97),
          ],
        ),
      ),
      child: _cardContainer(),
    );
  }

  Widget _cardContainer() {
    return Stack(
      children: [
        _credencialInfoContainer(),
        _profileImg(),
      ],
    );
  }

  Widget _credencialInfoContainer() {
    return Positioned(
      top: 128.0,
      child: Container(
        width: _size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 263,
              height: 357,
              decoration: BoxDecoration(
                color: kMainColor,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: _credencialInfo(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _credencialInfo() {
    return Container(
      child: Row(
        children: [
          _schoolName(),
          SizedBox(width: 5.0),
          _columnInfo(),
        ],
      ),
    );
  }

  Widget _columnInfo() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _titleField("Nombre del alumno"),
        _valueField("Jovanny Ramírez Chimal"),
        SizedBox(height: 8.0),
        _titleField("Número de cuenta"),
        _valueField("1521004"),
        SizedBox(height: 18.0),
        _titleField("Carrera"),
        _valueField("Ingeniería en Computación"),
      ],
    );
  }

  Widget _valueField(String value, {double width = 175.0}) {
    return Container(
      width: width,
      margin: EdgeInsets.only(top: 2.0),
      child: Text(
        value,
        style: TextStyle(
          color: Colors.white,
          fontSize: 14.0,
          fontWeight: FontWeight.bold,
        ),
        maxLines: 2,
      ),
    );
  }

  Widget _titleField(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 10.0,
        fontWeight: FontWeight.bold,
        color: kSecondaryColor,
      ),
    );
  }

  Widget _schoolName() {
    return Container(
      child: RotatedBox(
        quarterTurns: 1,
        child: Container(
          height: 75.0,
          child: Text(
            "EPO 60",
            style: TextStyle(
              fontSize: 64.0,
              fontWeight: FontWeight.bold,
              color: Colors.white.withOpacity(0.16),
            ),
          ),
        ),
      ),
    );
  }

  Widget _profileImg() {
    return Positioned(
      top: 64.0,
      child: Container(
        width: _size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 64,
              backgroundColor: Colors.white,
              child: Image.asset("assets/images/avatar.png"),
            ),
          ],
        ),
      ),
    );
  }
}
