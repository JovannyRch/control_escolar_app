import 'package:control_escolar/const/const.dart';
import 'package:flutter/material.dart';

Widget CustomAppBar({
  @required String title,
  String subtitle = "",
  List<Widget> actions = const [],
  Widget leading = null,
  TabBar tabs,
  Color color = null,
  Color fontColor = null
}) {
  return AppBar(
    automaticallyImplyLeading: false,
    title: _titleAppbar(title, subtitle, fontColor),
    elevation: 0,
    actions: [
      ...actions,
    ],
    leading: leading,
    bottom: tabs,
    backgroundColor: color == null? kGreyColor: color,
  );
}

Widget _titleAppbar(String title, String subtitle, Color fontColor) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          color: fontColor == null? Colors.black: fontColor,
          fontWeight: FontWeight.bold,
          fontSize: 15,
        ),
      ),
      subtitle == ""
          ? Container()
          : Text(
              subtitle,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: fontColor == null? kDisableColor: fontColor,
                fontWeight: FontWeight.w300,
                fontSize: 13,
              ),
            )
    ],
  );
}
