import 'package:control_escolar/const/const.dart';
import 'package:control_escolar/helpers/global_helpers.dart';
import 'package:control_escolar/models/ClaseModel.dart';
import 'package:control_escolar/shared/user_preferences.dart';
import 'package:control_escolar/widgets/CustomAppBar.dart';
import 'package:flutter/material.dart';

class ClassDetailScreen extends StatefulWidget {
  final ClaseModel claseModel;

  ClassDetailScreen({this.claseModel});

  @override
  _ClassDetailScreenState createState() => _ClassDetailScreenState();
}

class _ClassDetailScreenState extends State<ClassDetailScreen> {
  UserPrefrences userPrefrences = new UserPrefrences();

  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        color: kMainColor,
        fontColor: Colors.white,
        title: userPrefrences.fullName,
        subtitle: formatRole(userPrefrences.role.toString()),
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            }),
      ),
      body: _body(),
      /*  bottomNavigationBar: _bottomNavigation(), */
    );
  }

  Widget _body() {
    return Container(
      child: Center(
        child: Text("hola"),
      ),
    );
  }
}
