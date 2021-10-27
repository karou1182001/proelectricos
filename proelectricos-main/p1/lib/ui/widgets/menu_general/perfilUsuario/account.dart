//Aquí puedes acceder a tu cuenta y ver las cosas predeterminadas
import 'package:flutter/material.dart';
import 'package:p1/ui/widgets/menu_general/menu/menu.dart';
import 'package:p1/ui/widgets/menu_general/perfilUsuario/signature_pad.dart';
import 'package:p1/ui/widgets/menu_general/perfilUsuario/imagen_perfil.dart';
import 'package:p1/ui/widgets/menu_general/componentes/boton_widget.dart';
import "package:p1/ui/widgets/autenticacion/login.dart";

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Aquí va todo lo que va en la barra superior
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: const Text("Editar perfil",
            style: TextStyle(fontSize: 14, color: Colors.black)),
        elevation: 1,
        //Botón back que va a la pantalla anterior
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const MenuOptionsScreen()));
          },
        ),
      ),
      //Termina todo lo que va en la barra superior

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
                height: 15,
              ),
              //IMAGEN DE LA PARTE SUPERIOR
              //LLamamos a la clase que contiene este código
              const ImagenPerfil(),
              //Colocamos los campos que van abajo
              const SizedBox(
                height: 35,
              ),

              buildTextField("Nombre completo", "Dor Alex", false),
              buildTextField("CC", "100299827", false),
              buildTextField("Contraseña", "********", true),
              //PARTE DE LA FIRMA
              //Llamamos a la clase BotonWidget
              BotonWidget(
                text: "Cambiar firma",
                icon: const Icon(Icons.feed, size: 0, color: Colors.black),
                press: () => {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => SignaturePad()))
                },
              ),
              BotonWidget(
                text: "Cerrar sesión",
                icon: const Icon(Icons.feed, size: 0, color: Colors.black),
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
                  OutlineButton(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    onPressed: () {},
                    child: const Text("Cancelar",
                        style: TextStyle(fontSize: 14, color: Colors.black)),
                  ),
                  RaisedButton(
                    onPressed: () {},
                    color: const Color(0xff264F95),
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: const Text(
                      "Guardar",
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

  //Widget para el textfield
  Widget buildTextField(
      String labelText, String placeholder, bool isPasswordTextField) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: TextField(
        obscureText: isPasswordTextField ? showPassword : false,
        decoration: InputDecoration(
            suffixIcon: isPasswordTextField
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        showPassword = !showPassword;
                      });
                    },
                    icon: const Icon(
                      Icons.remove_red_eye,
                      color: Colors.grey,
                    ),
                  )
                : null,
            contentPadding: const EdgeInsets.only(bottom: 3),
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeholder,
            hintStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            )),
      ),
    );
  }
}