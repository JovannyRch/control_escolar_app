import 'package:control_escolar/const/const.dart';
import 'package:flutter/material.dart';

class CredencialWidget extends StatefulWidget {
  CredencialWidget({Key key}) : super(key: key);

  @override
  _CredencialWidgetState createState() => _CredencialWidgetState();
}

class _CredencialWidgetState extends State<CredencialWidget> {
  @override
  Widget build(BuildContext context) {
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
    return Center(
      child: Container(
        width: 263,
        height: 357,
        decoration: BoxDecoration(
          color: kMainColor,
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }
}
