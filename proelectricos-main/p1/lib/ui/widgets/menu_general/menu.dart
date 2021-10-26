//Este es el menú general que lleva a todos los formularios
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:p1/ui/widgets/autenticacion/login.dart';
import 'package:p1/ui/widgets/menu_general/account.dart';
import 'opciones_de_menu.dart';


import 'package:p1/ui/pages/formulario_1.dart';


class MenuOptionsScreen extends StatefulWidget {
  const MenuOptionsScreen({Key? key}) : super(key: key);
  @override
  _MenuOptionsScreenState createState() => _MenuOptionsScreenState();
}

class _MenuOptionsScreenState extends State<MenuOptionsScreen> {
  int _selectedOption = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      //BARRA DE NAVEGACIÓN
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 1,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            // Navigator.push(
            //     context, MaterialPageRoute(builder: (context) => LoginPage()));
            Get.back();
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.account_circle,
              color: Colors.black,
            ),
            onPressed: () {
              // Navigator.of(context).push(MaterialPageRoute(
              //     builder: (BuildContext context) => SettingsUI()));
              Get.toNamed("/ProfilePage");
            },
          ),
        ],
      ),
      //CUERPO
      /*Ponemos una lista con todas las opciones de formulario que se pueden 
      escoger. Aquí llama a la clase menú de opciones*/
      body: ListView.builder(
        itemCount: options.length + 2,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return const SizedBox(height: 15.0);
          } else if (index == options.length + 1) {
            return const SizedBox(height: 100.0);
          }
          return Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.all(10.0),
            width: double.infinity,
            height: 80.0,
            decoration: BoxDecoration(
              color: const Color(0xff264F95),
              borderRadius: BorderRadius.circular(40.0),
              border: _selectedOption == index - 1
                  ? Border.all(color: Colors.black26)
                  : null,
            ),
            child: ListTile(
              leading: options[index - 1].icon,
              title: Text(
                options[index - 1].title,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
              subtitle: Text(
                options[index - 1].subtitle,
                style: TextStyle(
                  color:
                      _selectedOption == index - 1 ? Colors.black : Colors.grey,
                ),
              ),
              selected: _selectedOption == index - 1,
              onTap: () {
                setState(() {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder:
                              (context) => //Encargamos al builder que cambie el contexto a la página de menú general
                              FormularioUno()));
                  _selectedOption = index - 1;
                });
              },
            ),
          );
        },
      ),
      //Parte de abajo para enviar todos los formularios juntos
      bottomSheet: Container(
        width: double.infinity,
        height: 80.0,
        color: const Color(0xFFF3F3F3),
        child: Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: const <Widget>[
              Text(
                'Enviar todos',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                ),
              ),
              SizedBox(width: 8.0),
              Icon(
                Icons.arrow_forward_ios,
                color: Colors.black,
                size: 18.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
