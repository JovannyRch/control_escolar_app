import 'package:control_escolar/models/ClaseModel.dart';
import 'package:flutter/material.dart';

class ClassCard extends StatelessWidget {
  final ClaseModel clase;
  ClassCard({@required this.clase});

@override 
  Widget build(BuildContext context) {
    return Container(
      child: Text("Clase card"),
    );
  }
}