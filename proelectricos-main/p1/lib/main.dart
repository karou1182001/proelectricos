// ignore_for_file: prefer_const_constructors
//El main llama al home donde se puede iniciar sesión o registrarse
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:p1/ui/widgets/autenticacion/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) {
    runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    ));
  });
}
