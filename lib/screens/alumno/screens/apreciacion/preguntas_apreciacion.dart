import 'dart:ui';

import 'package:control_escolar/const/const.dart';
import 'package:control_escolar/models/PreguntaApreciacionModel.dart';
import 'package:control_escolar/models/ProfesorPreviewModel.dart';
import 'package:control_escolar/providers/apreciacion_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PreguntasApreciacionScreen extends StatefulWidget {
  PreguntasApreciacionScreen({Key key}) : super(key: key);

  @override
  _PreguntasApreciacionScreenState createState() =>
      _PreguntasApreciacionScreenState();
}

class _PreguntasApreciacionScreenState
    extends State<PreguntasApreciacionScreen> {
  ApreciacionProvider apreciacionProvider;
  int total;
  int actual;
  Size _size;

  final SPACE_PROFESOR_SIZE = 150.0;

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;
    apreciacionProvider = Provider.of<ApreciacionProvider>(context);

    total = apreciacionProvider.totalPreguntas;
    actual = apreciacionProvider.indexPreguntaActual;

    return Scaffold(
      body: _body(),
    );
  }

  Widget _body() {
    return Container(
      color: Colors.grey.shade200,
      width: double.infinity,
      child: SafeArea(
          child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _infoPregunta(),
            SizedBox(height: 15),
            _cardPregunta(),
          ],
        ),
      )),
    );
  }

  Widget _infoPregunta() {
    return Text("Pregunta actual ${actual + 1}/$total");
  }

  Widget _cardPregunta() {
    return Container(
      width: _size.width * 0.85,
      padding: EdgeInsets.symmetric(
        vertical: 15,
        horizontal: 10,
      ),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadiusDirectional.circular(10),
      ),
      child: Column(
        children: [
          _preguntaText(),
          SizedBox(height: 10),
          /*   _columns(), */
          _profesoresInput(),
        ],
      ),
    );
  }

  /* Widget _columns() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          width: SPACE_PROFESOR_SIZE,
          height: 10,
          color: Colors.grey,
        ),
        _numberIndicaton(1),
        _numberIndicaton(2),
        _numberIndicaton(3),
        _numberIndicaton(4),
        _numberIndicaton(5),
      ],
    );
  }
 */
  Widget _numberIndicaton(int number) {
    return Container(
      child: Text("$number"),
    );
  }

  Widget _preguntaText() {
    PreguntaApreciacionModel preguntaActual =
        apreciacionProvider.preguntas[actual];
    return Text(
      "${preguntaActual.pregunta}",
      style: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 18,
      ),
      textAlign: TextAlign.justify,
    );
  }

  Widget _profesoresInput() {
    List<ProfesorPreviewModel> profesores = apreciacionProvider.profesores;

    return Container(
      child: Column(
        children:
            profesores.map((profesor) => _profesorItem(profesor)).toList(),
      ),
    );
  }

  Widget _profesorItem(ProfesorPreviewModel profesor) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Divider(),
          _profesorName(profesor),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _input(1, profesor.profesorId),
              _input(2, profesor.profesorId),
              _input(3, profesor.profesorId),
              _input(4, profesor.profesorId),
              _input(5, profesor.profesorId),
            ],
          ),
          Divider(),
        ],
      ),
    );
  }

  Widget _profesorName(ProfesorPreviewModel profesor) {
    return Container(
      child: Text(
        "${profesor.profesor}",
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  Widget _input(int value, int profesorId) {
    return Row(
      children: [
        Text("$value"),
        Radio(
          value: value,
          groupValue: profesorId,
          onChanged: (value) {},
        ),
      ],
    );
  }
}
