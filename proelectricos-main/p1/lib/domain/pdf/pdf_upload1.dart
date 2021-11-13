import 'package:path/path.dart';
import 'dart:io';
import 'package:firebase_core/firebase_core.dart' as firebase_core;
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:path_provider/path_provider.dart';

Future<void> uploadFile1(String filePath) async {
  File file = File(filePath);

  try {
    await firebase_storage.FirebaseStorage.instance
        .ref('formularios/Formulario1.pdf')
        .putFile(file);
  } on firebase_core.FirebaseException catch (e) {
    // e.g, e.code == 'canceled'
    print("Failed to upload file!");
  }
}

Future<String> get _localPath async {
  final directory = await getApplicationDocumentsDirectory();

  return directory.path;
}

void uploadPdf1() async {
  // Check that PDF1 exists.
  String appDocs = await _localPath;
  String form0path = appDocs + "/Formulario1.pdf";
  if (await File(form0path).exists()) {
    // upload pdf
    await uploadFile1(form0path);
    // delete pdf
    await File(form0path).delete();
  } else {
    print("Generate PDF0 first!");
  }
}
