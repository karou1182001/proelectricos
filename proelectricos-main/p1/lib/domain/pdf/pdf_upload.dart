import 'package:path/path.dart';
import 'dart:io';
import 'package:firebase_core/firebase_core.dart' as firebase_core;
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:path_provider/path_provider.dart';

Future<String> get jobPath async {
  final directory = await getApplicationDocumentsDirectory();

  return directory.path + '/jobs/';
}

Future<void> uploadFile(String filePath, String uploadPath) async {
  File file = File(filePath);

  try {
    await firebase_storage.FirebaseStorage.instance
        .ref(uploadPath)
        .putFile(file);
  } on firebase_core.FirebaseException catch (e) {
    // e.g, e.code == 'canceled'
    print("Failed to upload file!");
  }
}

void uploadStoredJobPDFS(int jobNumber) async {
  // Check that all 5 pdf's exists.
  String jobpath = await jobPath;
  String pdf1path = jobpath + "job$jobNumber/formulario1.pdf";
  String pdf2path = jobpath + "job$jobNumber/formulario2.pdf";
  String pdf3path = jobpath + "job$jobNumber/formulario3.pdf";
  String pdf4path = jobpath + "job$jobNumber/formulario4.pdf";
  String pdf5path = jobpath + "job$jobNumber/formulario5.pdf";
  if (await File(pdf1path).exists() &&
      await File(pdf2path).exists() &&
      await File(pdf3path).exists() &&
      await File(pdf4path).exists() &&
      await File(pdf5path).exists()) {
    await uploadFile(pdf1path, "formularios/formulario1.pdf");
    await uploadFile(pdf2path, "formularios/formulario2.pdf");
    await uploadFile(pdf3path, "formularios/formulario3.pdf");
    await uploadFile(pdf4path, "formularios/formulario4.pdf");
    await uploadFile(pdf5path, "formularios/formulario5.pdf");
    print("Successfully uploaded all PDFS!");
    // Delete all files once uploaded.
    await File(pdf1path).delete();
    await File(pdf2path).delete();
    await File(pdf3path).delete();
    await File(pdf4path).delete();
    await File(pdf5path).delete();
    print("Successfully cleaned all uploaded PDFS!");
  } else {
    print("Generate all PDFS first!");
  }
}
