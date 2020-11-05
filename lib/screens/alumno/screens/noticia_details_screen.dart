import 'package:control_escolar/const/const.dart';
import 'package:control_escolar/widgets/CustomAppBar.dart';
import 'package:control_escolar/widgets/TitleWidget.dart';
import 'package:flutter/material.dart';

class NoticiaDetailsScreen extends StatefulWidget {
  NoticiaDetailsScreen({Key key}) : super(key: key);

  @override
  _NoticiaDetailsScreenState createState() => _NoticiaDetailsScreenState();
}

class _NoticiaDetailsScreenState extends State<NoticiaDetailsScreen> {
  String noticia =
      """El semáforo epidemiológico por riesgo sanitario y de contagio en México sigue en marcha dentro del territorio mexicana, aunque para la semana del 19 de octubre y hasta el 25 del mismo, no habrá cambios ni avances en él.

De acuerdo con la secretaría de salud, el semáforo seguirá presentando únicamente un estado en color verde: Campeche, por el bajo riesgo de contagio en la demarcación.

Sin embargo, hay 17 estados que se establecieron como color naranja: Auguascalientes, CDMX, Chihuahua, Coahuila, Colima, Durango, en Estado de México, Guerrero, Hidalgo, Jalisco, Nayarit, Nuevo León, Oaxaca, Querétaro, Sinaloa, Yucatán y Zacatecas.

Además, seguirán en el color amarillo los estados de Baja California, Baja California Sur, Chiapas, Guanajuato, Michoacán, Morelos, Puebla, Quintana Roo, San Luis Potosí, Sonora, Tabasco, Tamaulipas, Tlaxcala, así como Veracruz.

El color rojo, que no representa a ninguno de los estados, es el más alto riesgo de contagio, donde únicamente se permiten las actividades económicas esenciales y se llama a quedarse en casa.

Para el color naranja se permiten actividades económicas esenciales, así como empresas no esenciales, aunque éstas último con el 30% de su personal en funcionamiento presencial con estrictas medidas sanitarias.

En el color amarillo, por otra parte, se permiten todas las actividades laborales, siempre y cuando se cuide que las personas en grupos de riesgo, se reestablecen los espacios públicos al aire libre y hay aforo limitado en cerrados.

Por último, en el color verde se permiten todas las actividades, incluidas también las vinculadas con la escuela, las clases presenciales y el ámbito educativo en general a todos los niveles.
  """;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: CustomAppBar(title: "Lunes 14 de Diciembre del 2020", actions: [
        Container(
          padding: EdgeInsets.only(right: 13.0),
          child: IconButton(
            icon: Icon(Icons.close),
            color: Colors.black,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ]),
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 28.0,
          vertical: 24.0,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TitleWidget(
                title: "Titulo de la noticia".toUpperCase(),
                color: kMainColor,
              ),
              SizedBox(height: 20.0),
              _imageContainer(),
              SizedBox(height: 23.0),
              Text(
                noticia,
                style: TextStyle(),
                textAlign: TextAlign.justify,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _imageContainer() {
    return Container(
      height: 217.0,
      child: Image.asset('assets/images/new-1.png'),
    );
  }
}
