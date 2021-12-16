import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:p1/common/constants.dart';
import 'package:p1/domain/pdf/pdf_generation1.dart';
import 'package:p1/ui/pages/formulario_1/components/partes/parte1_form1.dart';
import 'package:p1/ui/pages/formulario_1/components/partes/parte2_form1.dart';
import 'package:p1/ui/pages/formulario_1/components/partes/parte3_form1.dart';
import 'package:p1/ui/pages/formulario_1/components/partes/parte4_form1.dart';
import 'package:p1/ui/widgetReutilizables/app_bar.dart';
import 'package:p1/ui/pages/sheets/sheet%20connection/sheets_connection_1.dart';
import 'package:p1/ui/widgets/menu_general/menu/menu.dart';
import 'package:p1/ui/pages/sheets/form_1_sheet.dart';
import 'package:p1/ui/widgets/menu_general/perfilUsuario/signature_pad.dart';

class FormularioUno extends StatefulWidget {
  final int jobNumber; // Representa a que trabajo pertenece este formulario.
  const FormularioUno({Key? key, required this.jobNumber}) : super(key: key);
  @override
  _FormularioUnoPage createState() => _FormularioUnoPage();
}

class _FormularioUnoPage extends State<FormularioUno> {
  int currentStep = 0;
  final _formKey = GlobalKey<FormState>();
  //Parte 1 form 1
  DateTime pickedDate = DateTime.now();
  final TextEditingController empresa = TextEditingController();
  final TextEditingController municipio = TextEditingController();
  final TextEditingController cliente = TextEditingController();
  final TextEditingController jornada = TextEditingController();
  final TextEditingController vehiculo = TextEditingController();
  final TextEditingController distrito = TextEditingController();
  final TextEditingController direccion = TextEditingController();
  final TextEditingController no = TextEditingController();
  final TextEditingController horaInicio = TextEditingController();
  final TextEditingController horaFin = TextEditingController();
  final TextEditingController descargo = TextEditingController();
  final TextEditingController incidencia = TextEditingController();
  final TextEditingController nic = TextEditingController();
  final TextEditingController aviso = TextEditingController();
  final TextEditingController numero = TextEditingController();
  final TextEditingController circuito = TextEditingController();
  final TextEditingController mt = TextEditingController();
  final TextEditingController ct = TextEditingController();
  final TextEditingController tension = TextEditingController();
  final TextEditingController supervisor = TextEditingController();
  final TextEditingController celSupervisor = TextEditingController();
  final TextEditingController agenteDescargo = TextEditingController();
  final TextEditingController celAgenteDescargo = TextEditingController();
  //Parte 2 form 1
  final TextEditingController nombre = TextEditingController();
  final TextEditingController cedula = TextEditingController();
  final TextEditingController cargo = TextEditingController();
  //Parte 3 form 1
  final TextEditingController trabajoRealizado = TextEditingController();
  //Parte 4 form 1
  final bool preservacion = true;
  final TextEditingController material = TextEditingController();
  final TextEditingController cantidad = TextEditingController();
  final TextEditingController nuevo = TextEditingController();
  //Variables usadas para el google sheets
  String pres = "";

  @override
  void initState() {
    pickedDate = DateTime.now();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      //BARRA DE NAVEGACIÓN
      appBar: const AppBarWidget(
        text: 'Autorización y ejecución de trabajos',
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
            steps: getSteps(),
            //Lo que sigue aquí abajo son los métodos del getsteps
            //Variable que guarda el estado actual
            currentStep: currentStep,
            //Si oprimimos continue se aumenta en 1 el estado actual
            onStepContinue: () async {
              final isLastStep = currentStep == getSteps().length - 1;
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
                // Validate will return true if the form is valid, or false if
                // the form is invalid.
                if (_formKey.currentState!.validate()) {
                  //EN ESTA PARTE VA LO QUÉ PASA CUANDO TERMINA EL FORMULARIO
                  generateForm1PDF(
                      "jobs/job${widget.jobNumber}/formulario1.pdf",
                      "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}",
                      empresa.text,
                      municipio.text,
                      cliente.text,
                      jornada.text,
                      vehiculo.text,
                      distrito.text,
                      direccion.text,
                      no.text,
                      horaInicio.text,
                      horaFin.text,
                      descargo.text,
                      incidencia.text,
                      nic.text,
                      aviso.text,
                      numero.text,
                      circuito.text,
                      mt.text,
                      ct.text,
                      tension.text,
                      supervisor.text,
                      celSupervisor.text,
                      agenteDescargo.text,
                      celAgenteDescargo.text,
                      nombre.text,
                      cedula.text,
                      cargo.text,
                      trabajoRealizado.text,
                      preservacion,
                      material.text,
                      cantidad.text,
                      nuevo.text);
                  //Se envia a Firebase y a GoogleSheets
                  var data =
                      FirebaseFirestore.instance.collection("formulario_1");
                  if (preservacion) {
                    pres = "Sí";
                  } else {
                    pres = "No";
                  }
                  Future<void> enviarData() {
                    //Enviamos la data a una colección de Firebase
                    return data.add({
                      "01_empresa": empresa.text.trim(),
                      "02_municipio": municipio.text.trim(),
                      "03_fecha": pickedDate,
                      "04_cliente": cliente.text.trim(),
                      "05_jornada": jornada.text.trim(),
                      "06_vehiculo": vehiculo.text.trim(),
                      "07_distrito": distrito.text.trim(),
                      "08_direccion": direccion.text.trim(),
                      "09_no": no.text.trim(),
                      "10_horaInicio": horaInicio.text.trim(),
                      "11_horaFin": horaFin.text.trim(),
                      "12_descargo": descargo.text.trim(),
                      "13_incidencia": incidencia.text.trim(),
                      "14_nic": nic.text.trim(),
                      "15_aviso": aviso.text.trim(),
                      "16_numero": numero.text.trim(),
                      "17_circuito": circuito.text.trim(),
                      "18_mt": mt.text.trim(),
                      "19_ct": ct.text.trim(),
                      "20_tension": tension.text.trim(),
                      "21_supervisor": supervisor.text.trim(),
                      "22_celSupervisor": celSupervisor.text.trim(),
                      "23_agenteDescargo": agenteDescargo.text.trim(),
                      "24_celAgenteDescargo": celAgenteDescargo.text.trim(),
                      "25_nombre": nombre.text.trim(),
                      "26_cedula": cedula.text.trim(),
                      "27_cargo": cargo.text.trim(),
                      "28_trabajoRealizado": trabajoRealizado.text.trim(),
                      "29_preservacion": pres,
                      "30_material": material.text.trim(),
                      "31_cantidad": cantidad.text.trim(),
                      "31_nuevo": nuevo.text.trim(),
                    });
                  }

                  enviarData();
                  //Enviamos la data a google sheets
                  final dataForm1 = {
                    form1Fields.empresa: empresa.text.trim().toUpperCase(),
                    form1Fields.municipio: municipio.text.trim().toUpperCase(),
                    form1Fields.fecha: pickedDate.toString(),
                    form1Fields.cliente: cliente.text.trim().toUpperCase(),
                    form1Fields.jornada: jornada.text.trim().toUpperCase(),
                    form1Fields.vehiculo: vehiculo.text.trim().toUpperCase(),
                    form1Fields.distrito: distrito.text.trim().toUpperCase(),
                    form1Fields.direccion: direccion.text.trim().toUpperCase(),
                    form1Fields.no: no.text.trim().toUpperCase(),
                    form1Fields.horaInicio:
                        horaInicio.text.trim().toUpperCase(),
                    form1Fields.horaFin: horaFin.text.trim().toUpperCase(),
                    form1Fields.descargo: descargo.text.trim().toUpperCase(),
                    form1Fields.incidencia:
                        incidencia.text.trim().toUpperCase(),
                    form1Fields.nic: nic.text.trim().toUpperCase(),
                    form1Fields.aviso: aviso.text.trim().toUpperCase(),
                    form1Fields.numero: numero.text.trim().toUpperCase(),
                    form1Fields.circuito: circuito.text.trim().toUpperCase(),
                    form1Fields.mt: mt.text.trim().toUpperCase(),
                    form1Fields.ct: ct.text.trim().toUpperCase(),
                    form1Fields.tension: tension.text.trim().toUpperCase(),
                    form1Fields.supervisor:
                        supervisor.text.trim().toUpperCase(),
                    form1Fields.celSupervisor:
                        celSupervisor.text.trim().toUpperCase(),
                    form1Fields.agenteDescargo:
                        celAgenteDescargo.text.trim().toUpperCase(),
                    form1Fields.celAgenteDescargo:
                        tension.text.trim().toUpperCase(),
                    form1Fields.nombre: nombre.text.trim().toUpperCase(),
                    form1Fields.cedula: cedula.text.trim().toUpperCase(),
                    form1Fields.cargo: cargo.text.trim().toUpperCase(),
                    form1Fields.trabajoRealizado:
                        trabajoRealizado.text.trim().toUpperCase(),
                    form1Fields.preservacion: pres.toUpperCase(),
                    form1Fields.material: material.text.trim().toUpperCase(),
                    form1Fields.cantidad: cantidad.text.trim().toUpperCase(),
                    form1Fields.nuevo: nuevo.text.trim().toUpperCase(),
                  }; //Función que añadirá la data al sheets
                  await FormSheets.insertar([dataForm1]);
                  //Enviamos un mensaje que le indique al ususario que el formulario
                  //ha sido llenado exitosamente
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text('¡Formulario llenado con éxito!')),
                  );
                  //LLeva al menu (Para llevar el menu es necesario devolverse, no crear un menu nuevo)
                  // Therefore, se debe usar pop, not push.
                  // Navigator.of(context).push(MaterialPageRoute(
                  //     builder: (BuildContext context) =>
                  //         const MenuOptionsScreen()));
                  Navigator.pop(context);
                  // Process data.

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
              final isLastStep = currentStep == getSteps().length - 1;
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
  List<Step> getSteps() => [
        Step(
            //Que cuando esté en un paso mayor a este, se ponga un chilito en la bolita
            state: currentStep > 0 ? StepState.complete : StepState.indexed,
            //Que si el estado actual es >=0 se ponga en azul el botón
            isActive: currentStep >= 0,
            title: const Text("General"),
            content: Parte1Form1(
              empresa: empresa,
              municipio: municipio,
              pickedDate: pickedDate,
              cliente: cliente,
              jornada: jornada,
              vehiculo: vehiculo,
              distrito: distrito,
              direccion: direccion,
              no: no,
              horaInicio: horaInicio,
              horaFin: horaFin,
              descargo: descargo,
              incidencia: incidencia,
              nic: nic,
              aviso: aviso,
              numero: numero,
              circuito: circuito,
              mt: mt,
              ct: ct,
              tension: tension,
              supervisor: supervisor,
              celSupervisor: celSupervisor,
              agenteDescargo: agenteDescargo,
              celAgenteDescargo: celAgenteDescargo,
            )),
        Step(
            state: currentStep > 1 ? StepState.complete : StepState.indexed,
            isActive: currentStep >= 1,
            title: const Text("Personal que ejecuta el trabajo"),
            content: Parte2Form1(nombre: nombre, cedula: cedula, cargo: cargo)),
        Step(
            state: currentStep > 2 ? StepState.complete : StepState.indexed,
            isActive: currentStep >= 2,
            title: const Text("Trabajo realizado"),
            content: Parte3Form1(trabajoRealizado: trabajoRealizado)),
        Step(
          state: currentStep > 3 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 3,
          title: const Text("Materiales"),
          content: Parte4Form1(
              preservacion: preservacion,
              material: material,
              cantidad: cantidad,
              nuevo: nuevo),
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
