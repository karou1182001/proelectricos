import 'package:flutter/material.dart';
import 'package:p1/ui/pages/formulario_3/components/widgetsReutilizables/comp_textformfield.dart';

class Parte1Form3 extends StatefulWidget {
  const Parte1Form3({Key? key}) : super(key: key);

  @override
  Parte1Form3State createState() {
    return Parte1Form3State();
  }
}

// Create a corresponding State class.
// Esta clase guarda los datos relacionados con la parte 1 form 3
class Parte1Form3State extends State<Parte1Form3> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<Parte1Form3State>.
  final TextEditingController _horaInicio = TextEditingController();
  final TextEditingController _horaFin = TextEditingController();
  final TextEditingController _lugarTrabajo = TextEditingController();
  final TextEditingController _ubicacion = TextEditingController();
  final TextEditingController _altura = TextEditingController();

  //final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(width: 10),
        CompTextFormField(
          casoVacio: 'Rellene todos los campos',
          hintText: '',
          labelText: 'Hora de inicio',
          cont: _horaInicio,
        ),
        CompTextFormField(
          casoVacio: 'Rellene todos los campos',
          hintText: '',
          labelText: 'Hora de fin',
          cont: _horaFin,
        ),
        CompTextFormField(
          casoVacio: 'Rellene todos los campos',
          hintText: '',
          labelText: 'Lugar de trabajo',
          cont: _lugarTrabajo,
        ),
        CompTextFormField(
          casoVacio: 'Rellene todos los campos',
          hintText: '',
          labelText: 'Ubicación donde se realiza el trabajo',
          cont: _ubicacion,
        ),
        CompTextFormField(
          casoVacio: 'Rellene todos los campos',
          hintText: 'mts',
          labelText: 'Altura aprox. de desarrollo de act.',
          cont: _altura,
        ),
      ],
    );
    //);
  }
}
