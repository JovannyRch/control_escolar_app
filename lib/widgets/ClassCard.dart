import 'package:control_escolar/const/const.dart';
import 'package:control_escolar/helpers/time_helper.dart';
import 'package:control_escolar/models/ClaseModel.dart';
import 'package:control_escolar/models/HorarioModel.dart';
import 'package:control_escolar/widgets/GradoGrupoIndicator.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ClassCard extends StatelessWidget {
  final ClaseModel clase;
  ClassCard({@required this.clase});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: handleMateriaDetails,
      child: Container(
        height: 65.0,
        width: double.infinity,
        margin: EdgeInsets.only(bottom: 10.0, right: 20.0),
        decoration: BoxDecoration(
          /*    color: kDisableColor.withOpacity(0.1), */
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Row(
          children: [
            _grupoGradoIndicator(),
            SizedBox(width: 10.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${clase.materia}",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: kMainColor,
                    ),
                  ),
                  SizedBox(height: 2.0),
                  Text(
                    getDaysString().capitalize(),
                    style: TextStyle(
                      color: kDisableColor.withOpacity(0.9),
                    ),
                  )
                ],
              ),
            ),
            FaIcon(
              FontAwesomeIcons.chevronRight,
              size: 16.0,
              color: kMainColor.withOpacity(0.5),
            ),
          ],
        ),
      ),
    );
  }

  void handleMateriaDetails() {}

  Widget _grupoGradoIndicator() {
    return GradoGrupoIndicator(grado: clase.grado, grupo: clase.grupo);
  }

  String getDaysString(){
    
    if(clase.horarios.isEmpty){
      return "No se han asignado horarios";
    }
    List<String> listaDias = [];
    for(HorarioModel h in clase.horarios){
      listaDias.add(TimeHelper.dayFromInt(h.dia));
    }

    return listaDias.join(", ");
  }

}
