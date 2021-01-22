import 'package:control_escolar/const/const.dart';
import 'package:control_escolar/models/ClaseModel.dart';
import 'package:control_escolar/widgets/GradoGrupoIndicator.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CurrentClass extends StatelessWidget {
  final ClaseModel clase;
  CurrentClass({@required this.clase});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.0,
      width: double.infinity,
      margin: EdgeInsets.only(right: 20.0, top: 10.0),
      decoration: BoxDecoration(
        color: kDisableColor.withOpacity(0.05),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GradoGrupoIndicator(
                grado: clase.grado, grupo: clase.grupo, radius: 50.0),
            SizedBox(width: 15.0),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "${clase.materia}",
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                    color: kMainColor,
                  ),
                ),
              ],
            )
          ],
        ),
        SizedBox(height: 10.0),
        _pasarListaButton(),
      ]),
    );
  }

  Widget _pasarListaButton() {
    return Container(
      child: RaisedButton.icon(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        color: kSecondaryColor,
        onPressed: handlePasarListaButton,
        icon: FaIcon(
          FontAwesomeIcons.check,
          color: Colors.white,
        ),
        label: Text(
          "Pasar lista",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  void handlePasarListaButton(){

  }
}
