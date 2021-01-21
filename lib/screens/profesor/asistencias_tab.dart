import 'package:control_escolar/const/const.dart';
import 'package:control_escolar/helpers/messages.dart';
import 'package:control_escolar/models/AsistenciaModel.dart';
import 'package:control_escolar/providers/profesor_provider.dart';
import 'package:control_escolar/widgets/AsistenciaStateButton.dart';
import 'package:control_escolar/widgets/LoaderWidget.dart';
import 'package:control_escolar/widgets/TitleWidget.dart';
import 'package:flutter/material.dart';
import 'package:loading_button/loading_button.dart';
import 'package:provider/provider.dart';

class AsisTenciasTab extends StatelessWidget {
  ProfesorProvider _provider;
  Size _size;
  final GlobalKey scaffoldKey;
  AsisTenciasTab({@required this.scaffoldKey});

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
        Iterable<int>.generate(_provider.asistencias.length).toList();

    return Expanded(
        child: Container(
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            ...fixedList
                .map((index) =>
                    _asistenciaTile(_provider.asistencias[index], index))
                .toList(),
            _submitDataButton(),
          ],
        ),
      ),
    ));
  }

  Widget _asistenciaTile(AsistenciaModel asistencia, int index) {
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
                        "${asistencia.alumno.paterno} ${asistencia.alumno.materno} ${asistencia.alumno.nombre}",
                        style: TextStyle(
                          color: kMainColor,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              AsistenciaStateButton(
                valorAsistencia: asistencia.asistencia,
                onTap: () {
                  handleOnTapAsistenciaState(asistencia);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  void handleOnTapAsistenciaState(AsistenciaModel asistencia) {
    _provider.updateAlumnoAsistenciaState(asistencia.alumno.id);
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

  Widget _submitDataButton() {
    return Container(
      margin: EdgeInsets.only(top: 15.0, bottom: 50.0),
      child: Center(
        child: LoadingButton(
          onPressed: handleSubmit,
          decoration: BoxDecoration(
            color: kSecondaryColor,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Text(
            "Finalizar pase de lista",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }

  void handleSubmit() {
    if (!isDataCompleted()) {
      showNotCompletedData();
    } else {}
  }

  void showNotCompletedData() {
    Message.showSnackBarMessage(scaffoldKey, "Hay alumnos sin valor de asistencia");
  }

  bool isDataCompleted() {
    for (AsistenciaModel asitencia in _provider.asistencias) {
      if (asitencia.asistencia == AsistenciaModel.SIN_ASIGNAR) {
        return false;
      }
    }
    return true;
  }
}
