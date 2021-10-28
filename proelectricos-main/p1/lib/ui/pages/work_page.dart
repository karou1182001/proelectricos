import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:p1/domain/controller/workpage_controller.dart';
import 'package:p1/common/constants.dart';
ButtonStyle coolstyle = ButtonStyle(
  side: MaterialStateProperty.all(
      const BorderSide(width: 1, color: proElectricosBlue)),
  foregroundColor: MaterialStateProperty.all(Colors.green),
);

class WorkHomePage extends StatelessWidget {
  WorkHomePage({Key? key}) : super(key: key);

  final WorkPageController controller = Get.find<WorkPageController>();

  @override
  Widget build(BuildContext context) {
    controller.addAddJobButton();
    return Scaffold(
      body: Column(children: [
        Flexible(
            flex: 3,
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
                            margin: const EdgeInsets.all(8),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              image: DecorationImage(
                                fit: BoxFit.fitHeight,
                                // image: AssetImage('assets/placeholder.png'),
                                image: AssetImage('assets/welcome2.png'),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.all(8),
                          child: OutlinedButton(
                            style: coolstyle,
                            onPressed: () {
                              Get.toNamed("/ProfilePage");
                            },
                            child: const FittedBox(
                              fit: BoxFit.fitWidth,
                              child: Text(
                                "PERFIL",
                                maxLines: 1,
                                style: TextStyle(
                                    color: proElectricosBlue,
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
            margin: const EdgeInsets.only(bottom: 30, left: 16, top: 30),
            child:
                const Text("Carlos Ramirez", style: TextStyle(fontSize: 36))),
        Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.only(bottom: 8, left: 16),
            child: const Text(
              "Progreso Diario",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            )),
        Container(
          alignment: Alignment.centerLeft,
          margin: const EdgeInsets.only(bottom: 8, left: 16),
          child: const Text("Área de Trabajo",
              style: TextStyle(
                  color: proElectricosBlue,
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
