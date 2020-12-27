import 'dart:ui';

import 'package:control_escolar/const/const.dart';
import 'package:control_escolar/models/ApreciacionModel.dart';
import 'package:control_escolar/models/NoticiaModel.dart';
import 'package:control_escolar/providers/app_state_provider.dart';
import 'package:control_escolar/screens/alumno/screens/apreciacion/apreciacion_details_screen.dart';
import 'package:control_escolar/services/apreciaciones_services.dart';
import 'package:control_escolar/services/noticias_service.dart';
import 'package:control_escolar/widgets/LoaderWidget.dart';
import 'package:control_escolar/widgets/NoticiaWidget.dart';
import 'package:control_escolar/widgets/TitleWidget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class AlumnoNoticiasScreen extends StatefulWidget {
  AlumnoNoticiasScreen({Key key}) : super(key: key);

  @override
  _AlumnoNoticiasScreenState createState() => _AlumnoNoticiasScreenState();
}

class _AlumnoNoticiasScreenState extends State<AlumnoNoticiasScreen> {
  List<NoticiaModel> noticias = [];
  bool isFetching = true;
  NoticiasService noticiasService = new NoticiasService();
  ApreciacionesService apreciacionesService = new ApreciacionesService();
  ApreciacionModel apreciacion;
  AppStateProvider appStateProvider;

  @override
  void initState() {
    super.initState();
    fetchApreciacionActiva();
    fetchNoticias();
  }

  void fetchApreciacionActiva() async {
    apreciacion = await apreciacionesService.fetchApreciacionActiva();
    if (apreciacion != null) {
      appStateProvider.apreciacion = apreciacion;
    }
  }

  void fetchNoticias() async {
    setFetching(true);
    noticias = await noticiasService.fetchNoticias();
    setFetching(false);
  }

  void setFetching(bool val) {
    setState(() {
      isFetching = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    appStateProvider = Provider.of<AppStateProvider>(context);

    return Column(
      children: [
        _bannerApreciacion(),
        _noticiasColumn(),
      ],
    );
  }

  void goToApreciacionDetail() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>
              ApreciacionDetailsScreen(apreciacion: apreciacion)),
    );
  }

  Widget _bannerApreciacion() {
    if (apreciacion == null) {
      return Container();
    }

    return GestureDetector(
      onTap: goToApreciacionDetail,
      child: Container(
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
                    fontWeight: FontWeight.w600,
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
            TitleWidget(title: "Noticias", color: kMainColor),
            SizedBox(height: 8.0),
            Expanded(
              child: _showDataOrLoading(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _showDataOrLoading() {
    if (isFetching) {
      return LoaderWidget();
    }
    return Container(
      child: noticias.length == 0 ? _empty() : _noticiaItems(),
    );
  }

  Widget _noticiaItems() {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: noticias.map((e) => NoticiaWidget(noticia: e)).toList(),
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
              "No se encontraron noticias",
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
