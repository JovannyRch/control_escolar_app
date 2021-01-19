import 'package:control_escolar/const/const.dart';
import 'package:control_escolar/models/MateriaProfesorModel.dart';
import 'package:control_escolar/widgets/MateriaPreviewProfesor.dart';
import 'package:control_escolar/widgets/TitleWidget.dart';
import 'package:flutter/material.dart';

class MateriasProfesor extends StatefulWidget {
  MateriasProfesor({Key key}) : super(key: key);

  @override
  _MateriasProfesorState createState() => _MateriasProfesorState();
}

class _MateriasProfesorState extends State<MateriasProfesor> {

  List<MateriaProfesorModel> materias = [
    new MateriaProfesorModel(id: 1, nombre: "Matemáticas 1",),
    new MateriaProfesorModel(id: 2, nombre: "Matemáticas 2",),
    new MateriaProfesorModel(id: 3, nombre: "Programación",),
  ];

  @override
  Widget build(BuildContext context) {
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

  Widget _renderMateria(){
    return Column(
      children: [
        ...materias.map((e) => MateriaPreviewProfesor(materia: e)).toList(),
      ],
    );
  }
}