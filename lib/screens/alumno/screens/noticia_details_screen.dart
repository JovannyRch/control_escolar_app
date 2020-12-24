import 'package:control_escolar/const/const.dart';
import 'package:control_escolar/models/NoticiaModel.dart';
import 'package:control_escolar/widgets/CustomAppBar.dart';
import 'package:control_escolar/widgets/TitleWidget.dart';
import 'package:flutter/material.dart';

class NoticiaDetailsScreen extends StatefulWidget {
  final NoticiaModel noticia;
  NoticiaDetailsScreen({this.noticia});

  @override
  _NoticiaDetailsScreenState createState() => _NoticiaDetailsScreenState();
}

class _NoticiaDetailsScreenState extends State<NoticiaDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: CustomAppBar(title: "Lunes 14 de Diciembre del 2020", actions: [
        Container(
          padding: EdgeInsets.only(right: 13.0),
          child: IconButton(
            icon: Icon(Icons.close),
            color: Colors.black,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ]),
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 28.0,
          vertical: 24.0,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TitleWidget(
                title: widget.noticia.title.toUpperCase(),
                color: kMainColor,
              ),
              SizedBox(height: 20.0),
              _imageContainer(),
              SizedBox(height: 23.0),
              Text(
                widget.noticia.body,
                style: TextStyle(),
                textAlign: TextAlign.justify,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _imageContainer() {
    return Container(
      height: 217.0,
      child: Image.network(widget.noticia.img),
    );
  }
}
