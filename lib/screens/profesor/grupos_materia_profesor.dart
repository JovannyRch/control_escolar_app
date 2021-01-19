import 'package:control_escolar/const/const.dart';
import 'package:control_escolar/models/GruposMateriaModel.dart';
import 'package:control_escolar/models/MateriaProfesorModel.dart';
import 'package:control_escolar/widgets/CustomAppBar.dart';
import 'package:control_escolar/widgets/TitleWidget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GruposMateriaProfesorScreen extends StatefulWidget {
  final MateriaProfesorModel materia;

  GruposMateriaProfesorScreen({@required this.materia});

  @override
  _GruposMateriaProfesorScreenState createState() =>
      _GruposMateriaProfesorScreenState();
}

class _GruposMateriaProfesorScreenState
    extends State<GruposMateriaProfesorScreen> {
  List<GruposMateriaModel> grupos = [
    new GruposMateriaModel(id: 1, nombre: "Grupo a "),
    new GruposMateriaModel(id: 2, nombre: "Grupo b "),
    new GruposMateriaModel(id: 3, nombre: "Grupo c "),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: CustomAppBar(title: widget.materia.nombre, actions: [
         IconButton(icon: Icon(Icons.cancel_rounded), onPressed: handleBack)
       ] ),
      body: Container(
        padding: EdgeInsets.only(left: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.0),
            TitleWidget(title: "Grupos", color: kMainColor),
            Expanded(
                child: Container(
              child: SingleChildScrollView(
                child: _renderGrupos(),
              ),
            ))
          ],
        ),
      ),
    );
  }

  void handleBack(){
    Navigator.pop(context);
  }



  Widget _renderGrupos() {
    return Column(
      children: [
        ...grupos.map((e) => _tileGrupo(e)).toList(),
      ],
    );
  }

  Widget _tileGrupo(GruposMateriaModel grupo) {
    return ListTile(
      onTap: () {},
      leading: FaIcon(FontAwesomeIcons.users, color: kMainColor, size: 20.0),
      title: _nombre(grupo.nombre),
      trailing: FaIcon(FontAwesomeIcons.chevronRight, size: 15.0),
    );
  }

  Widget _nombre(String text) {
    return Container(
      child: Text(
        text,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.w700,
          color: Color(0xFF535353),
        ),
      ),
    );
  }
}
