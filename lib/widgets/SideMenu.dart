import 'package:flutter/material.dart';

class SideMenu extends StatefulWidget {
  SideMenu({Key key}) : super(key: key);

  @override
  _SideMenuState createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Side menu"),
    );
  }
}
