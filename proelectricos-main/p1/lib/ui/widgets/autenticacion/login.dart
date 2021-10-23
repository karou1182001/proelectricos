//Aquí se realiza el inicio de sesión
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:p1/ui/widgets/autenticacion/home.dart';
import 'package:p1/ui/widgets/menu_general/menu.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final ccController = TextEditingController();
  final passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomePage()));
          },
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    const Text(
                      "Iniciar Sesión",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Ingresa a tu cuenta",
                      style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: TextFormField(
                      controller: ccController,
                      decoration: const InputDecoration(hintText: "CC")),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: TextFormField(
                      controller: passController,
                      obscureText: true,
                      decoration:
                          const InputDecoration(hintText: "Contraseña")),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Container(
                    padding: const EdgeInsets.only(top: 3, left: 3),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: const Border(
                          bottom: BorderSide(color: Colors.black),
                          top: BorderSide(color: Colors.black),
                          left: BorderSide(color: Colors.black),
                          right: BorderSide(color: Colors.black),
                        )),
                    //Botón de INGRESAR
                    child: MaterialButton(
                      minWidth: double.infinity,
                      height: 60,
                      //Función onPressed encargada de ejecutar acciones al presionar el botón
                      onPressed: () async {
                        //Extraemos los datos de los textField
                        String cc = ccController.text.trim();
                        String password = passController.text.trim();
                        debugPrint(cc);
                        debugPrint(password);
                        if (cc.isEmpty || password.isEmpty) {
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    title: const Text("Error"),
                                    content: const Text(
                                        "Por favor llene todos los campos"),
                                    actions: <Widget>[
                                      TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: const Text("OK"))
                                    ],
                                  ));
                        } else {
                          //Collection Reference para acceder a la colección "usuarios" de nuestra base de datos
                          var cr =
                              FirebaseFirestore.instance.collection("usuario");
                          //Realizamos la consulta sobre la colección
                          var query = cr
                              .where("cc", isEqualTo: int.parse(cc))
                              .where("password", isEqualTo: password);
                          //Extraemos los datos de el query en cuestión
                          QuerySnapshot users = await query.get();
                          //Revisamos que exista algún usuario que cumpla con las condiciones
                          if (users.docs.isNotEmpty) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder:
                                        (context) => //Encargamos al builder que cambie el contexto a la página de menú general
                                            const MenuOptionsScreen()));
                          } else {
                            showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                      title: const Text("Error"),
                                      content: const Text(
                                          "La cédula o la contraseña ingresadas no son correctas"),
                                      actions: <Widget>[
                                        TextButton(
                                            child: const Text("Ok"),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            })
                                      ],
                                    ));
                          }
                        }
                      },
                      color: const Color(0xff264F95),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: const Text(
                        "Ingresar",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    Text("¿No tienes cuenta aún?"),
                    Text(
                      " Regístrate.",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    )
                  ],
                ),
                Container(
                  padding: const EdgeInsets.only(top: 100),
                  height: MediaQuery.of(context).size.height / 5,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/background2.png"),
                        fit: BoxFit.fitHeight),
                  ),
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}

// InputFile para textfield (no lo usamos)
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
