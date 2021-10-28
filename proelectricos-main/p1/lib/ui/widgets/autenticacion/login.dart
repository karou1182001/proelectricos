//Aquí se realiza el inicio de sesión
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:p1/ui/widgets/autenticacion/home.dart';
import 'package:p1/ui/widgets/autenticacion/signup.dart';
import 'package:p1/ui/widgets/menu_trabajo/menu_trabajos.dart';

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
        backgroundColor: const Color(0xff264F95),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomePage()));
          },
        ),
      ),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(color: Color(0xff264F95)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // ignore: prefer_const_literals_to_create_immutables
                children: <Widget>[
                  const Text(
                    "Iniciar sesión",
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Bienvenido",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                        topRight: Radius.circular(60))),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(30),
                    child: Column(
                      children: <Widget>[
                        const SizedBox(
                          height: 60,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(
                                    color: Color(0xff264F95),
                                    blurRadius: 20,
                                    offset: Offset(0, 10))
                              ]),
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: const BoxDecoration(
                                    border: Border(
                                        bottom:
                                            BorderSide(color: Colors.grey))),
                                child: TextField(
                                  controller: ccController,
                                  decoration: const InputDecoration(
                                      hintText: "Cédula",
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: InputBorder.none),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: const BoxDecoration(
                                    border: Border(
                                        bottom:
                                            BorderSide(color: Colors.grey))),
                                child: TextField(
                                  controller: passController,
                                  obscureText: true,
                                  decoration: const InputDecoration(
                                      hintText: "Contraseña",
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: InputBorder.none),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const Text("¿No tienes cuenta aún?"),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SignupPage()));
                              },
                              child: const Text(
                                " Regístrate",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        //Botón de INGRESAR
                        MaterialButton(
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
                              var cr = FirebaseFirestore.instance
                                  .collection("usuario");
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
                                                const MenuTrabajos()));
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
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
