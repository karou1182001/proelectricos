import 'package:cloud_firestore/cloud_firestore.dart';
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
      //setLogged(false);
  }


  Future<bool> login(cc, password) async {
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
      await lp.storeData<bool>("logged", true);
      //_logged.value = true;
      setLogged(true);
    }
    else{
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
