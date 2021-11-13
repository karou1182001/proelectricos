import 'package:flutter/services.dart' show rootBundle;
import 'package:p1/domain/controller/ControllersForm3/controller_tablaparte3_form3.dart';
import 'package:p1/domain/pdf/pdf_upload3.dart';
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

void generateForm3PDF(
    String filename,
    String fecha,
    String HoraInicio,
    String HoraFinal,
    String Lugar,
    String ubicacion,
    String alturaaprox,
    String tipoTrabajo,
    String nombresApellidos,
    String cedula,
    String arl,
    String eps,
    String cargo,
    ControllerTablasForm3 cont) async {
  var bytedatas = await rootBundle.load('assets/form3Rtemplate_fillable.pdf');
  final buffer = bytedatas.buffer;
  final PdfDocument document = PdfDocument(
      inputBytes:
          buffer.asUint8List(bytedatas.offsetInBytes, bytedatas.lengthInBytes));

  document.form.exportEmptyFields = true;
  document.form.setDefaultAppearance(true);

  // Fecha
  modifyTextField(document, 0, fecha);
  // placa
  modifyTextField(document, 1, HoraInicio);
  // GruaCanasta
  modifyTextField(document, 2, HoraFinal);

  modifyTextField(document, 3, Lugar);

  modifyTextField(document, 4, ubicacion);

  modifyTextField(document, 5, alturaaprox);

  modifyTextField(document, 6, tipoTrabajo);

  modifyTextField(document, 7, nombresApellidos);

  modifyTextField(document, 8, cedula);

  modifyTextField(document, 9, arl);

  modifyTextField(document, 10, eps);

  modifyTextField(document, 11, cargo);

  int actual = 12;

  for (var element in cont.valorswparte3) {
    modifyBoolField(document, element.value ? actual: actual+1, true);
    modifyBoolField(document, element.value ? actual+1: actual, false);
    actual +=2;
  }

  for (var element in cont.valorswparte4) {
    modifyBoolField(document, element.value ? actual: actual+1, true);
    modifyBoolField(document, element.value ? actual+1: actual, false);
    actual +=2;
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
 