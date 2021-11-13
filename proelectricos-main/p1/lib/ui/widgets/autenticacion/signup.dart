//En esta el usuario puede registrarse, se está pensando en eliminar dado que
//los usuarios los debería ingresar directamente la empresa, pero por ahora se
//dejará
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:p1/common/constants.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:p1/domain/controller/authentication_controller.dart';
import 'package:p1/ui/widgets/autenticacion/home.dart';
import 'package:p1/ui/widgets/autenticacion/login.dart';
import 'package:encrypt/encrypt.dart' as enc;
import 'package:p1/ui/widgets/menu_general/perfilUsuario/signature_pad.dart';
import 'package:shared_preferences/shared_preferences.dart';

final llave = enc.Key.fromLength(32);
final encrypter = enc.Encrypter(enc.AES(llave));
final iv = enc.IV.fromLength(16);

class SignupPage extends StatelessWidget {
  AuthenticationController controller = Get.find<AuthenticationController>();

  SignupPage({Key? key}) : super(key: key);
  final ccController = TextEditingController();
  final nombreController = TextEditingController();
  final emailController = TextEditingController();
  final arlController = TextEditingController();
  final telefonoController = TextEditingController();
  final epsController = TextEditingController();
  final passController = TextEditingController();
  final confirmpassController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const HomePage()));
          },
        ),
      ),
      //Aquí le cambiamos el orden para que no resulte en un problema de RenderFlex (al SingleChildScrollView)
      body: SizedBox(
        height: MediaQuery.of(context).size.height - 50,
        width: double.infinity,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  const Text(
                    "Registro de Cuenta",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "¡Crea tu cuenta!",
                    style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                  )
                ],
              ),
              Column(
                children: <Widget>[
                  inputFile(label: "CC:", controller: ccController),
                  inputFile(label: "Nombre:", controller: nombreController),
                  inputFile(label: "Email:", controller: emailController),
                  inputFile(label: "Telefono:", controller: telefonoController),
                  inputFile(label: "arl:", controller: arlController),
                  inputFile(label: "eps:", controller: epsController),
                  inputFile(
                      label: "Contraseña:",
                      obscureText: true,
                      controller: passController),
                  inputFile(
                      label: "Confirmar contraseña:",
                      obscureText: true,
                      controller: confirmpassController),
                  sigButton(),
                ],
              ),
              Container(
                padding: const EdgeInsets.only(top: 3, left: 3),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: const Border(
                      bottom: BorderSide(color: Colors.black),
                      top: BorderSide(color: Colors.black),
                      left: BorderSide(color: Colors.black),
                      right: BorderSide(color: Colors.black),
                    )),
                child: MaterialButton(
                  minWidth: double.infinity,
                  height: 60,
                  onPressed: () async {
                    //Extraemos la firma del sharedPreferences
                    final prefs = await SharedPreferences.getInstance();
                    final sig = prefs.getString('tech_signature');

                    //Extraemos la información de los textboxes
                    String cc = ccController.text.trim();
                    String nombre = nombreController.text.trim();
                    String email = emailController.text.trim();
                    String password = passController.text.trim();
                    String cPassword = confirmpassController.text.trim();
                    String firma = sig!;
                    //Validamos que cada campo esté llenado
                    if (cc.isEmpty) {
                      debugPrint("Ingrese una cédula, por favor");
                    } else if (nombre.isEmpty) {
                      debugPrint("Ingrese un nombre, por favor");
                    } else if (email.isEmpty) {
                      debugPrint("Ingrese un e-mail, por favor");
                    } else if (password.isEmpty) {
                      debugPrint("Recuerde ingresar una contraseña, por favor");
                    } else if (cPassword.isEmpty) {
                      debugPrint("Confirme su contraseña, por favor");
                    }
                    //Validamos que las contraseñas sean iguales
                    if (password != cPassword) {
                      debugPrint("Las contraseñas no son iguales");
                    }
                    //Obtenemos la referencia a la collection "usuario"

                    controller.register(cc, email, nombre, password, cPassword,
                        firma, llave, encrypter, iv, context);
                  },
                  color: proElectricosBlue,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: const Text(
                    "Registrarse",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text("¿Ya tiene una cuenta?"),
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LoginPage()));
                    },
                    child: const Text(
                      " Inicie sesión",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

// we will be creating a widget for text field
Widget inputFile({label, obscureText = false, controller}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        label,
        style: const TextStyle(
            fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black87),
      ),
      const SizedBox(
        height: 5,
      ),
      TextField(
        obscureText: obscureText,
        controller: controller,
        decoration: const InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
            border:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.grey))),
      ),
      const SizedBox(
        height: 10,
      )
    ],
  );
}

Widget sigButton() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: const <Widget>[
      Text(
        'Firma:',
        style: TextStyle(
            fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black87),
      ),
      SizedBox(
        height: 5,
      ),
      MyButton("Añadir Firma", "tech_signature",
          Icon(Icons.feed, size: 0, color: Colors.black)),
      SizedBox(
        height: 10,
      )
    ],
  );
}
