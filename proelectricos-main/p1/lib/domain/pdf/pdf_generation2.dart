import 'package:p1/domain/controller/ControllersForm3/controller_form2.dart';
import 'package:flutter/services.dart' show rootBundle;
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

void generateForm2PDF(
    String filename,
    String fecha,
    String nombre,
    String trabajorealizado,
    bool rutinario,
    bool noRutinario,
    bool tAltura,
    bool tElectrico,
    String nombreapellidos,
    String cedula,
    String arl,
    String eps,
    String cargo,
    ControllerForm2 cont) async {
  var bytedatas = await rootBundle.load('assets/form2template_fillable.pdf');
  final buffer = bytedatas.buffer;
  final PdfDocument document = PdfDocument(
      inputBytes:
          buffer.asUint8List(bytedatas.offsetInBytes, bytedatas.lengthInBytes));

  document.form.exportEmptyFields = true;
  document.form.setDefaultAppearance(true);

  // for (int i = 0; i < document.form.fields.count; i++) {
  //   print(i);
  //   print(document.form.fields[i]);
  //   print("--------------");
  // }
  // Nombre
  modifyTextField(document, 0, fecha);

  modifyTextField(document, 1, nombre);

  modifyTextField(document, 2, trabajorealizado);
  // Rutinario
  modifyBoolField(document, 3, rutinario, removeBorder: false);
  // No Rutinario
  modifyBoolField(document, 4, noRutinario, removeBorder: false);
  // tAltura
  modifyBoolField(document, 5, tAltura, removeBorder: false);
  // Eléctrico
  modifyBoolField(document, 6, tElectrico, removeBorder: false);

  modifyTextField(document, 7, nombreapellidos);

  modifyTextField(document, 8, cedula);

  modifyTextField(document, 9, arl);

  modifyTextField(document, 10, eps);

  modifyTextField(document, 11, cargo);

  int actual = 12;

  for (var element in cont.valorswparte3) {
    modifyBoolField(document, element.value ? actual : actual + 1, true);
    modifyBoolField(document, element.value ? actual + 1 : actual, false);
    actual += 2;
  }

  for (var element in cont.valorswparte4) {
    modifyBoolField(document, element.value ? actual : actual + 1, true);
    modifyBoolField(document, element.value ? actual + 1 : actual, false);
    actual += 2;
  }

  for (var element in cont.valorswparte5) {
    modifyBoolField(document, element.value ? actual : actual + 1, true);
    modifyBoolField(document, element.value ? actual + 1 : actual, false);
    actual += 2;
  }

  for (var element in cont.valorswparte6) {
    modifyBoolField(document, element.value ? actual : actual + 1, true);
    modifyBoolField(document, element.value ? actual + 1 : actual, false);
    actual += 2;
  }

  for (var element in cont.valorswparte7) {
    modifyBoolField(document, element.value ? actual : actual + 1, true);
    modifyBoolField(document, element.value ? actual + 1 : actual, false);
    actual += 2;
  }

  for (var element in cont.valorswparte8) {
    modifyBoolField(document, element.value ? actual : actual + 1, true);
    modifyBoolField(document, element.value ? actual + 1 : actual, false);
    actual += 2;
  }

  for (var element in cont.valorswparte9) {
    modifyBoolField(document, element.value ? actual : actual + 1, true);
    modifyBoolField(document, element.value ? actual + 1 : actual, false);
    actual += 2;
  }

  for (var element in cont.valorswparte10) {
    modifyBoolField(document, element.value ? actual : actual + 1, true);
    modifyBoolField(document, element.value ? actual + 1 : actual, false);
    actual += 2;
  }

  for (var element in cont.valorswparte11) {
    modifyBoolField(document, element.value ? actual : actual + 1, true);
    modifyBoolField(document, element.value ? actual + 1 : actual, false);
    actual += 2;
  }

  for (var element in cont.valorswparte12) {
    modifyBoolField(document, element.value ? actual : actual + 1, true);
    modifyBoolField(document, element.value ? actual + 1 : actual, false);
    actual += 2;
  }

  for (var element in cont.valorswparte13) {
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
}
