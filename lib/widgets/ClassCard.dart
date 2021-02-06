import 'package:control_escolar/const/const.dart';
import 'package:control_escolar/helpers/time_helper.dart';
import 'package:control_escolar/models/ClaseModel.dart';
import 'package:control_escolar/models/HorarioModel.dart';
import 'package:control_escolar/providers/profesor_provider.dart';
import 'package:control_escolar/screens/profesor/alumnos_grupo_profesor_screen.dart';
import 'package:control_escolar/screens/profesor/asistencias_tab.dart';
import 'package:control_escolar/screens/profesor/class_detail_screen.dart';
import 'package:control_escolar/widgets/GradoGrupoIndicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class ClassCard extends StatelessWidget {
  final ClaseModel clase;
  final scaffoldKey;
  ClassCard({@required this.clase, @required this.scaffoldKey});
  ProfesorProvider provider;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<ProfesorProvider>(context);

    return GestureDetector(
      onTap: () {
        handlePaseDeLista(context);
      },
      child: Container(
        height: 90.0,
        width: double.infinity,
        margin: EdgeInsets.only(bottom: 10.0, right: 20.0),
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        decoration: BoxDecoration(
          color: kDisableColor.withOpacity(0.10),
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
                  SizedBox(height: 6.0),
                  Text(
                    getDaysString().capitalize(),
                    style: TextStyle(
                      color: kDisableColor.withOpacity(0.9),
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.chevron_right,
              color: kDisableColor,
            ),
            /* Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                _buttonIcon(
                    FontAwesomeIcons.sortNumericUp,
                    kMainColor.withOpacity(0.8),
                    () => handleCalificar(context)),
                SizedBox(
                  width: 8.0,
                ),
                _buttonIcon(FontAwesomeIcons.check, kSecondaryColor,
                    () => handlePaseDeLista(context)),
              ],
            ) */
          ],
        ),
      ),
    );
  }

  void handlePaseDeLista(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AlumnosProfesorScreen(clase: clase),
      ),
    );
  }

  void handleCalificar(BuildContext context) {
/* Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => SecondRoute()),
  ); */
  }

  Widget _buttonIcon(IconData icon, Color color, Function f) {
    const size = 35.0;
    return GestureDetector(
      onTap: f,
      child: Container(
        height: size,
        width: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
        ),
        child: Center(
            child: FaIcon(
          icon,
          size: 15.0,
          color: Colors.white,
        )),
      ),
    );
  }

  void handleMateriaDetails(BuildContext context) {
    Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => ClassDetailScreen(
          claseModel: this.clase,
        ),
      ),
    );
  }

  Widget _grupoGradoIndicator() {
    return GradoGrupoIndicator(grado: clase.grado, grupo: clase.grupo);
  }

  String getDaysString() {
    if (clase.horarios.isEmpty) {
      return "No se han asignado horarios";
    }
    List<String> listaDias = [];
    for (HorarioModel h in clase.horarios) {
      listaDias.add(TimeHelper.dayFromInt(h.dia));
    }

    return listaDias.join(", ");
  }
}
