import 'package:control_escolar/const/const.dart';
import 'package:control_escolar/models/MateriaProfesorModel.dart';
import 'package:control_escolar/services/profesor_service.dart';
import 'package:control_escolar/widgets/LoaderWidget.dart';
import 'package:control_escolar/widgets/MateriaPreviewProfesor.dart';
import 'package:control_escolar/widgets/TitleWidget.dart';
import 'package:flutter/material.dart';

class MateriasProfesor extends StatefulWidget {
  @override
  _MateriasProfesorState createState() => _MateriasProfesorState();
}

class _MateriasProfesorState extends State<MateriasProfesor> {
  ProfesorService _service = new ProfesorService();
  List<MateriaProfesorModel> materias = [];
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
    materias = await _service.fetchMaterias();
    setIsLoading(false);
  }


  void setIsLoading(bool val){
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
          TitleWidget(title: "Materias", color: kMainColor),
          Expanded(
              child: Container(
            child: SingleChildScrollView(
              child: _renderMateria(),
            ),
          ))
        ],
      ),
    );
  }

  Widget _renderMateria() {
    if(isLoading){
      return LoaderWidget.expanded(_size);
    }

    return Column(
      children: [
        ...materias.map((e) => MateriaPreviewProfesor(materia: e)).toList(),
      ],
    );
  }
}
