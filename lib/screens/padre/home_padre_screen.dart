import 'package:control_escolar/const/const.dart';
import 'package:control_escolar/widgets/SideMenu.dart';
import 'package:control_escolar/widgets/TitleWidget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePadreScreen extends StatefulWidget {
  HomePadreScreen({Key key}) : super(key: key);

  @override
  _HomePadreScreenState createState() => _HomePadreScreenState();
}

class _HomePadreScreenState extends State<HomePadreScreen> {
  List<String> hijos = ['Juan perex Guitierrez', 'Martha Perez Guitierrez'];

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: SideMenu(),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: _titleAppbar(),
        elevation: 0,
        actions: [_menuIcon()],
        backgroundColor: kGreyColor,
      ),
      body: _body(),
    );
  }

  Widget _body() {
    return Column(
      children: [_bannerDescriptivo(), _hijosColumn(context)],
    );
  }

  Widget _bannerDescriptivo() {
    return Container(
      height: 80.0,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(padding: EdgeInsets.only(left: 15.0, right: 15.0)),
              Expanded(
                child: Text(
                  "Aquí podríamos dejar un texto descriptivo de este apartdo, informativo ",
                  maxLines: 3,
                  overflow: TextOverflow.clip,
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
        ],
      ),
    );
  }

  Widget _hijosColumn(BuildContext context) {
    final mq = MediaQuery.of(context);
    return Column(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              color: kMainColor,
              borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(38.0),
                  topRight: const Radius.circular(38.0))),
          child: Container(
            width: double.infinity,
            height: mq.size.height - 160.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(height: mq.size.width / 10),
                Padding(
                    padding: EdgeInsets.only(left: mq.size.width / 10),
                    child: TitleWidget(
                        title: "Hijos Registrados", color: kGreenPistache)),
                Expanded(
                  child: Container(
                    child: hijos.length == 0
                        ? _empty()
                        : SingleChildScrollView(
                            physics: BouncingScrollPhysics(),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                            ),
                          ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _menuIcon() {
    return Container(
      padding: EdgeInsets.only(right: 13.0),
      child: Icon(Icons.menu, color: Colors.black),
    );
  }

  Widget _titleAppbar() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Juan Michua Rojas",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w400,
            fontSize: 14,
          ),
        ),
        Text(
          "Padre de familia",
          style: TextStyle(
            color: kDisableColor,
            fontWeight: FontWeight.w300,
            fontSize: 13,
          ),
        )
      ],
    );
  }

  Widget _empty() {
    return Center(
      child: Container(
        height: 170,
        width: 170,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: kBabyBlue,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FaIcon(FontAwesomeIcons.chair, size: 64),
            SizedBox(height: 8),
            Text(
              "!No tienes registros!",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 12.0,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
