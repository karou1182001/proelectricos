import 'package:flutter/material.dart';
import 'package:flutter_application_1/NewTable.dart';
import 'package:flutter_application_1/controllerTabla.dart';
import 'package:get/get.dart';
import 'Formulario1.dart';

void main() {
  Get.put(controllerTabla());
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:FormularioUno(),
      theme: ThemeData(
        accentColor: Colors.blueGrey,
        primaryColor: Colors.blue,
      ),
    );
  }
}