import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:p1/domain/controller/ControllersForm3/controller_tablaparte3_form3.dart';
import 'package:p1/ui/widgets/menu_general/perfilUsuario/account.dart';
import 'package:p1/ui/pages/formulario_3/components/partes/parte1_form3.dart';
import 'package:p1/ui/pages/formulario_3/components/partes/tablas_form3.dart';

import 'package:p1/ui/pages/formulario_3/components/camposDePartes/campos_form3.dart';

import 'components/partes/parte4_form3.dart';

class FormularioTres extends StatefulWidget {
  const FormularioTres({Key? key}) : super(key: key);
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
  //Parte 4 form 4
  final TextEditingController nombreapellidos = TextEditingController();
  final TextEditingController cedula = TextEditingController();
  final TextEditingController arl = TextEditingController();
  final TextEditingController eps = TextEditingController();
  final TextEditingController cargo = TextEditingController();
  //Vectores para booleanos
  //Llamar al controlador
  //ControllerTablasForm3 C = Get.find<ControllerTablasForm3>();
  //Son los vectores de booleanos para las tablas
  //C.valorswparte3 tiene valores de la tabla 3
  //C.valorswparte4

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
      appBar: AppBar(
        backgroundColor: const Color(0xff264F95),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          //Te regresa a la ruta inmediatamente anterior
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Lista de chequeo para trabajo en alturas',
            style: TextStyle(
              fontSize: 13,
              color: Colors.white,
            )),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.account_circle,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => const EditProfilePage()));
            },
          ),
        ],
      ),
      //CUERPO
      //Esto es lo que va en el cuerpo de esta interfaz
      body: Form(
        key: _formKey,
        child: Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(primary: Color(0xff264F95)),
          ),
          child: Stepper(
            type: StepperType.vertical,
            //getSteps() contiene la interfaz como tal
            steps: getSteps(C),
            //Lo que sigue aquí abajo son los métodos del getsteps
            //Variable que guarda el estado actual
            currentStep: currentStep,
            //Si oprimimos continue se aumenta en 1 el estado actual
            onStepContinue: () {
              final isLastStep = currentStep == getSteps(C).length - 1;
              if (isLastStep) {
                print("Completed");
                //AQUÍ ES DONDE DEBEMOS PONER QUÉ PASA CUANDO TERMINA EL FORMULARIO
              } else {
                //Y hace las cosas del form
                // Validate returns true if the form is valid, or false otherwise.
                if (_formKey.currentState!.validate()) {
                  // If the form is valid, display a snackbar. In the real world,
                  // you'd often call a server or save the information in a database.
                  setState(() => currentStep += 1);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Prosiga')),
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
                    color: const Color(0xff264F95),
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
            child: TablasForm3(
                titleColumns: const ['EPP', 'No/Sí'],
                titleRows: CamposForm3.camposParte3Form3,
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
            child: TablasForm3(
                titleColumns: const ['Concepto a analizar', 'No/Sí'],
                titleRows: CamposForm3.camposParte4Form3,
                valorsw: C.valorswparte4),
            alignment: Alignment.center,
          ),
        ),
        Step(
          state: currentStep > 4 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 4,
          title: const Text("Firmas"),
          content: Align(
            child: Container(),
            alignment: Alignment.center,
          ),
        ),
      ];
}
