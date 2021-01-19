import 'package:control_escolar/const/const.dart';
import 'package:control_escolar/models/MateriaProfesorModel.dart';
import 'package:control_escolar/screens/profesor/grupos_materia_profesor.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MateriaPreviewProfesor extends StatelessWidget {

  final MateriaProfesorModel materia;

  MateriaPreviewProfesor({@required this.materia});


  @override
  Widget build(BuildContext context) {

    return ListTile(
      onTap: (){
        handleClickMateriaTile(context);
      },
      leading: FaIcon(FontAwesomeIcons.book, color: kMainColor, size: 20.0),
      title: _nombreMateria(materia.nombre),
      trailing: FaIcon(FontAwesomeIcons.chevronRight, size: 15.0),
    );
      
  }

  void handleClickMateriaTile(BuildContext context){
     Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => GruposMateriaProfesorScreen(materia: materia)),
        );
  }

  Widget _nombreMateria(String text) {
    return Container(
      child: Text(
        text,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.w700,
          color: Color(0xFF535353),
        
        ),
      ),
    );
  }


}