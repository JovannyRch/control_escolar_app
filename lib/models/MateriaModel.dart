class MateriaCalificacionModel {
  String nombre;
  double calificacion;

  MateriaCalificacionModel({this.nombre, this.calificacion});
}

class MateriaModel {
  String nombre;
  String nombreProfesor;
  bool status;

  MateriaModel({this.nombre, this.nombreProfesor, this.status});
}
