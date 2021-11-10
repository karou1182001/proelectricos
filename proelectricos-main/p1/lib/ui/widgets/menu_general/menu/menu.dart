//Este es el menú general que lleva a todos los formularios
import 'package:flutter/material.dart';
import 'package:p1/ui/pages/formulario_3/components/widgetsReutilizables/app_bar.dart';
import 'package:p1/ui/widgets/componentes/encabezado.dart';
import 'package:p1/ui/widgets/menu_general/menu/opciones_menu.dart';

class MenuOptionsScreen extends StatefulWidget {
  const MenuOptionsScreen({Key? key}) : super(key: key);
  @override
  _MenuOptionsScreenState createState() => _MenuOptionsScreenState();
}

class _MenuOptionsScreenState extends State<MenuOptionsScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      //BARRA DE NAVEGACIÓN
      appBar: const AppBarWidget(
        text: 'Lista de chequeo para trabajo en alturas',
        backgroundColor: Color(0xff264F95),
        height: 60,
      ),
      //CUERPO
      //Esto es lo que va en el cuerpo de esta interfaz
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Encabezado(
                size: size, text: "Hola, Sandra \n\n ¡Llena tus formularios!"),
            const OpcionesMenu(),
          ],
        ),
      ),
    );
  }
}
