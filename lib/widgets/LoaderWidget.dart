import 'package:control_escolar/const/const.dart';
import 'package:flutter/material.dart';

class LoaderWidget extends StatelessWidget {
  static Size _size;

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;
    return Center(
      child: CircularProgressIndicator(
        valueColor: new AlwaysStoppedAnimation<Color>(kMainColor),
      ),
    );
  }

  static Widget expanded(Size size) {
    return Container(
      height: size.height * 0.9,
      child: Center(
        child: CircularProgressIndicator(
      valueColor: new AlwaysStoppedAnimation<Color>(kMainColor),
        ),
      ),
    );
  }
}
