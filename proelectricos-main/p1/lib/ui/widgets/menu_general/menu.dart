//Este es el menú general que lleva a todos los formularios
import 'package:flutter/material.dart';
import 'package:p1/ui/widgets/autenticacion/login.dart';
import 'package:p1/ui/widgets/menu_general/perfilUsuario/account.dart';
import 'package:p1/ui/widgets/menu_general/boton_perfil.dart';
import 'opciones_de_menu.dart';

class MenuOptionsScreen extends StatefulWidget {
  const MenuOptionsScreen({Key? key}) : super(key: key);
  @override
  _MenuOptionsScreenState createState() => _MenuOptionsScreenState();
}

class _MenuOptionsScreenState extends State<MenuOptionsScreen> {
  int _selectedOption = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      //BARRA DE NAVEGACIÓN
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: const Text("Menú general",
            style: TextStyle(fontSize: 14, color: Colors.black)),
        elevation: 1,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
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
              color: Colors.black,
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
      body: Container(
        padding: const EdgeInsets.only(left: 16, top: 25, right: 16),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              const SizedBox(
                height: 50,
              ),
              //PARTE DE LOS FORMULARIOS
              //Llamamos a la clase BotonPerfil
              BotonPerfil(
                text: "Autorización de trabajo",
                //icon: "",
                press: () => {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => LoginPage()))
                },
              ),
              BotonPerfil(
                text: "Análisis de trabajo seguro",
                //icon: "",
                press: () => {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => LoginPage()))
                },
              ),
              BotonPerfil(
                text: "Lista de chequeo para trabajo en alturas",
                //icon: "",
                press: () => {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => LoginPage()))
                },
              ),
              BotonPerfil(
                text: "Lista de chequeño para trabajos eléctricos",
                //icon: "",
                press: () => {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => LoginPage()))
                },
              ),
              BotonPerfil(
                text: "Preoperacional del vehículo",
                //icon: "",
                press: () => {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => LoginPage()))
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 15),
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    child: const Text(
                      "Enviar",
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
