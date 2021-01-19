import 'package:control_escolar/const/const.dart';
import 'package:control_escolar/models/GruposMateriaModel.dart';
import 'package:control_escolar/models/MateriaProfesorModel.dart';
import 'package:control_escolar/services/profesor_service.dart';
import 'package:control_escolar/widgets/CustomAppBar.dart';
import 'package:control_escolar/widgets/LoaderWidget.dart';
import 'package:control_escolar/widgets/TitleWidget.dart';
import 'package:control_escolar/screens/profesor/alumnos_grupo_profesor_screen.dart';
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
  bool isLoading = false;
  List<GruposMateriaModel> grupos = [];
  ProfesorService _service = new ProfesorService();
  Size _size;

  @override
  void initState() {
    this.fetchGrupos();
    super.initState();
  }

  void fetchGrupos() async {
    setIsLoading(true);
    grupos = await _service.fetchGruposMateria(widget.materia.id);
    setIsLoading(false);
  }

  void setIsLoading(bool val) {
    setState(() {
      isLoading = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: CustomAppBar(title: widget.materia.nombre, leading: _backIcon()),
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

  Widget _backIcon() {
    return IconButton(
      icon: Icon(Icons.arrow_back, color: kMainColor),
      onPressed: () => Navigator.of(context).pop(),
    );
  }

  void handleBack() {
    Navigator.pop(context);
  }

  Widget _renderGrupos() {
    if (isLoading) {
      return LoaderWidget.expanded(_size);
    }
    return Column(
      children: [
        ...grupos.map((e) => _tileGrupo(e)).toList(),
      ],
    );
  }

  Widget _tileGrupo(GruposMateriaModel grupo) {
    return ListTile(
      onTap: () {
        handleTileGrupoClick(grupo);
      },
      leading: FaIcon(FontAwesomeIcons.users, color: kMainColor, size: 20.0),
      title: _nombre(grupo.nombre),
      trailing: FaIcon(FontAwesomeIcons.chevronRight, size: 15.0),
    );
  }

  void handleTileGrupoClick(GruposMateriaModel grupo) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>
              AlumnosProfesorScreen(grupo: grupo, materia: widget.materia)),
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
