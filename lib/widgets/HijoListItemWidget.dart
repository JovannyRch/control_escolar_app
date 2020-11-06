import 'package:control_escolar/const/const.dart';
import 'package:control_escolar/models/AlumnoModel.dart';
import 'package:control_escolar/screens/padre/padre_materias_screen.dart';
import 'package:control_escolar/widgets/DividerLine.dart';
import 'package:flutter/material.dart';

class HijoListItemWidget extends StatelessWidget {
  final AlumnoModel hijo;
  HijoListItemWidget({this.hijo});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PadreMateriasScreen()),
          );
        },
        child: Row(
          children: [
            Padding(
              padding:
                  EdgeInsets.only(left: MediaQuery.of(context).size.width / 10),
              child: CircleAvatar(
                  radius: 18.0,
                  backgroundColor: Colors.transparent,
                  child: Image.asset(hijo.img)),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width / 15,
                        top: MediaQuery.of(context).size.width / 20),
                    child: _hijoName()),
                Padding(
                    padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width / 15,
                        top: MediaQuery.of(context).size.width / 60),
                    child: _matriculaHijo()),
                Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width / 15,
                      top: MediaQuery.of(context).size.width / 60),
                  child: _semestreHijo(),
                ),
                /* IconButton(
                    icon: Icon(Icons.more, color: kGreenPistache),
                    onPressed: null), */
                DividerLine(
                    width: MediaQuery.of(context).size.width * 0.75,
                    color: Colors.white),
              ],
            )
          ],
        ));
  }

  Widget _hijoName() {
    return Text(
      '${hijo.nombre} ${hijo.apellidoPaterno} ${hijo.apellidoMaterno}',
      style: TextStyle(
          fontWeight: FontWeight.w400, fontSize: 16.0, color: kGreenPistache),
    );
  }

  Widget _matriculaHijo() {
    return Text(
      'Matricula: ${hijo.matricula}',
      style: TextStyle(
          fontWeight: FontWeight.w400, fontSize: 14.0, color: Colors.white),
    );
  }

  Widget _semestreHijo() {
    var semestre;
    switch (hijo.semestre) {
      case 1:
        semestre = 'Primer';
        break;
      case 2:
        semestre = 'Segundo';
        break;
      case 3:
        semestre = 'Tercer';
        break;
      case 4:
        semestre = 'Cuarto';
        break;
      case 5:
        semestre = 'Quinto';
        break;
      case 6:
        semestre = 'Sexto';
        break;
      default:
        semestre = 'ND';
    }

    return Text(
      '$semestre Semestre',
      style: TextStyle(
          fontWeight: FontWeight.w400, fontSize: 12.0, color: Colors.white),
    );
  }
}
