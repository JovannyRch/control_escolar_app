import 'dart:ui';

import 'package:control_escolar/const/const.dart';
import 'package:control_escolar/models/NoticiaModel.dart';
import 'package:control_escolar/screens/alumno/screens/noticia_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NoticiaWidget extends StatelessWidget {
  final NoticiaModel noticia;
  NoticiaWidget({this.noticia});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => NoticiaDetailsScreen()),
        );
      },
      child: Container(
        padding: EdgeInsets.only(
          left: 16.0,
          right: 13.0,
          top: 16.0,
          bottom: 11.0,
        ),
        height: 130.0,
        margin: EdgeInsets.only(bottom: 16.0),
        decoration: BoxDecoration(
            color: kGreyColor,
            borderRadius: BorderRadius.circular(4.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.25),
                offset: Offset(0, 3),
                blurRadius: 3.0,
              )
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _title(),
            SizedBox(height: 8.0),
            _description(),
            SizedBox(height: 20.0),
            _link(),
          ],
        ),
      ),
    );
  }

  Widget _title() {
    return Text(
      this.noticia.title,
      style: TextStyle(
        color: kMainColor,
        fontSize: 14.0,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Widget _description() {
    return Container(
      child: Text(
        noticia.body,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: 12.0,
          color: kSecondaryTextColor,
        ),
        maxLines: 3,
      ),
    );
  }

  Widget _link() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Leer Noticia",
          style: TextStyle(
            fontSize: 12.0,
            color: kMainColor,
          ),
        ),
        Transform.rotate(
            angle: (pi) * 1.75,
            child: FaIcon(
              FontAwesomeIcons.arrowRight,
              size: 16.0,
            )),
      ],
    );
  }
}
