import 'package:control_escolar/const/const.dart';
import 'package:flutter/material.dart';

Widget CustomAppBar({
  @required String title,
  String subtitle = "",
  List<Widget> actions = const [],
}) {
  return AppBar(
    automaticallyImplyLeading: false,
    title: _titleAppbar(title, subtitle),
    elevation: 0,
    actions: [
      ...actions,
    ],
  );
}

Widget _titleAppbar(String title, String subtitle) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 15,
        ),
      ),
      subtitle == ""
          ? Container()
          : Text(
              subtitle,
              style: TextStyle(
                color: kDisableColor,
                fontWeight: FontWeight.w300,
                fontSize: 13,
              ),
            )
    ],
  );
}
