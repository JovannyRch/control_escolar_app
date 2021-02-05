import 'package:control_escolar/const/const.dart';
import 'package:flutter/material.dart';

class GradoGrupoIndicator extends StatelessWidget {
  final String grado;
  final String grupo;
  final double radius;

  GradoGrupoIndicator(
      {@required this.grado, @required this.grupo, this.radius = 40.0});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: radius,
      width: radius,
      decoration: BoxDecoration(
        color: kSecondaryColor.withOpacity(0.22),
        borderRadius: BorderRadius.circular(25.0),
      ),
      child: Center(
        child: Text(
          "$grado°$grupo",
          style: TextStyle(
            color: kSecondaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 16.0,
          ),
        ),
      ),
    );
  }
}
