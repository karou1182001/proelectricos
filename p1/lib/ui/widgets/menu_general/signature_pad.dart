import 'package:flutter/material.dart';
import 'package:signature/signature.dart';

class SignaturePad extends StatefulWidget {
  @override
  _SignaturePadState createState() => _SignaturePadState();
}

class _SignaturePadState extends State<SignaturePad> {
  late SignatureController controller;

  @override
  void initState() {
    super.initState();
    controller = SignatureController(
      penStrokeWidth: 5,
      penColor: Colors.black,
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Column(
        children: <Widget>[
          Signature(
            controller: controller,
            width: 350,
            height: 200,
            backgroundColor:
                Color(int.parse("#FFCFD8DC".replaceAll('#', '0xff'))),
          ),
          SizedBox(
            width: 350,
            child: buildButtons(context),
          ),
        ],
      );

  Widget buildButtons(BuildContext context) => Container(
        color: Color(int.parse("#FFB0BEC5".replaceAll('#', '0xff'))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            buildCheck(context),
            buildClear(),
          ],
        ),
      );

  Widget buildCheck(BuildContext context) => IconButton(
        iconSize: 36,
        icon: Icon(Icons.check, color: Colors.green),
        onPressed: () async {
          if (controller.isNotEmpty) {
            final exportController = SignatureController(
              penStrokeWidth: 2,
              penColor: Colors.black,
              exportBackgroundColor: Colors.white,
              points: controller.points,
            );

            final signature = await exportController.toPngBytes();
            exportController.dispose();
          }
          controller.clear();
        },
      );

  Widget buildClear() => IconButton(
        iconSize: 36,
        icon: Icon(Icons.clear, color: Colors.red),
        onPressed: () => controller.clear(),
      );

  // Future<Uint8List?> exportSignature() async {
  // final exportController = SignatureController(
  //   penStrokeWidth: 2,
  //   penColor: Colors.black,
  //   exportBackgroundColor: Colors.white,
  //   points: controller.points,
  // );

  // final signature = await exportController.toPngBytes();
  // exportController.dispose();

  //   return signature;
  // }
}
