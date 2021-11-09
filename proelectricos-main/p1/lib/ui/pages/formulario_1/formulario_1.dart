import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:p1/domain/controller/ControllersForm3/controller_tablaparte3_form3.dart';
import 'package:p1/ui/widgets/menu_general/perfilUsuario/account.dart';

class FormularioUno extends StatefulWidget {
  const FormularioUno({Key? key}) : super(key: key);
  @override
  _FormularioUnoPage createState() => _FormularioUnoPage();
}

class _FormularioUnoPage extends State<FormularioUno> {
  int currentStep = 0;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    Get.put(ControllerTablasForm3());
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
        title: const Text('Autorización de trabajo',
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
          content: Align(
            child: Container(),
            alignment: Alignment.center,
          ),
        ),
        Step(
          state: currentStep > 1 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 1,
          title: const Text("Personal que ejecuta el trabajo"),
          content: Align(
            child: Container(),
            alignment: Alignment.center,
          ),
        ),
        Step(
          state: currentStep > 2 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 2,
          title: const Text("Trabajo realizado"),
          content: Align(
            child: Container(),
            alignment: Alignment.center,
          ),
        ),
        Step(
          state: currentStep > 3 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 3,
          title: const Text("Materiales"),
          content: Align(
            child: Container(),
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
