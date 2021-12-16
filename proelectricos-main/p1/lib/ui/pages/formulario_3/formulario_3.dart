import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:p1/common/constants.dart';
import 'package:p1/domain/controller/ControllersForm3/controller_tablaparte3_form3.dart';
import 'package:p1/domain/pdf/pdf_generation3.dart';
import 'package:p1/ui/widgetReutilizables/app_bar.dart';
import 'package:p1/ui/pages/sheets/form_3_sheet.dart';
import 'package:p1/ui/pages/sheets/sheet%20connection/sheets_connection_3.dart';
import 'package:p1/ui/pages/formulario_3/components/partes/parte1_form3.dart';
import 'package:p1/ui/widgetReutilizables/tablas_form.dart';

import 'package:p1/ui/widgetReutilizables/Campos/campos_formularios.dart';
import 'package:p1/ui/widgets/menu_general/perfilUsuario/signature_pad.dart';

import 'components/partes/parte4_form3.dart';

class FormularioTres extends StatefulWidget {
  final int jobNumber; // Representa a que trabajo pertenece este formulario.
  const FormularioTres({Key? key, required this.jobNumber}) : super(key: key);
  @override
  _FormularioTresPage createState() => _FormularioTresPage();
}

class _FormularioTresPage extends State<FormularioTres> {
  int currentStep = 0;
  final _formKey = GlobalKey<FormState>();
  //Parte1 form3
  DateTime pickedDate = DateTime.now();
  final TextEditingController horaInicio = TextEditingController();
  final TextEditingController horaFin = TextEditingController();
  final TextEditingController lugarTrabajo = TextEditingController();
  final TextEditingController ubicacion = TextEditingController();
  final TextEditingController altura = TextEditingController();
  final TextEditingController tipoTrabajoAltura = TextEditingController();
  //Las segundas variables son los vectores de los sw
  //Vectores para booleanos
  //Llamar al controlador
  //ControllerTablasForm3 C = Get.find<ControllerTablasForm3>();
  //Son los vectores de booleanos para las tablas
  //C.valorswparte3 tiene valores de la tabla 3
  //C.valorswparte4
  //Parte 4 form 4
  final TextEditingController nombreapellidos = TextEditingController();
  final TextEditingController cedula = TextEditingController();
  final TextEditingController arl = TextEditingController();
  final TextEditingController eps = TextEditingController();
  final TextEditingController cargo = TextEditingController();

  @override
  void initState() {
    Get.put(ControllerTablasForm3());
    pickedDate = DateTime.now();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ControllerTablasForm3 C = Get.find<ControllerTablasForm3>();
    return Scaffold(
      backgroundColor: Colors.white,
      //BARRA DE NAVEGACIÓN
      appBar: const AppBarWidget(
        text: 'Lista de chequeo para trabajo en alturas',
        backgroundColor: proElectricosBlue,
        height: 60,
      ),
      //CUERPO
      //Esto es lo que va en el cuerpo de esta interfaz
      body: Form(
        key: _formKey,
        child: Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(primary: proElectricosBlue),
          ),
          child: Stepper(
            type: StepperType.vertical,
            //getSteps() contiene la interfaz como tal
            steps: getSteps(C),
            //Lo que sigue aquí abajo son los métodos del getsteps
            //Variable que guarda el estado actual
            currentStep: currentStep,
            //Si oprimimos continue se aumenta en 1 el estado actual
            onStepContinue: () async {
              final isLastStep = currentStep == getSteps(C).length - 1;
              if (!isLastStep) {
                //Y hace las cosas del form
                // Validate returns true if the form is valid, or false otherwise.
                //if (_formKey.currentState!.validate()) {
                // If the form is valid, display a snackbar. In the real world,
                // you'd often call a server or save the information in a database.
                setState(() => currentStep += 1);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Prosiga')),
                );
                //}

              } else {
                if (_formKey.currentState!.validate()) {
                  print("Completed");
                  //AQUÍ ES DONDE DEBEMOS PONER QUÉ PASA CUANDO TERMINA EL FORMULARIO
                  generateForm3PDF(
                      "jobs/job${widget.jobNumber}/formulario3.pdf",
                      "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}",
                      horaInicio.text,
                      horaFin.text,
                      lugarTrabajo.text,
                      ubicacion.text,
                      altura.text,
                      tipoTrabajoAltura.text,
                      nombreapellidos.text,
                      cedula.text,
                      arl.text,
                      eps.text,
                      cargo.text,
                      Get.find<ControllerTablasForm3>());
                  //Data que se enviará al sheets

                  var arr3 =
                      List.filled(C.valorswparte3.length, '', growable: false);
                  for (var i = 0; i < C.valorswparte3.length; i++) {
                    if (C.valorswparte3[i].value == true) {
                      arr3[i] = 'Sí';
                    } else {
                      arr3[i] = 'No';
                    }
                  }
                  var arr4 =
                      List.filled(C.valorswparte4.length, '', growable: false);
                  for (var i = 0; i < C.valorswparte4.length; i++) {
                    if (C.valorswparte4[i].value == true) {
                      arr4[i] = 'Sí';
                    } else {
                      arr4[i] = 'No';
                    }
                  }
                  final dataForm3 = {
                    form3Fields.fecha: pickedDate.toString().toUpperCase(),
                    form3Fields.horaInicio:
                        horaInicio.text.trim().toUpperCase(),
                    form3Fields.horaFin: horaFin.text.trim().toUpperCase(),
                    form3Fields.lugarTrabajo:
                        lugarTrabajo.text.trim().toUpperCase(),
                    form3Fields.ubicacion: ubicacion.text.trim().toUpperCase(),
                    form3Fields.altura: altura.text.trim().toUpperCase(),
                    form3Fields.tipoTrabajoAltura:
                        tipoTrabajoAltura.text.trim().toUpperCase(),
                    form3Fields.nombreapellidos:
                        nombreapellidos.text.trim().toUpperCase(),
                    form3Fields.cedula: cedula.text.trim().toUpperCase(),
                    form3Fields.arl: arl.text.trim().toUpperCase(),
                    form3Fields.eps: eps.text.trim().toUpperCase(),
                    form3Fields.cargo: cargo.text.trim().toUpperCase(),
                    form3Fields.vect3_1: arr3[0].toUpperCase(),
                    form3Fields.vect3_2: arr3[1].toUpperCase(),
                    form3Fields.vect3_3: arr3[2].toUpperCase(),
                    form3Fields.vect3_4: arr3[3].toUpperCase(),
                    form3Fields.vect3_5: arr3[4].toUpperCase(),
                    form3Fields.vect3_6: arr3[5].toUpperCase(),
                    form3Fields.vect3_7: arr3[6].toUpperCase(),
                    form3Fields.vect3_8: arr3[7].toUpperCase(),
                    form3Fields.vect3_9: arr3[8].toUpperCase(),
                    form3Fields.vect3_10: arr3[9].toUpperCase(),
                    form3Fields.vect3_11: arr3[10].toUpperCase(),
                    form3Fields.vect3_12: arr3[11].toUpperCase(),
                    form3Fields.vect4_1: arr4[0].toUpperCase(),
                    form3Fields.vect4_2: arr4[1].toUpperCase(),
                    form3Fields.vect4_3: arr4[2].toUpperCase(),
                    form3Fields.vect4_4: arr4[3].toUpperCase(),
                    form3Fields.vect4_5: arr4[4].toUpperCase(),
                    form3Fields.vect4_6: arr4[5].toUpperCase(),
                    form3Fields.vect4_7: arr4[6].toUpperCase(),
                    form3Fields.vect4_8: arr4[7].toUpperCase(),
                    form3Fields.vect4_9: arr4[8].toUpperCase(),
                    form3Fields.vect4_10: arr4[9].toUpperCase(),
                    form3Fields.vect4_11: arr4[10].toUpperCase(),
                    form3Fields.vect4_12: arr4[11].toUpperCase(),
                    form3Fields.vect4_13: arr4[12].toUpperCase(),
                    form3Fields.vect4_14: arr4[13].toUpperCase()
                  };
                  //Llamamos a la función .insertar() para que inserte la info en el sheets
                  await FormSheets3.insertar([dataForm3]);
                  //Enviamos un mensaje que le indique al ususario que el formulario
                  //ha sido llenado exitosamente
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text('¡Formulario llenado con éxito!')),
                  );
                  Navigator.pop(context);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Rellene todos los campos')),
                  );
                }
              }
            },
            onStepCancel: () {
              currentStep == 0 ? null : setState(() => currentStep -= 1);
            },
            //Cuando oprime el indice de un Step
            onStepTapped: (step) => setState(() => currentStep = step),
            //Diseño para los botones
            controlsBuilder: (context, {onStepContinue, onStepCancel}) {
              final isLastStep = currentStep == getSteps(C).length - 1;
              return Container(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (currentStep != 0)
                    OutlineButton(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      onPressed: onStepCancel,
                      child: const Text("Anterior",
                          style: TextStyle(fontSize: 14, color: Colors.black)),
                    ),
                  RaisedButton(
                    onPressed: onStepContinue,
                    color: proElectricosBlue,
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(17)),
                    child: Text(
                      isLastStep ? "Guardar" : "Siguiente",
                      style: const TextStyle(fontSize: 14, color: Colors.white),
                    ),
                  )
                ],
              ));
            },
          ),
        ),
      ),
    );
  }

  //Aquí están los formularios divididos en sus respectivas partes
  List<Step> getSteps(ControllerTablasForm3 C) => [
        Step(
          //Que cuando esté en un paso mayor a este, se ponga un chilito en la bolita
          state: currentStep > 0 ? StepState.complete : StepState.indexed,
          //Que si el estado actual es >=0 se ponga en azul el botón
          isActive: currentStep >= 0,
          title: const Text("General"),
          content: Parte1Form3(
            pickedDate: pickedDate,
            horaInicio: horaInicio,
            horaFin: horaFin,
            lugarTrabajo: lugarTrabajo,
            ubicacion: ubicacion,
            altura: altura,
            tipoTrabajoAltura: tipoTrabajoAltura,
          ),
        ),
        Step(
          state: currentStep > 1 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 1,
          title: const Text("Equipo de trabajo"),
          content: Parte4Form3(
            nombreapellidos: nombreapellidos,
            cedula: cedula,
            arl: arl,
            eps: eps,
            cargo: cargo,
          ),
        ),
        Step(
          state: currentStep > 2 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 2,
          title: const Text("Verificaciones de los elementos de protección"),
          content: Align(
            child: TablasForm(
                titleColumns: const ['EPP', 'No/Sí'],
                titleRows: CamposFormularios.camposParte3Form3,
                valorsw: C.valorswparte3),
            alignment: Alignment.center,
          ),
        ),
        Step(
          state: currentStep > 3 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 3,
          title:
              const Text("Verificaciones previas a la ejecución del trabajo"),
          content: Align(
            child: TablasForm(
                titleColumns: const ['Concepto a analizar', 'No/Sí'],
                titleRows: CamposFormularios.camposParte4Form3,
                valorsw: C.valorswparte4),
            alignment: Alignment.center,
          ),
        ),
        Step(
          state: currentStep > 4 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 4,
          title: const Text("Firma del supervisor"),
          content: const Align(
            child: MyButton("Firmar", "supervisor_signature",
                Icon(Icons.feed, size: 0, color: Colors.black)),
            alignment: Alignment.center,
          ),
        ),
      ];
}
