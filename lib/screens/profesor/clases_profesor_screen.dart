import 'package:control_escolar/const/const.dart';
import 'package:control_escolar/models/ClaseModel.dart';
import 'package:control_escolar/models/MateriaProfesorModel.dart';
import 'package:control_escolar/services/profesor_service.dart';
import 'package:control_escolar/widgets/ClassCard.dart';
import 'package:control_escolar/widgets/LoaderWidget.dart';
import 'package:control_escolar/widgets/MateriaPreviewProfesor.dart';
import 'package:control_escolar/widgets/TitleWidget.dart';
import 'package:flutter/material.dart';

class ClasesProfesor extends StatefulWidget {
  @override
  _ClasesProfesorState createState() => _ClasesProfesorState();
}

class _ClasesProfesorState extends State<ClasesProfesor> {
  ProfesorService _service = new ProfesorService();
  List<ClaseModel> clases = [];
  bool isLoading = false;

  Size _size;

  @override
  void initState() {
    // TODO: implement initState
    this.fetchMaterias();
    super.initState();
  }

  void fetchMaterias() async {
    setIsLoading(true);
    clases = await _service.fetchClases();
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

    return Container(
      padding: EdgeInsets.only(left: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20.0),
          TitleWidget(title: "Mis clases", color: kMainColor),
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

  Widget _renderClases() {
    if (isLoading) {
      return LoaderWidget.expanded(_size);
    }

    return Column(
      children: [
        ...clases.map((e) => ClassCard(clase: e)).toList(),
      ],
    );
  }
}
