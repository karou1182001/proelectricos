import 'package:flutter/material.dart';
import 'package:p1/domain/controller/controller_tabla_form4.dart';
import 'package:get/get.dart';

class TablaPeligroForm3 extends StatelessWidget {
  static ControllerTablaForm3 C = Get.find<ControllerTablaForm3>();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: DataTable(
        columns: const <DataColumn>[
          DataColumn(
            label: Text(
              'Concepto analizar',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
          DataColumn(
            label: Text(
              'Si',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
          DataColumn(
            label: Text(
              'No',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
        ],
        rows: <DataRow>[
          DataRow(
            cells: <DataCell>[
              DataCell(Text('Se cuenta con la OT expedida por el cliente para la labor')),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.si[0].value,
                    activeColor:Color(0xff264F95),
                    onChanged: (bool? val) {
                      C.cambiarvalorsi(val!, 0);
                    },
                  ),
                ),
              ),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.no[0].value,
                    activeColor:Color(0xff264F95),
                    onChanged: (bool? val) {
                      C.cambiarvalorno(val!, 0);
                    },
                  ),
                ),
              ),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('Los sistemas de acceso utilizados se encuentran certificados')),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.si[1].value,
                    activeColor:Color(0xff264F95),
                    onChanged: (bool? val) {
                      C.cambiarvalorsi(val!, 1);
                    },
                  ),
                ),
              ),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.no[1].value,
                    activeColor:Color(0xff264F95),
                    onChanged: (bool? val) {
                      C.cambiarvalorno(val!, 1);
                    },
                  ),
                ),
              ),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('Se cuenta con el AST / correctamente diligenciado')),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.si[2].value,
                    activeColor:Color(0xff264F95),
                    onChanged: (bool? val) {
                      C.cambiarvalorsi(val!, 2);
                    },
                  ),
                ),
              ),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.no[2].value,
                    activeColor:Color(0xff264F95),
                    onChanged: (bool? val) {
                      C.cambiarvalorno(val!, 2);
                    },
                  ),
                ),
              ),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('Se cuenta con los EPP requerido')),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.si[3].value,
                    activeColor:Color(0xff264F95),
                    onChanged: (bool? val) {
                      C.cambiarvalorsi(val!, 3);
                    },
                  ),
                ),
              ),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.no[3].value,
                    activeColor:Color(0xff264F95),
                    onChanged: (bool? val) {
                      C.cambiarvalorno(val!, 3);
                    },
                  ),
                ),
              ),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('Las condiciones del personal son óptimas para el trabajo')),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.si[4].value,
                    activeColor:Color(0xff264F95),
                    onChanged: (bool? val) {
                      C.cambiarvalorsi(val!, 4);
                    },
                  ),
                ),
              ),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.no[4].value,
                    activeColor:Color(0xff264F95),
                    onChanged: (bool? val) {
                      C.cambiarvalorno(val!, 4);
                    },
                  ),
                ),
              ),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text(
                  'Los protecciones colectivas tienen pruebas de rigidez dieléctrica vigente')),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.si[5].value,
                    activeColor:Color(0xff264F95),
                    onChanged: (bool? val) {
                      C.cambiarvalorsi(val!, 5);
                    },
                  ),
                ),
              ),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.no[5].value,
                    activeColor:Color(0xff264F95),
                    onChanged: (bool? val) {
                      C.cambiarvalorno(val!, 5);
                    },
                  ),
                ),
              ),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('No se portan elementos metálicos por parte del personal')),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.si[6].value,
                    activeColor:Color(0xff264F95),
                    onChanged: (bool? val) {
                      C.cambiarvalorsi(val!, 6);
                    },
                  ),
                ),
              ),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.no[6].value,
                    activeColor:Color(0xff264F95),
                    onChanged: (bool? val) {
                      C.cambiarvalorno(val!, 6);
                    },
                  ),
                ),
              ),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('La dotación es acorde para ejecutar los trabajos')),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.si[7].value,
                    activeColor:Color(0xff264F95),
                    onChanged: (bool? val) {
                      C.cambiarvalorsi(val!, 7);
                    },
                  ),
                ),
              ),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.no[7].value,
                    activeColor:Color(0xff264F95),
                    onChanged: (bool? val) {
                      C.cambiarvalorno(val!, 7);
                    },
                  ),
                ),
              ),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('Las condiciones climáticas son favorables')),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.si[8].value,
                    activeColor:Color(0xff264F95),
                    onChanged: (bool? val) {
                      C.cambiarvalorsi(val!, 8);
                    },
                  ),
                ),
              ),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.no[8].value,
                    activeColor:Color(0xff264F95),
                    onChanged: (bool? val) {
                      C.cambiarvalorno(val!, 8);
                    },
                  ),
                ),
              ),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('Se realizó corte efectivo de todas las fuentes de tensión')),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.si[9].value,
                    activeColor:Color(0xff264F95),
                    onChanged: (bool? val) {
                      C.cambiarvalorsi(val!, 9);
                    },
                  ),
                ),
              ),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.no[9].value,
                    activeColor:Color(0xff264F95),
                    onChanged: (bool? val) {
                      C.cambiarvalorno(val!, 9);
                    },
                  ),
                ),
              ),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('Cuenta con herramientas aisladas ')),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.si[10].value,
                    activeColor:Color(0xff264F95),
                    onChanged: (bool? val) {
                      C.cambiarvalorsi(val!, 10);
                    },
                  ),
                ),
              ),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.no[10].value,
                    activeColor:Color(0xff264F95),
                    onChanged: (bool? val) {
                      C.cambiarvalorno(val!, 10);
                    },
                  ),
                ),
              ),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('Se realizó medición y verificación de ausencia de tensión')),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.si[11].value,
                    activeColor:Color(0xff264F95),
                    onChanged: (bool? val) {
                      C.cambiarvalorsi(val!, 11);
                    },
                  ),
                ),
              ),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.no[11].value,
                    activeColor:Color(0xff264F95),
                    onChanged: (bool? val) {
                      C.cambiarvalorno(val!, 11);
                    },
                  ),
                ),
              ),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('Se colocaron las puestas a tierra y en corto circuito')),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.si[12].value,
                    activeColor:Color(0xff264F95),
                    onChanged: (bool? val) {
                      C.cambiarvalorsi(val!, 12);
                    },
                  ),
                ),
              ),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.no[12].value,
                    activeColor:Color(0xff264F95),
                    onChanged: (bool? val) {
                      C.cambiarvalorno(val!, 12);
                    },
                  ),
                ),
              ),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('Se realizó señalización y demarcación del área de trabajo')),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.si[13].value,
                    activeColor:Color(0xff264F95),
                    onChanged: (bool? val) {
                      C.cambiarvalorsi(val!, 13);
                    },
                  ),
                ),
              ),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.no[13].value,
                    activeColor:Color(0xff264F95),
                    onChanged: (bool? val) {
                      C.cambiarvalorno(val!, 13);
                    },
                  ),
                ),
              ),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('Los guantes dieléctricos, se encuentran en buen estado y con sus puebas dieléctricas.')),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.si[14].value,
                    activeColor:Color(0xff264F95),
                    onChanged: (bool? val) {
                      C.cambiarvalorsi(val!, 14);
                    },
                  ),
                ),
              ),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.no[14].value,
                    activeColor:Color(0xff264F95),
                    onChanged: (bool? val) {
                      C.cambiarvalorno(val!, 14);
                    },
                  ),
                ),
              ),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('Los bastones rigidos, pertigas tiene su respectiva prueba de rigidez dielectrica')),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.si[15].value,
                    activeColor:Color(0xff264F95),
                    onChanged: (bool? val) {
                      C.cambiarvalorsi(val!, 15);
                    },
                  ),
                ),
              ),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.no[15].value,
                    activeColor:Color(0xff264F95),
                    onChanged: (bool? val) {
                      C.cambiarvalorno(val!, 15);
                    },
                  ),
                ),
              ),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('Las mantas dieléctricas estan en buen estado y con sus respectiva Prueba de Rigidez Dieléctrica ')),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.si[16].value,
                    activeColor:Color(0xff264F95),
                    onChanged: (bool? val) {
                      C.cambiarvalorsi(val!, 16);
                    },
                  ),
                ),
              ),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.no[16].value,
                    activeColor:Color(0xff264F95),
                    onChanged: (bool? val) {
                      C.cambiarvalorno(val!, 16);
                    },
                  ),
                ),
              ),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('Las mangas dielectricas se encuentra en buen estado para su utilización y sus respectiva pruebas dieléctricas')),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.si[17].value,
                    activeColor:Color(0xff264F95),
                    onChanged: (bool? val) {
                      C.cambiarvalorsi(val!, 17);
                    },
                  ),
                ),
              ),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.no[17].value,
                    activeColor:Color(0xff264F95),
                    onChanged: (bool? val) {
                      C.cambiarvalorno(val!, 17);
                    },
                  ),
                ),
              ),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('El personal de la cuadrilla se encuentra en buen estado físico y capacitado')),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.si[18].value,
                    activeColor:Color(0xff264F95),
                    onChanged: (bool? val) {
                      C.cambiarvalorsi(val!, 18);
                    },
                  ),
                ),
              ),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.no[18].value,
                    activeColor:Color(0xff264F95),
                    onChanged: (bool? val) {
                      C.cambiarvalorno(val!, 18);
                    },
                  ),
                ),
              ),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('Detector de ausencia o presencia de tensión funciona correctamente')),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.si[19].value,
                    activeColor:Color(0xff264F95),
                    onChanged: (bool? val) {
                      C.cambiarvalorsi(val!, 19);
                    },
                  ),
                ),
              ),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.no[19].value,
                    activeColor:Color(0xff264F95),
                    onChanged: (bool? val) {
                      C.cambiarvalorno(val!, 19);
                    },
                  ),
                ),
              ),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('Equipo de puesta a tierra se encuentra en buen estado')),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.si[20].value,
                    activeColor:Color(0xff264F95),
                    onChanged: (bool? val) {
                      C.cambiarvalorsi(val!, 20);
                    },
                  ),
                ),
              ),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.no[20].value,
                    activeColor:Color(0xff264F95),
                    onChanged: (bool? val) {
                      C.cambiarvalorno(val!, 20);
                    },
                  ),
                ),
              ),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('La caretas ignifugas se encuentra en buen estado y funcional')),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.si[21].value,
                    activeColor:Color(0xff264F95),
                    onChanged: (bool? val) {
                      C.cambiarvalorsi(val!, 21);
                    },
                  ),
                ),
              ),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.no[21].value,
                    activeColor:Color(0xff264F95),
                    onChanged: (bool? val) {
                      C.cambiarvalorno(val!, 21);
                    },
                  ),
                ),
              ),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('Pinza voltiamperimetrica está calibrada y funciona correctamente')),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.si[22].value,
                    activeColor:Color(0xff264F95),
                    onChanged: (bool? val) {
                      C.cambiarvalorsi(val!, 22);
                    },
                  ),
                ),
              ),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.no[22].value,
                    activeColor:Color(0xff264F95),
                    onChanged: (bool? val) {
                      C.cambiarvalorno(val!, 22);
                    },
                  ),
                ),
              ),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('Secuencimetro está calibrado y funciona correctamente')),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.si[23].value,
                    activeColor:Color(0xff264F95),
                    onChanged: (bool? val) {
                      C.cambiarvalorsi(val!, 23);
                    },
                  ),
                ),
              ),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.no[23].value,
                    activeColor:Color(0xff264F95),
                    onChanged: (bool? val) {
                      C.cambiarvalorno(val!, 23);
                    },
                  ),
                ),
              ),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('Monja ignifuga se encuentra en buen estado para su utilización')),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.si[24].value,
                    activeColor:Color(0xff264F95),
                    onChanged: (bool? val) {
                      C.cambiarvalorsi(val!, 24);
                    },
                  ),
                ),
              ),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.no[24].value,
                    activeColor:Color(0xff264F95),
                    onChanged: (bool? val) {
                      C.cambiarvalorno(val!, 24);
                    },
                  ),
                ),
              ),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('Antes de realizar el trabajo eléctricos verifique todas las herramientas y protecciones que va utilizar')),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.si[25].value,
                    activeColor:Color(0xff264F95),
                    onChanged: (bool? val) {
                      C.cambiarvalorsi(val!, 25);
                    },
                  ),
                ),
              ),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.no[25].value,
                    activeColor:Color(0xff264F95),
                    onChanged: (bool? val) {
                      C.cambiarvalorno(val!, 25);
                    },
                  ),
                ),
              ),
            ],
          ),
          DataRow(
            cells: <DataCell>[
              DataCell(Text('El trabajador se encuentra concientizado al riesgo que se va enfrentar')),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.si[26].value,
                    activeColor:Color(0xff264F95),
                    onChanged: (bool? val) {
                      C.cambiarvalorsi(val!, 26);
                    },
                  ),
                ),
              ),
              DataCell(
                Obx(
                  () => Checkbox(
                    value: C.no[26].value,
                    activeColor:Color(0xff264F95),
                    onChanged: (bool? val) {
                      C.cambiarvalorno(val!, 26);
                    },
                  ),
                ),
              ),
            ],
          ),
          
        ],
      ),
    );
  }
}