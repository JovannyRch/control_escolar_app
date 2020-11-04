import 'package:control_escolar/const/const.dart';
import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  final String title;
  TitleWidget({@required this.title});

  @override
  Widget build(BuildContext context) {
    return _title(this.title);
  }

  Widget _title(String text) {
    return Text(
      text,
      style: TextStyle(
        color: kMainColor,
        fontSize: 17.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
