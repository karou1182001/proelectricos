import 'package:flutter/material.dart';
import 'package:p1/ui/widgets/formularios/tabla_peligro_form4.dart';
import 'package:p1/domain/controller/controller_tabla_form4.dart';
import 'package:get/get.dart';

class FormularioCuatro extends StatefulWidget {
  const FormularioCuatro({Key? key}) : super(key: key);
  @override
  FormularioCuatroPage createState() => FormularioCuatroPage();
}

class FormularioCuatroPage extends State<FormularioCuatro> {
  DateTime pickedDate = DateTime.now();
  final _claveFormulario = GlobalKey<FormState>();
  final TextEditingController _descripcion = TextEditingController();
  final TextEditingController _lider = TextEditingController();
  final TextEditingController _nombreApellido = TextEditingController();
  final TextEditingController _cargo = TextEditingController();
  final TextEditingController _cedula = TextEditingController();
  final TextEditingController _ARL = TextEditingController();
  final TextEditingController _EPS = TextEditingController();
  final TextEditingController _tareaRealizar= TextEditingController();

  @override
  void initState() {
    Get.put(ControllerTablaForm3());
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de chequeo para trabajos eléctricos'),
        backgroundColor: Color(0xff264F95),
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
            
            
            Form(
              key: _claveFormulario,
              child: Column( children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Escribe el nombre del lider';
                      }
                      return null;
                    },
                    controller: _lider,
                    decoration: const InputDecoration(
                      hintText: 'Escribe nombre del lider',
                      labelText: "Lider de cuadrilla",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50)), 
                        borderSide: BorderSide(color: Color(0xff264F95))
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        borderSide: BorderSide(color: Color(0xff264F95))),
                      ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Escribe el lugar y la ubicación';
                      }
                      return null;
                    },
                    controller: _descripcion,
                    decoration: InputDecoration(
                      hintText: 'Escribe el lugar y la ubicación',
                      labelText: "Lugar y ubicación donde se realizo el trabajo",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50)), 
                        borderSide: BorderSide(color: Color(0xff264F95))
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        borderSide: BorderSide(color: Color(0xff264F95))),
                     
                    ),
                  ),
                ),

                Align(
                  child: Text(
                    'Equipo de trabajo',
                    style:TextStyle(height: 3, fontSize: 20),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Escribe nombres y apellidos';
                      }
                      return null;
                    },
                    controller: _nombreApellido,
                    decoration: InputDecoration(
                      hintText: 'Escribe nombres y apellidos',
                      labelText: "Nombres y apellidos",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50)), 
                        borderSide: BorderSide(color: Color(0xff264F95))
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        borderSide: BorderSide(color: Color(0xff264F95))),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Escribe el numero de cédula';
                      }
                      return null;
                    },
                    controller: _cedula,
                    decoration: InputDecoration(
                      focusColor: Color(0xff264F95),
                      hintText: 'Escribe el número de cédula',
                      labelText: "Número de cédula ",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50)), 
                        borderSide: BorderSide(color: Color(0xff264F95))
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        borderSide: BorderSide(color: Color(0xff264F95))),
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Escribe la ARL';
                      }
                      return null;
                    },
                    controller: _ARL,
                    decoration: InputDecoration(
                      hintText: 'Escribe la ARL',
                      labelText: "ARL",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50)), 
                        borderSide: BorderSide(color: Color(0xff264F95))
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        borderSide: BorderSide(color: Color(0xff264F95))),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Escribe la EPS';
                      }
                      return null;
                    },
                    controller: _EPS,
                    decoration: InputDecoration(
                      hintText: 'Escribe la EPS',
                      labelText: "EPS",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50)), 
                        borderSide: BorderSide(color: Color(0xff264F95))
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        borderSide: BorderSide(color: Color(0xff264F95))),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Escribe el cargo';
                      }
                      return null;
                    },
                    controller: _cargo,
                    decoration: InputDecoration(
                      hintText: 'Escribe el cargo del trabajador',
                      labelText: "Cargo del trabajador",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50)), 
                        borderSide: BorderSide(color: Color(0xff264F95))
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        borderSide: BorderSide(color: Color(0xff264F95))),
                    ),
                  ),
                ),
                Align(
                  child: Text(
                    'Tarea a realizar',
                    style:TextStyle(height: 3, fontSize: 20),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Escribe tarea a realizar';
                      }
                      return null;
                    },
                    controller: _tareaRealizar,
                    decoration: InputDecoration(
                      hintText: 'Escribe la tarea especifica a realizar',
                      labelText: "Tarea especifica a realizar",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50)), 
                        borderSide: BorderSide(color: Color(0xff264F95))
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        borderSide: BorderSide(color: Color(0xff264F95))),
                    ),
                  ),
                ),
              ]),
            ),
            Align(
                  child: TablaPeligroForm3(),
                  alignment: Alignment.center,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Color(0xff264F95)),
                ),
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