import 'package:path/path.dart';
import 'dart:io';
import 'package:firebase_core/firebase_core.dart' as firebase_core;
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

Future<void> uploadFile(String filePath) async {
  File file = File(filePath);

  try {
    await firebase_storage.FirebaseStorage.instance
        .ref('uploads/file-to-upload.png')
        .putFile(file);
  } on firebase_core.FirebaseException catch (e) {
    // e.g, e.code == 'canceled'
    print("Failed to upload file!");
  }
}
