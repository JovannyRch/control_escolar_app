import 'package:control_escolar/const/const.dart';
import 'package:control_escolar/models/AlumnoModel.dart';
import 'package:control_escolar/providers/profesor_provider.dart';
import 'package:control_escolar/widgets/LoaderWidget.dart';
import 'package:control_escolar/widgets/TitleWidget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:loading_button/loading_button.dart';
import 'package:provider/provider.dart';

class AsisTenciasTab extends StatelessWidget {
  ProfesorProvider _provider;
  Size _size;

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;
    _provider = Provider.of<ProfesorProvider>(context);

    if (_provider.isLoadingAlumnos) {
      return LoaderWidget.expanded(_size);
    }

    return Container(
      padding: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _dateLabel(),
          SizedBox(height: 20.0),
          TitleWidget(title: "Alumnos", color: kMainColor),
          SizedBox(height: 10.0),
          _renderAlumnos(),
          _submitDataButton(),
        ],
      ),
    );
  }

  Widget _dateLabel() {
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TitleWidget(title: "19 de Enero del 2021", color: kMainColor),
          SizedBox(height: 5.0),
          Container(
            height: 3.0,
            width: _size.width * 0.3,
            decoration: BoxDecoration(
              color: kSecondaryColor,
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ],
      ),
    );
  }

  Widget _renderAlumnos() {
    final List fixedList =
        Iterable<int>.generate(_provider.alumnos.length).toList();

    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            ...fixedList
                .map((index) => _alumnoTile(_provider.alumnos[index], index))
                .toList()
          ],
        ),
      ),
    );
  }

  Widget _alumnoTile(AlumnoModel alumno, int index) {
    return Container(
      height: 55.0,
      margin: EdgeInsets.only(bottom: 10.0),
      /* decoration: BoxDecoration(
        color: kDisableColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10.0),
      ), */
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _numberIndicator(index + 1),
              SizedBox(width: 5.0),
              Expanded(
                child: Container(
                  height: 45.0,
                  padding: EdgeInsets.only(left: 10.0),
                  decoration: BoxDecoration(
                    color: kDisableColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${alumno.paterno} ${alumno.materno} ${alumno.nombre}",
                        style: TextStyle(
                          color: kMainColor,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              _input(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _numberIndicator(int number) {
    return Container(
      width: 20.0,
      height: 20.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: kSecondaryColor,
      ),
      child: Center(
        child: Text(
          "$number",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 13.0,
          ),
        ),
      ),
    );
  }

  Widget _input() {
    return Container(
      width: 30.0,
      height: 30.0,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.orange,
          boxShadow: [
            BoxShadow(
              offset: Offset(1, 1),
              color: Colors.black.withOpacity(0.3),
            )
          ]),
      margin: EdgeInsets.only(left: 10.0, right: 10.0),
      child: Center(
          child: FaIcon(
        FontAwesomeIcons.clock,
        color: Colors.white,
        size: 15.0,
      )),
    );
  }

  Widget _submitDataButton() {
    return Container(
      margin: EdgeInsets.only(top: 20.0),
      child: Center(
        child: LoadingButton(
          decoration: BoxDecoration(
            color: kSecondaryColor,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Text(
            "Enviar",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
