import 'package:flutter/material.dart';

class DividerLine extends StatelessWidget {
  final double width;

  DividerLine({@required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 17.0),
      height: 0.5,
      width: this.width,
      color: Colors.black26,
    );
  }
}
