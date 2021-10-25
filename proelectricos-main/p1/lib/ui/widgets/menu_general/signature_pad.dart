import 'package:flutter/material.dart';
import 'package:signature/signature.dart';
import 'package:flutter/services.dart';

class MyButton extends StatefulWidget {
  @override
  _MyButtonState createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(
        child: Text('Firmar'),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SignaturePad()),
          );
        },
      ),
    );
  }
}

class SignaturePad extends StatefulWidget {
  @override
  _SignaturePadState createState() => _SignaturePadState();
}

class _SignaturePadState extends State<SignaturePad> {
  late SignatureController controller;

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    controller = SignatureController(
      penStrokeWidth: 5,
      penColor: Colors.black,
    );
  }

  @override
  void dispose() {
    controller.dispose();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: Text('Firmar'),
      ),
      body: Column(
        children: <Widget>[
          Signature(
            controller: controller,
            backgroundColor:
                Color(int.parse("#FFCFD8DC".replaceAll('#', '0xff'))),
          ),
          SizedBox(
            child: buildButtons(context),
          ),
        ],
      ));

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
            Navigator.pop(context);
          }
          controller.clear();
        },
      );

  Widget buildClear() => IconButton(
        iconSize: 36,
        icon: Icon(Icons.clear, color: Colors.red),
        onPressed: () => controller.clear(),
      );
}
