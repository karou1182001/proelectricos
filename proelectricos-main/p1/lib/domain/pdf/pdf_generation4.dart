import 'package:flutter/services.dart' show rootBundle;
import 'package:p1/domain/controller/ControllersForm3/controller_form4.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

Future<String> get _localPath async {
  final directory = await getApplicationDocumentsDirectory();

  return directory.path;
}

void modifyTextField(PdfDocument document, int index, String val) {
  (document.form.fields[index] as PdfTextBoxField).text = val;
  // (document.form.fields[index] as PdfTextBoxField).readOnly = true;
  (document.form.fields[index] as PdfTextBoxField).borderColor = PdfColor.empty;
}

void modifyBoolField(PdfDocument document, int index, bool val,
    {bool removeBorder = true}) {
  (document.form.fields[index] as PdfCheckBoxField).isChecked = val;
  // (document.form.fields[index] as PdfCheckBoxField).readOnly = true;
  if (removeBorder) {
    (document.form.fields[index] as PdfCheckBoxField).borderColor =
        PdfColor.empty;
  }
}

void generateForm4PDF(
    String filename,
    String fecha,
    String Lider,
    String LugarUbicacion,
    String contratista,
    String nombresApellidos,
    String cedula,
    String arl,
    String eps,
    String cargo,
    String tipoTrabajo,
    bool trabajoDesenergizado,
    bool trabajoEnergizado,
    ControllerForm4 cont) async {
  var bytedatas = await rootBundle.load('assets/form4template_fillable.pdf');
  final buffer = bytedatas.buffer;
  final PdfDocument document = PdfDocument(
      inputBytes:
          buffer.asUint8List(bytedatas.offsetInBytes, bytedatas.lengthInBytes));

  document.form.exportEmptyFields = true;
  document.form.setDefaultAppearance(true);
   for (int i = 0; i < document.form.fields.count; i++) {
    print(document.form.fields[i]);
    print(i);
  }
  // Fecha
  modifyTextField(document, 0, fecha);
  // placa
  modifyTextField(document, 1, Lider);

  modifyTextField(document, 2, LugarUbicacion);

  modifyTextField(document, 3, contratista);

  modifyTextField(document, 4, nombresApellidos);

  modifyTextField(document, 5, cedula);

  modifyTextField(document, 6, arl);

  modifyTextField(document, 7, eps);

  modifyTextField(document, 8, cargo);

  modifyTextField(document, 9, tipoTrabajo);

  modifyBoolField(document, 10, trabajoDesenergizado, removeBorder: true);
  modifyBoolField(document, 11, trabajoEnergizado, removeBorder: true);

  int actual = 12;

  for (var element in cont.valorswparte4) {
    modifyBoolField(document, element.value ? actual : actual + 1, true);
    modifyBoolField(document, element.value ? actual + 1 : actual, false);
    actual += 2;
  }

  for (int i = 0; i < document.form.fields.count; i++) {
    document.form.fields[i].readOnly = true;
  }
  
  String appDocs = await _localPath;
  // print(appDocs + "/" + filename);
  await File(appDocs + "/" + filename).writeAsBytes(document.save());

  document.dispose();
  print("pdf creado");
  
}
