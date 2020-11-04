import 'dart:ui';

import 'package:control_escolar/const/const.dart';
import 'package:control_escolar/models/NoticiaModel.dart';
import 'package:control_escolar/widgets/NoticiaWidget.dart';
import 'package:control_escolar/widgets/TitleWidget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AlumnoNoticiasScreen extends StatefulWidget {
  AlumnoNoticiasScreen({Key key}) : super(key: key);

  @override
  _AlumnoNoticiasScreenState createState() => _AlumnoNoticiasScreenState();
}

class _AlumnoNoticiasScreenState extends State<AlumnoNoticiasScreen> {
  List<NoticiaModel> noticias = [
    NoticiaModel(
      id: 1,
      title: "Noticia 1",
      description:
          "Adipisicing qui id labore mollit laborum ipsum fugiat est sit proident duis magna eiusmod. Voluptate enim quis enim reprehenderit est labore id. Deserunt in aliqua laborum reprehenderit veniam irure magna ad. Id occaecat id anim mollit sit qui ad voluptate quis exercitation irure ullamco tempor id. Mollit sunt nulla fugiat sint aliquip consequat officia fugiat reprehenderit irure magna. Laboris laboris magna elit consectetur ea quis adipisicing anim id ex eu ad aliquip. Labore laborum aute in enim qui labore reprehenderit in nisi nisi nulla in et.",
      content: "",
    ),
    NoticiaModel(
      id: 1,
      title: "Noticia 1",
      description:
          "Adipisicing qui id labore mollit laborum ipsum fugiat est sit proident duis magna eiusmod. Voluptate enim quis enim reprehenderit est labore id. Deserunt in aliqua laborum reprehenderit veniam irure magna ad. Id occaecat id anim mollit sit qui ad voluptate quis exercitation irure ullamco tempor id. Mollit sunt nulla fugiat sint aliquip consequat officia fugiat reprehenderit irure magna. Laboris laboris magna elit consectetur ea quis adipisicing anim id ex eu ad aliquip. Labore laborum aute in enim qui labore reprehenderit in nisi nisi nulla in et.",
      content: "",
    ),
    NoticiaModel(
      id: 1,
      title: "Noticia 1",
      description:
          "Adipisicing qui id labore mollit laborum ipsum fugiat est sit proident duis magna eiusmod. Voluptate enim quis enim reprehenderit est labore id. Deserunt in aliqua laborum reprehenderit veniam irure magna ad. Id occaecat id anim mollit sit qui ad voluptate quis exercitation irure ullamco tempor id. Mollit sunt nulla fugiat sint aliquip consequat officia fugiat reprehenderit irure magna. Laboris laboris magna elit consectetur ea quis adipisicing anim id ex eu ad aliquip. Labore laborum aute in enim qui labore reprehenderit in nisi nisi nulla in et.",
      content: "",
    ),
    NoticiaModel(
      id: 1,
      title: "Noticia 1",
      description:
          "Adipisicing qui id labore mollit laborum ipsum fugiat est sit proident duis magna eiusmod. Voluptate enim quis enim reprehenderit est labore id. Deserunt in aliqua laborum reprehenderit veniam irure magna ad. Id occaecat id anim mollit sit qui ad voluptate quis exercitation irure ullamco tempor id. Mollit sunt nulla fugiat sint aliquip consequat officia fugiat reprehenderit irure magna. Laboris laboris magna elit consectetur ea quis adipisicing anim id ex eu ad aliquip. Labore laborum aute in enim qui labore reprehenderit in nisi nisi nulla in et.",
      content: "",
    ),
    NoticiaModel(
      id: 1,
      title: "Noticia 1",
      description:
          "Adipisicing qui id labore mollit laborum ipsum fugiat est sit proident duis magna eiusmod. Voluptate enim quis enim reprehenderit est labore id. Deserunt in aliqua laborum reprehenderit veniam irure magna ad. Id occaecat id anim mollit sit qui ad voluptate quis exercitation irure ullamco tempor id. Mollit sunt nulla fugiat sint aliquip consequat officia fugiat reprehenderit irure magna. Laboris laboris magna elit consectetur ea quis adipisicing anim id ex eu ad aliquip. Labore laborum aute in enim qui labore reprehenderit in nisi nisi nulla in et.",
      content: "",
    ),
    NoticiaModel(
      id: 1,
      title: "Noticia 1",
      description:
          "Adipisicing qui id labore mollit laborum ipsum fugiat est sit proident duis magna eiusmod. Voluptate enim quis enim reprehenderit est labore id. Deserunt in aliqua laborum reprehenderit veniam irure magna ad. Id occaecat id anim mollit sit qui ad voluptate quis exercitation irure ullamco tempor id. Mollit sunt nulla fugiat sint aliquip consequat officia fugiat reprehenderit irure magna. Laboris laboris magna elit consectetur ea quis adipisicing anim id ex eu ad aliquip. Labore laborum aute in enim qui labore reprehenderit in nisi nisi nulla in et.",
      content: "",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    noticias = [];
    return Column(
      children: [
        _bannerApreciacion(),
        _noticiasColumn(),
      ],
    );
  }

  Widget _bannerApreciacion() {
    return Container(
      height: 80.0,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xFFF4F4F4),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset('assets/images/danger.png'),
              Text(
                "No olvides responder la apreciación estudiantil",
                maxLines: 2,
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "Contestar",
                style: TextStyle(
                  color: kDangerColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: 27.0,
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _noticiasColumn() {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 23.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 28.0),
            TitleWidget(title: "Noticias"),
            SizedBox(height: 8.0),
            Expanded(
              child: Container(
                child: noticias.length == 0
                    ? _empty()
                    : SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: noticias
                              .map((e) => NoticiaWidget(noticia: e))
                              .toList(),
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _empty() {
    return Center(
      child: Container(
        height: 170,
        width: 170,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Color(0xFFFFE3E3),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FaIcon(FontAwesomeIcons.newspaper, size: 64),
            SizedBox(height: 8),
            Text(
              "No tienes noticias",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 12.0,
                color: Color(0xFFFF0C0C),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
