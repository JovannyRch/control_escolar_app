import 'package:control_escolar/const/const.dart';
import 'package:control_escolar/models/ClaseModel.dart';
import 'package:control_escolar/providers/profesor_provider.dart';
import 'package:control_escolar/services/profesor_service.dart';
import 'package:control_escolar/widgets/ClassCard.dart';
import 'package:control_escolar/widgets/CurrentClass.dart';
import 'package:control_escolar/widgets/LoaderWidget.dart';
import 'package:control_escolar/widgets/TitleWidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ClasesProfesor extends StatefulWidget {
  @override
  _ClasesProfesorState createState() => _ClasesProfesorState();
}

class _ClasesProfesorState extends State<ClasesProfesor> {
  ProfesorService _service = new ProfesorService();
  ProfesorProvider _provider;

  ClaseModel _currentClass;

  Size _size;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void fetchClases() async {
    _provider.isLoadingClases = true;
    _provider.clases = await _service.fetchClases();
    _currentClass = ClaseModel.getCurrentClase(_provider.clases);
    _provider.isLoadingClases = false;
  }

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;

    _provider = Provider.of<ProfesorProvider>(context);

    if (_provider.clases == null) {
      fetchClases();
    }

    return Container(
      padding: EdgeInsets.only(left: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _renderCurrentClass(),
          SizedBox(height: 20.0),
          TitleWidget(title: "Mis clases", color: kMainColor),
          SizedBox(height: 10.0),
          Expanded(
            child: Container(
              child: SingleChildScrollView(
                child: _renderClases(),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _renderCurrentClass() {
    if (_currentClass == null) return Container();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20.0),
        TitleWidget(title: "Clase actual", color: kMainColor),
        CurrentClass(clase: _currentClass),
      ],
    );
  }

  Widget _renderClases() {
    if (_provider.isLoadingClases) {
      return LoaderWidget.expanded(_size);
    }

    return Column(
      children: [
        ..._provider.clases.map((e) => ClassCard(clase: e)).toList(),
      ],
    );
  }
}
