import 'package:p1/domain/controller/ControllersForm3/controller_form2.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:p1/domain/controller/ControllersForm3/controller_form5.dart';
import 'package:p1/domain/pdf/pdf_upload.dart';
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

void generateForm5PDF(
    String filename,
    String fecha,
    String placa,
    bool GruaCanasta,
    bool tecnicomecanica,
    bool soat,
    String certificadosPruebas,
    String CertificadoIzajes,
    String kilometraje,
    String horometraje,
    ControllerForm5 cont) async {
  var bytedatas = await rootBundle.load('assets/form5template_fillable.pdf');
  final buffer = bytedatas.buffer;
  final PdfDocument document = PdfDocument(
      inputBytes:
          buffer.asUint8List(bytedatas.offsetInBytes, bytedatas.lengthInBytes));

  document.form.exportEmptyFields = true;
  document.form.setDefaultAppearance(true);

  // Fecha
  modifyTextField(document, 0, fecha);
  // placa
  modifyTextField(document, 1, placa);
  // GruaCanasta
  if(GruaCanasta ){
    modifyBoolField(document, 2, true, removeBorder: true);
    modifyBoolField(document, 3, false, removeBorder: true);
  }else{
    modifyBoolField(document, 3, true, removeBorder: true);
    modifyBoolField(document, 2, false, removeBorder: true);
  }
  

  if(tecnicomecanica){
    modifyBoolField(document, 4, true, removeBorder: true);
    modifyBoolField(document, 5, false, removeBorder: true);
  }else{
    modifyBoolField(document, 5, true, removeBorder: true);
    modifyBoolField(document, 4, false, removeBorder: true);
  }
  if(soat){
    modifyBoolField(document, 6, true, removeBorder: true);
    modifyBoolField(document, 7, false, removeBorder: true);
  }else{
    modifyBoolField(document, 7, true, removeBorder: true);
    modifyBoolField(document, 6, false, removeBorder: true);
  }
  //Certificados dieléctricas
  modifyTextField(document, 8, certificadosPruebas);
  //Certificados izaje
  modifyTextField(document, 9, CertificadoIzajes);
  
  
  int actual = 10;

  for (var element in cont.valorswparte2) {
    modifyBoolField(document, element.value ? actual: actual+1, true);
    modifyBoolField(document, element.value ? actual+1: actual, false);
    actual +=2;
  }

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
  
  for (var element in cont.valorswparte5) {
     modifyBoolField(document, element.value ? actual: actual+1, true);
     modifyBoolField(document, element.value ? actual+1: actual, false);
    actual +=2;
  }

  for (var element in cont.valorswparte6) {
     modifyBoolField(document, element.value ? actual: actual+1, true);
     modifyBoolField(document, element.value ? actual+1: actual, false);
    actual +=2;
  }

  
  
  modifyTextField(document, actual, kilometraje);
  // horometraje
  actual += 1;
  modifyTextField(document, actual, horometraje);

  for (int i = 0; i < document.form.fields.count; i++) {
    document.form.fields[i].readOnly = true;
  }
  String appDocs = await _localPath;
  // print(appDocs + "/" + filename);
  await File(appDocs + "/" + filename).writeAsBytes(document.save());

  document.dispose();
  print("pdf creado");
  
}
 