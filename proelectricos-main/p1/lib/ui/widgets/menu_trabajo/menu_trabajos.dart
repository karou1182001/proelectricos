//Este es el menú general que lleva a todos los formularios
import 'package:flutter/material.dart';
import 'package:p1/ui/widgets/autenticacion/login.dart';
import 'package:p1/ui/widgets/menu_general/perfilUsuario/account.dart';
import 'package:p1/ui/widgets/componentes/encabezado.dart';
import 'package:p1/domain/controller/workpage_controller.dart';
import 'package:get/get.dart';

class MenuTrabajos extends StatefulWidget {
  const MenuTrabajos({Key? key}) : super(key: key);
  @override
  _MenuTrabajosState createState() => _MenuTrabajosState();
}

class _MenuTrabajosState extends State<MenuTrabajos> {
  //Revisar esto
  final WorkPageController controller = Get.find<WorkPageController>();

  @override
  Widget build(BuildContext context) {
    controller.addAddJobButton();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      //BARRA DE NAVEGACIÓN
      appBar: AppBar(
        backgroundColor: const Color(0xff264F95),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => LoginPage()));
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.account_circle,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => EditProfilePage()));
            },
          ),
        ],
      ),
      //CUERPO
      //Esto es lo que va en el cuerpo de esta interfaz
      body: Column(
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Encabezado(size: size, text: "Hola, Sandra \n\n Progreso diario"),
          Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.only(bottom: 8, left: 16),
            child: const Text("Área de trabajo",
                style: TextStyle(
                  color: Color(0xff264F95),
                  fontSize: 17,
                )),
          ),
          //En esta parte es donde va a estar el menú donde podemos agregar
          //nuevos trabajos
          //fit: FlexFit.tight,
          Flexible(
            flex: 6,
            fit: FlexFit.tight,
            child: Container(
                alignment: Alignment.centerLeft,
                child: Obx(() => ListView(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    // crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: controller.joblist))),
          )
        ],
      ),
    );
  }
}
