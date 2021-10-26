// ignore_for_file: prefer_const_constructors
//El main llama al home donde se puede iniciar sesión o registrarse
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:p1/ui/widgets/autenticacion/home.dart';
import 'package:p1/domain/controller/workpage_controller.dart';
import 'package:p1/ui/pages/work_page.dart';
import 'package:p1/ui/widgets/autenticacion/login.dart';
import 'package:p1/ui/widgets/autenticacion/signup.dart';
import 'package:p1/ui/widgets/menu_general/account.dart';
import 'package:get/get.dart';
import 'package:p1/ui/widgets/menu_general/menu.dart';
import 'package:p1/ui/widgets/menu_general/settings.dart';
import 'package:p1/ui/widgets/menu_general/signature_pad.dart';

void main() async {
  Get.put(WorkPageController());
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) {
    runApp(GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      // home: const HomePage(),
      getPages: [
        GetPage(name: '/', page: () => HomePage()),
        GetPage(name: '/LoginPage', page: () => LoginPage()),
        GetPage(name: '/SignupPage', page: () => SignupPage()),
        GetPage(name: '/WorkHomePage', page: () => WorkHomePage()),
        GetPage(name: '/MenuOptionsPage', page: () => MenuOptionsScreen()),
        GetPage(name: '/ProfilePage', page: () => EditProfilePage()),
        GetPage(name: '/SettingsPage', page: () => SettingsPage()),
        GetPage(name: '/SignaturePad', page: () => SignaturePad())
      ],
    ));
  });
}
