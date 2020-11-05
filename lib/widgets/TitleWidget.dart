import 'package:control_escolar/const/const.dart';
import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  final String title;
  final Color color;
  TitleWidget({@required this.title, @required this.color});

  @override
  Widget build(BuildContext context) {
    return _title(this.title, this.color);
  }

  Widget _title(String text, Color color) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: 17.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
