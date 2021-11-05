import 'package:flutter/material.dart';
import 'package:p1/domain/controller/controller_tabla_form2.dart';
import 'package:get/get.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:p1/ui/pages/formulario_3/components/widgetsReutilizables/scrollable_widget.dart';
import 'package:p1/ui/pages/formulario_3/components/camposDePartes/campos_parte3_form3.dart';

class Parte3Form3 extends StatefulWidget {
  const Parte3Form3({Key? key}) : super(key: key);

  @override
  Parte3Form3State createState() {
    return Parte3Form3State();
  }
}

// Create a corresponding State class.
// Esta clase guarda los datos relacionados con la parte 1 form 3
class Parte3Form3State extends State<Parte3Form3> {
  static ControllerTablaForm1 C = Get.find<ControllerTablaForm1>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return ScrollableWidget(child: buildDataTable(C));
  }
}

Widget buildDataTable(ControllerTablaForm1 C) {
  final columns = ['EPP', 'Sí/No', 'No'];
  bool lights = false;
  //CamposPart3 va a contener todos los campos de la columna izquierda
  final campos = CamposPart3.campos;
  return DataTable(
    headingRowColor:
        MaterialStateColor.resolveWith((states) => const Color(0xff264F95)),
    //Espacio vertical entre campos
    dataRowHeight: 90,
    columns: getColumns(columns),
    rows: getRows(campos, C, lights),
  );
}

//Para obtener las colums de la lista
List<DataColumn> getColumns(List<String> columns) => columns
    .map((String column) => DataColumn(
          label: Text(
            column,
            style: const TextStyle(color: Colors.white),
          ),
        ))
    .toList();

List<DataRow> getRows(
        List<String> campos, ControllerTablaForm1 C, bool lights) =>
    campos
        .map((String campo) => DataRow(
              cells: [
                DataCell(Container(
                  //Espacio horizontal entre 2 campos
                  width: 150,
                  child: Text(campo),
                )),
                DataCell(
                  LiteRollingSwitch(
                    value: true,
                    textOn: 'Sí',
                    textOff: 'No',
                    //colorOn: Colors.cyan,
                    //colorOff: Colors.red[400],
                    //iconOn: Icons.check,
                    //iconOff: Icons.power_settings_new,
                    animationDuration: const Duration(milliseconds: 0),
                    onChanged: (bool state) {
                      print('turned ${(state) ? 'yes' : 'no'}');
                    },
                  ),
                  /*Switch(
                    value: C.valorsw[campos.indexOf(campo)].value,
                    onChanged: (value) {
                      setState(() {
                        C.cambiarvalor(value, campos.indexOf(campo));
                        //C.valorsw[campos.indexOf(campo)].value = value;
                        print(C.valorsw[campos.indexOf(campo)].value);
                      });
                    },
                    activeTrackColor: Colors.yellow,
                    activeColor: Colors.orangeAccent,
                    inactiveThumbColor: const Color(0xff264F95),
                  ),*/
                ),
                DataCell(
                  Obx(
                    () => Checkbox(
                      value: C.si[campos.indexOf(campo)].value,
                      onChanged: (bool? val) {
                        C.cambiarvalorsi(val!, campos.indexOf(campo));
                      },
                    ),
                  ),
                ),
                /*DataCell(
                  Obx(
                    () => Checkbox(
                      value: C.no[campos.indexOf(campo)].value,
                      onChanged: (bool? val) {
                        C.cambiarvalorno(val!, campos.indexOf(campo));
                      },
                    ),
                  ),
                ),*/
              ],
            ))
        .toList();
