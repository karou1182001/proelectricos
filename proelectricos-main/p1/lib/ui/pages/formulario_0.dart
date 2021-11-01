// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:p1/ui/widgets/menu_general/menu/menu.dart';

class FormularioZero extends StatefulWidget {
  const FormularioZero({Key? key}) : super(key: key);
  //DataTimePickerPage() : super();
  @override
  FormularioZeroPage createState() => FormularioZeroPage();
}

enum SingingCharacter { preservacion, nopreservacion }
enum SingingCharacter1 { nuevo, nonuevo }

class FormularioZeroPage extends State<FormularioZero> {
  final TextEditingController _empresa = TextEditingController();
  final TextEditingController _municipio = TextEditingController();
  DateTime pickedDate = DateTime.now();
  final TextEditingController _cliente = TextEditingController();
  final TextEditingController _jornada = TextEditingController();
  final TextEditingController _vehiculo = TextEditingController();
  final TextEditingController _distrito = TextEditingController();
  final TextEditingController _direccion = TextEditingController();
  final TextEditingController _no = TextEditingController();
  final TextEditingController _horaInicio = TextEditingController();
  final TextEditingController _horaFin = TextEditingController();
  final TextEditingController _descargo = TextEditingController();
  final TextEditingController _incidencia = TextEditingController();
  final TextEditingController _nic = TextEditingController();
  final TextEditingController _aviso = TextEditingController();
  final TextEditingController _numero = TextEditingController();
  final TextEditingController _circuito = TextEditingController();
  final TextEditingController _mt = TextEditingController();
  final TextEditingController _ct = TextEditingController();
  final TextEditingController _tension = TextEditingController();
  final TextEditingController _nombreCompleto = TextEditingController();
  final TextEditingController _cargo = TextEditingController();
  final TextEditingController _cedula = TextEditingController();
  final TextEditingController _descripcion = TextEditingController();
  SingingCharacter? _character = SingingCharacter.preservacion;
  final TextEditingController _material = TextEditingController();
  final TextEditingController _cantidad = TextEditingController();
  SingingCharacter1? _character1 = SingingCharacter1.nuevo;


  final _claveFormulario = GlobalKey<FormState>();
  

  @override

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
        title: Text('Autorización y Ejecución de Trabajo'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(20),
              child: const Text(
                'Fecha: (dd/mm/aaaa)',
                style: TextStyle(height: 3, fontSize: 20),
              ),
            ),
            ListTile(
              title: Text(
                  "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}"),
              trailing: Icon(Icons.keyboard_arrow_down),
              onTap: _pickDate,
            ),
            
            Form(
              key: _claveFormulario,
              child: Column(children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Escribe el nombre de tu empresa.';
                      }
                      return null;
                    },
                    controller: _empresa,
                    decoration: const InputDecoration(
                      hintText: 'Escribe el nombre de tu empresa.',
                      labelText: "Empresa:",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50)), 
                        borderSide: BorderSide(color: Color(0xff264F95))
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Escribe el nombre del municipio.';
                      }
                      return null;
                    },
                    controller: _municipio,
                    decoration: const InputDecoration(
                      hintText: 'Escribe el nombre del municipio.',
                      labelText: "Municipio:",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50)), 
                        borderSide: BorderSide(color: Color(0xff264F95))
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Escribe el nombre del cliente.';
                      }
                      return null;
                    },
                    controller: _cliente,
                    decoration: const InputDecoration(
                      hintText: 'Escribe el nombre del cliente.',
                      labelText: "Cliente:",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50)), 
                        borderSide: BorderSide(color: Color(0xff264F95))
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Especifique la jornada de trabajo.';
                      }
                      return null;
                    },
                    controller: _jornada,
                    decoration: const InputDecoration(
                      hintText: 'Especifique la jornada de trabajo.',
                      labelText: "Jornada:",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50)), 
                        borderSide: BorderSide(color: Color(0xff264F95))
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Especifique su vehículo.';
                      }
                      return null;
                    },
                    controller: _vehiculo,
                    decoration: const InputDecoration(
                      hintText: 'Especifique su vehículo.',
                      labelText: "Vehículo:",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50)), 
                        borderSide: BorderSide(color: Color(0xff264F95))
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Escribe el nombre del distrito.';
                      }
                      return null;
                    },
                    controller: _distrito,
                    decoration: const InputDecoration(
                      hintText: 'Escribe el nombre del distrito.',
                      labelText: "Distrito:",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50)), 
                        borderSide: BorderSide(color: Color(0xff264F95))
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Escriba la dirección.';
                      }
                      return null;
                    },
                    controller: _direccion,
                    decoration: const InputDecoration(
                      hintText: 'Escriba la dirección.',
                      labelText: "Dirección:",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50)), 
                        borderSide: BorderSide(color: Color(0xff264F95))
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Escribe el No.';
                      }
                      return null;
                    },
                    controller: _no,
                    decoration: const InputDecoration(
                      hintText: 'Escribe el No.',
                      labelText: "No. :",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50)), 
                        borderSide: BorderSide(color: Color(0xff264F95))
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Escribe la hora de inicio.';
                      }
                      return null;
                    },
                    controller: _horaInicio,
                    decoration: const InputDecoration(
                      hintText: 'Escribe la hora de inicio.',
                      labelText: "Hora de inicio:",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50)), 
                        borderSide: BorderSide(color: Color(0xff264F95))
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Escribe la hora de finalización.';
                      }
                      return null;
                    },
                    controller: _horaFin,
                    decoration: const InputDecoration(
                      hintText: 'Escribe la hora de finalización.',
                      labelText: "Hora de finalización:",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50)), 
                        borderSide: BorderSide(color: Color(0xff264F95))
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Escribe el descargo.';
                      }
                      return null;
                    },
                    controller: _descargo,
                    decoration: const InputDecoration(
                      hintText: 'Escribe el descargo.',
                      labelText: "Descargo:",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50)), 
                        borderSide: BorderSide(color: Color(0xff264F95))
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Escribe la incidencia.';
                      }
                      return null;
                    },
                    controller: _incidencia,
                    decoration: const InputDecoration(
                      hintText: 'Escribe la incidencia.',
                      labelText: "Incidencia:",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50)), 
                        borderSide: BorderSide(color: Color(0xff264F95))
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Escribe el NIC.';
                      }
                      return null;
                    },
                    controller: _nic,
                    decoration: const InputDecoration(
                      hintText: 'Escribe el NIC.',
                      labelText: "NIC:",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50)), 
                        borderSide: BorderSide(color: Color(0xff264F95))
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Escribe el aviso.';
                      }
                      return null;
                    },
                    controller: _aviso,
                    decoration: const InputDecoration(
                      hintText: 'Escribe el aviso.',
                      labelText: "Aviso:",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50)), 
                        borderSide: BorderSide(color: Color(0xff264F95))
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Escribe el número del trabajo.';
                      }
                      return null;
                    },
                    controller: _numero,
                    decoration: const InputDecoration(
                      hintText: 'Escribe el número del trabajo.',
                      labelText: "Número:",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50)), 
                        borderSide: BorderSide(color: Color(0xff264F95))
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Escribe el circuito.';
                      }
                      return null;
                    },
                    controller: _circuito,
                    decoration: const InputDecoration(
                      hintText: 'Escribe el circuito.',
                      labelText: "Circuito:",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50)), 
                        borderSide: BorderSide(color: Color(0xff264F95))
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Escribe el MT.';
                      }
                      return null;
                    },
                    controller: _mt,
                    decoration: const InputDecoration(
                      hintText: 'Escribe el MT.',
                      labelText: "MT:",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50)), 
                        borderSide: BorderSide(color: Color(0xff264F95))
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Escribe el CT.';
                      }
                      return null;
                    },
                    controller: _ct,
                    decoration: const InputDecoration(
                      hintText: 'Escribe el CT.',
                      labelText: "CT:",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50)), 
                        borderSide: BorderSide(color: Color(0xff264F95))
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Escribe el nivel de tensión.';
                      }
                      return null;
                    },
                    controller: _tension,
                    decoration: const InputDecoration(
                      hintText: 'Escribe el nivel de tensión.',
                      labelText: "Nivel de tensión:",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50)), 
                        borderSide: BorderSide(color: Color(0xff264F95))
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Escribe la incidencia.';
                      }
                      return null;
                    },
                    controller: _descripcion,
                    decoration: const InputDecoration(
                      hintText: 'Escribe la incidencia.',
                      labelText: "Incidencia:",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50)), 
                        borderSide: BorderSide(color: Color(0xff264F95))
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Escribe nombre y apellido.';
                      }
                      return null;
                    },
                    controller: _nombreCompleto,
                    decoration: const InputDecoration(
                      hintText: 'Escribe nombre y apellido.',
                      labelText: "Nombre completo:",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50)), 
                        borderSide: BorderSide(color: Color(0xff264F95))
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Escribe cargo a desempeñar.';
                      }
                      return null;
                    },
                    controller: _cargo,
                    decoration: const InputDecoration(
                      hintText: 'Escribe el cargo a desempeñar.',
                      labelText: "Cargo a Desempeñar:",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50)), 
                        borderSide: BorderSide(color: Color(0xff264F95))
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Escribe el número de cedula.';
                      }
                      return null;
                    },
                    controller: _cedula,
                    decoration: const InputDecoration(
                      hintText: 'Escribe el número de cedula.',
                      labelText: "Número de cedula:",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50)), 
                        borderSide: BorderSide(color: Color(0xff264F95))
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Escribe el trabajo realizado.';
                      }
                      return null;
                    },
                    controller: _descripcion,
                    decoration: const InputDecoration(
                      hintText: 'Escribe trabajo realizado',
                      labelText: "Trabajo realizado:",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50)), 
                        borderSide: BorderSide(color: Color(0xff264F95))
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  child: const Text(
                    'Se evidencia preservación y conservación de la propiedad del cliente:',
                    style: TextStyle(height: 1.1, fontSize: 20),
                  ),
                ),
                ListTile(
                  title: const Text('Sí.'),
                  leading: Radio<SingingCharacter>(
                    value: SingingCharacter.preservacion,
                    groupValue: _character,
                    onChanged: (SingingCharacter? value) {
                      setState(() {
                        _character = value;
                      });
                    },
                  ),
                ),
                ListTile(
                  title: const Text('No.'),
                  leading: Radio<SingingCharacter>(
                    value: SingingCharacter.nopreservacion,
                    groupValue: _character,
                    onChanged: (SingingCharacter? value) {
                      setState(() {
                        _character = value;
                      });
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Especifique el material utilizado.';
                      }
                      return null;
                    },
                    controller: _material,
                    decoration: const InputDecoration(
                      hintText: 'Especifique el material utilizado.',
                      labelText: "Material:",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50)), 
                        borderSide: BorderSide(color: Color(0xff264F95))
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Especifique la cantidad de material utilizado.';
                      }
                      return null;
                    },
                    controller: _cantidad,
                    decoration: const InputDecoration(
                      hintText: 'Especifique la cantidad de material utilizado.',
                      labelText: "Cantidad de material:",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50)), 
                        borderSide: BorderSide(color: Color(0xff264F95))
                      ),
                    ),
                  ),
                ),
                Container(
              padding: const EdgeInsets.all(20),
              child: const Text(
                'El material utilizado es nuevo:',
                style: TextStyle(height: 1.1, fontSize: 20),
              ),
            ),
            ListTile(
              title: const Text('Sí.'),
              leading: Radio<SingingCharacter1>(
                value: SingingCharacter1.nuevo,
                groupValue: _character1,
                onChanged: (SingingCharacter1? value) {
                  setState(() {
                    _character1 = value;
                  });
                },
              ),
            ),
            ListTile(
              title: const Text('No.'),
              leading: Radio<SingingCharacter1>(
                value: SingingCharacter1.nonuevo,
                groupValue: _character1,
                onChanged: (SingingCharacter1? value) {
                  setState(() {
                    _character1 = value;
                  });
                },
              ),
            ),
              ]),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  // Validate will return true if the form is valid, or false if
                  // the form is invalid.
                  if (_claveFormulario.currentState!.validate()) {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => MenuOptionsScreen()));
                    // Process data.
                  }
                },
                child: const Text('Enviar'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
