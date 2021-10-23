import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:p1/domain/controller/TrabajosPageController.dart';

const Color ProElectricosBlue = const Color(0xff264F95);

ButtonStyle coolstyle = ButtonStyle(
  side:
      MaterialStateProperty.all(BorderSide(width: 1, color: ProElectricosBlue)),
  foregroundColor: MaterialStateProperty.all(Colors.green),
);

class ProfileHomePage extends StatelessWidget {
  final TrabajosPageController controller = Get.find<TrabajosPageController>();

  @override
  Widget build(BuildContext context) {
    controller.addAddJobButton();
    return Scaffold(
      body: Column(children: [
        Flexible(
            flex: 2,
            fit: FlexFit.tight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Flexible(
                    flex: 9,
                    fit: FlexFit.tight,
                    // child: Image.asset('images/proelectricos.png'),
                    child: Container(
                        alignment: Alignment.topLeft,
                        child: Image.asset('assets/proelectricos.png'))),
                Flexible(
                    flex: 3,
                    fit: FlexFit.tight,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      // crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              image: DecorationImage(
                                fit: BoxFit.fitHeight,
                                image: AssetImage('assets/placeholder.png'),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(8),
                          child: OutlinedButton(
                            style: coolstyle,
                            onPressed: () {},
                            child: FittedBox(
                              fit: BoxFit.fitWidth,
                              child: Text(
                                "PERFIL",
                                maxLines: 1,
                                style: TextStyle(
                                    color: ProElectricosBlue,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        )
                      ],
                    ))
              ],
            )),
        // Cool Display
        // Flexible(flex: 4, fit: FlexFit.tight, child: Column),
        Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(bottom: 30, left: 16, top: 30),
            child: Text("Carlos Ramirez", style: TextStyle(fontSize: 36))),
        Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(bottom: 8, left: 16),
            child: Text(
              "Progreso Diario",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            )),
        Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.only(bottom: 8, left: 16),
          child: Text("Área de Trabajo",
              style: TextStyle(
                  color: ProElectricosBlue,
                  fontSize: 20,
                  fontWeight: FontWeight.bold)),
        ),

        Flexible(
          flex: 6,
          fit: FlexFit.tight,
          child: Container(
              alignment: Alignment.centerLeft,
              child: Obx(() => ListView(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  // crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: controller.joblist))),
        )
      ]),
    );
  }
}

class JobWidget extends StatelessWidget {
  final String jobName;
  JobWidget({
    // Receives Value to display in cell, and it's respective pos in matrix
    Key? key,
    required this.jobName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 100,
        margin: EdgeInsets.only(left: 30, right: 60),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Indicator
              Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: ProElectricosBlue),
                      color: const Color(0xffefefef)),
                  child: IconButton(
                      onPressed: () => {},
                      icon: Icon(Icons.check_box, color: ProElectricosBlue))),
              // Text("$jobName"),
              // IconButton(
              //     onPressed: () {},
              //     icon: Icon(Icons.skip_next, color: ProElectricosBlue))
              Expanded(
                  child: Container(
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.grey)),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          margin: EdgeInsets.only(left: 8),
                          child: Text("$jobName")),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.skip_next, color: ProElectricosBlue),
                      ),
                    ]),
              ))
            ]));
  }
}

// class AddJobWidget extends StatelessWidget {
//   final HomePageController c = Get.find<HomePageController>();

//   @override
//   Widget build(BuildContext context) {
//     return IconButton(
//       onPressed: () => {c.addJob()},
//       icon: Icon(Icons.plus_one),
//     );
//   }
// }
