import 'package:flutter/material.dart';
import 'package:p1/ui/widgets/formularios/tabla_peligro_form1.dart';
import 'package:p1/domain/controller/controller_tabla_form1.dart';
import 'package:get/get.dart';

class FormularioUno extends StatefulWidget {
  const FormularioUno({Key? key}) : super(key: key);
  //DataTimePickerPage() : super();
  @override
  FormularioUnoPage createState() => FormularioUnoPage();
}

enum SingingCharacter { rutinario, norutinario }
enum SingingCharacter1 { alturas, electrico }

class FormularioUnoPage extends State<FormularioUno> {
  DateTime pickedDate = DateTime.now();
  SingingCharacter? _character = SingingCharacter.rutinario;
  SingingCharacter1? _character1 = SingingCharacter1.alturas;
  final _claveFormulario = GlobalKey<FormState>();
  final _claveFormulario2 = GlobalKey<FormState>();
  final TextEditingController _codigoBarras = TextEditingController();
  final TextEditingController _descripcion = TextEditingController();
  final TextEditingController _nombre_tecnico = TextEditingController();
  final TextEditingController _nombre_apellido = TextEditingController();
  final TextEditingController _cargo = TextEditingController();
  final TextEditingController _cedula = TextEditingController();
  final TextEditingController _ARL = TextEditingController();
  final TextEditingController _EPS = TextEditingController();

  @override
  void initState() {
    Get.put(ControllerTablaForm1());
    pickedDate = DateTime.now();

    super.initState();
  }

  _pickDate() async {
    DateTime? date = await showDatePicker(
      context: context,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
      initialDate: pickedDate,
    );
    if (date != null) {
      setState(() {
        pickedDate = date;
      });
    }
  }

  FormularioUnoPage() : super();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Autorización y ejecución de trabajos'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ListTile(
              title: Text(
                  "Fecha: ${pickedDate.day}, ${pickedDate.month}, ${pickedDate.year}"),
              trailing: Icon(Icons.keyboard_arrow_down),
              onTap: _pickDate,
            ),
            Container(
              padding: const EdgeInsets.all(40),
              child: Text(
                'Clasificación del trabajo',
                style: TextStyle(height: 3, fontSize: 20),
              ),
            ),
            ListTile(
              title: const Text('Rutinario'),
              leading: Radio<SingingCharacter>(
                value: SingingCharacter.rutinario,
                groupValue: _character,
                onChanged: (SingingCharacter? value) {
                  setState(() {
                    _character = value;
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('No rutinario'),
              leading: Radio<SingingCharacter>(
                value: SingingCharacter.norutinario,
                groupValue: _character,
                onChanged: (SingingCharacter? value) {
                  setState(() {
                    _character = value;
                  });
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.all(40),
              child: Text(
                'La actividad incluye:',
                style: TextStyle(height: 3, fontSize: 20),
              ),
            ),
            ListTile(
              title: const Text('Trabajo en alturas'),
              leading: Radio<SingingCharacter1>(
                value: SingingCharacter1.alturas,
                groupValue: _character1,
                onChanged: (SingingCharacter1? value) {
                  setState(() {
                    _character1 = value;
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('Trabajo electrico'),
              leading: Radio<SingingCharacter1>(
                value: SingingCharacter1.electrico,
                groupValue: _character1,
                onChanged: (SingingCharacter1? value) {
                  setState(() {
                    _character1 = value;
                  });
                },
              ),
            ),
            Form(
              key: _claveFormulario,
              child: ListView(shrinkWrap: true, children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Escribe Cliente';
                      }
                      return null;
                    },
                    controller: _nombre_tecnico,
                    decoration: const InputDecoration(
                      hintText: 'Escribe nombre de quien diligencia',
                      labelText: "Nombre de quien diligencia",
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Escribe Cliente';
                      }
                      return null;
                    },
                    controller: _descripcion,
                    decoration: InputDecoration(
                      hintText: 'Escribe trabajo realizado',
                      labelText: "Trabajo realizado",
                    ),
                  ),
                ),
                Align(
                  child: TablaPeligroForm1(),
                  alignment: Alignment.center,
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Escribe Nombre y Apellido';
                      }
                      return null;
                    },
                    controller: _nombre_apellido,
                    decoration: InputDecoration(
                      hintText: 'Escribe Nombre y Apellido',
                      labelText: "Nombre y Apellido",
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Escribe Cargo a Desempeñar';
                      }
                      return null;
                    },
                    controller: _cargo,
                    decoration: InputDecoration(
                      hintText: 'Escribe Cargo a Desempeñar',
                      labelText: "Cargo a Desempeñar",
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Escribe Número de Cedula';
                      }
                      return null;
                    },
                    controller: _cedula,
                    decoration: InputDecoration(
                      hintText: 'Escribe Número de Cedula',
                      labelText: "Número de Cedula",
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Escribe ARL';
                      }
                      return null;
                    },
                    controller: _ARL,
                    decoration: InputDecoration(
                      hintText: 'Escribe ARL',
                      labelText: "ARL",
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Escribe EPS';
                      }
                      return null;
                    },
                    controller: _EPS,
                    decoration: InputDecoration(
                      hintText: 'Escribe EPS',
                      labelText: "EPS",
                    ),
                  ),
                ),
              ]),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  // Validate will return true if the form is valid, or false if
                  // the form is invalid.
                  if (_claveFormulario.currentState!.validate()) {
                    // Process data.
                  }
                },
                child: const Text('Submit'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
