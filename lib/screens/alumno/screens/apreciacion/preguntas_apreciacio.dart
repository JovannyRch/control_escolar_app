import 'package:control_escolar/models/PreguntaApreciacionModel.dart';
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

  @override
  Widget build(BuildContext context) {
    apreciacionProvider = Provider.of<ApreciacionProvider>(context);

    total = apreciacionProvider.totalPreguntas;
    actual = apreciacionProvider.indexPreguntaActual;

    return Scaffold(
      body: _body(),
    );
  }

  Widget _body() {
    return Container(
      width: double.infinity,
      child: SafeArea(
          child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [_infoPregunta(), _cardPregunta()],
        ),
      )),
    );
  }

  Widget _infoPregunta() {
    return Text("Pregunta actual ${actual + 1}/$total");
  }

  Widget _cardPregunta() {
    PreguntaApreciacionModel preguntaActual =
        apreciacionProvider.preguntas[actual];
    return Container(
      child: Column(
        children: [
          Text("${preguntaActual.pregunta}"),
        ],
      ),
    );
  }
}
