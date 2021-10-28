import 'package:flutter/material.dart';
import 'package:p1/ui/pages/formulario_2.dart';
import 'package:p1/ui/widgets/menu_general/componentes/boton_widget.dart';
import 'package:p1/ui/widgets/autenticacion/login.dart';
import 'package:p1/ui/pages/formulario_1.dart';

class OpcionesMenu extends StatelessWidget {
  const OpcionesMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 16, top: 0, right: 16),
      child: Column(
        children: [
          //PARTE DE LOS FORMULARIOS
          //Llamamos a la clase BotonWidget
          BotonWidget(
            text: "Autorización de trabajo",
            icon: const Icon(Icons.feed, size: 20.0, color: Color(0xff264F95)),
            press: () => {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => FormularioUno()))
            },
          ),
          BotonWidget(
            text: "Análisis de trabajo seguro",
            icon: const Icon(Icons.lock, size: 20.0, color: Color(0xff264F95)),
            press: () => {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => FormularioUno()))
            },
          ),
          BotonWidget(
            text: "Lista de chequeo para trabajo en alturas",
            icon: const Icon(Icons.escalator,
                size: 20.0, color: Color(0xff264F95)),
            press: () => {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => FormularioUno()))
            },
          ),
          BotonWidget(
            text: "Lista de chequeo para trabajos eléctricos",
            icon: const Icon(Icons.tungsten,
                size: 20.0, color: Color(0xff264F95)),
            press: () => {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => FormularioUno()))
            },
          ),
          BotonWidget(
            text: "Preoperacional del vehículo",
            icon: const Icon(Icons.local_shipping,
                size: 20.0, color: Color(0xff264F95)),
            press: () => {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => FormularioDos()))
            },
          ),
          const SizedBox(
            height: 35,
          ),
          //Parte de abajo que te da la opción de guardar o cancelar
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RaisedButton(
                onPressed: () {},
                color: const Color(0xff264F95),
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                elevation: 2,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                child: const Text(
                  "Enviar",
                  style: TextStyle(fontSize: 14, color: Colors.white),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
