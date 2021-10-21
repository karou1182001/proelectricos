// ignore_for_file: prefer_const_constructors
//El main llama al home donde se puede iniciar sesión o registrarse
import 'package:flutter/material.dart';
import 'package:p1/ui/widgets/autenticacion/home.dart';
import 'package:p1/ui/widgets/menu_general/menu.dart';
import 'package:p1/domain/controller/authentication_controller.dart';
import 'package:get/get.dart';

//void main() async {

//  WidgetsFlutterBinding.ensureInitialized();
 // runApp(MaterialApp(
  //  debugShowCheckedModeBanner: false,
   //home:  Obx(() => controller.logged ? MenuOptionsScreen() : HomePage()));
 // ));
//}
void main() async{
  Get.put(AuthenticationController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AuthenticationController controller = Get.find<AuthenticationController>();
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Authentication Flow',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        //El sistema debe elegir entre estas dos páginas, si el estado del usuario es logged in
    home:  Obx(() => controller.logged ? MenuOptionsScreen() : HomePage()));
  }
}

