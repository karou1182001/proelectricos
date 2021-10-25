import 'package:get/get.dart';
import 'package:p1/data/local_preferences.dart';

class AuthenticationController extends GetxController {
  LocalPreferences lp = LocalPreferences();

  var _logged = false.obs;

  bool get logged => _logged.value;

  void setLogged(bool l) {
    _logged.value = l;
    update();
  }

  AuthenticationController() {
    init();
  }

  void init() async {
    _logged.value = await lp.retrieveData<bool>("logged") ?? false;
    //_logged.value = false;
    setLogged(false);
  }


  Future<bool> login(user, password) async {
    //String userT = await lp.retrieveData<String>("email") ?? "";
    //String passwordT = await lp.retrieveData<String>("password") ?? "";
    String userT = "proelectricos@hotmail.com";
    String passwordT = "123456789";
    //print("$userT $passwordT $user $password");
    if (userT == user && passwordT == password) {
      await lp.storeData<bool>("logged", true);
      print("Guardado con exito");
      //_logged.value = true;
      setLogged(true);
    } else {
      print("Guardado sin exito");
      await lp.storeData<bool>("logged", false);
      //_logged.value = false;
      setLogged(false);
    }
    return Future.value(_logged.value);
  }

  Future<bool> logout() async {
    await lp.storeData<bool>("logged", false);
    //_logged.value = false;
    setLogged(false);
    return Future.value(true);
  }
}
