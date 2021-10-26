//Widget de cualquier botón que vaya en el perfil que te permita editar algo
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

//Constructor de los campos obligatorios que deben tener estos botones:
//El texto, el icono y hacia donde va el onPressed
class BotonPerfil extends StatelessWidget {
  const BotonPerfil({
    Key? key,
    required this.text,
    //required this.icon,
    this.press,
  }) : super(key: key);

  final String text;
  final VoidCallback? press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
      child: TextButton(
        style: TextButton.styleFrom(
          primary: const Color(0xff264F95),
          padding: const EdgeInsets.all(20),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          backgroundColor: const Color(0xFFF5F6F9),
        ),
        onPressed: press,
        child: Row(
          children: [
            /*SvgPicture.asset(
              icon,
              color: const Color(0xff264F95),
              width: 22,
            ),*/
            //Separación del borde
            const SizedBox(width: 0),
            Expanded(child: Text(text)),
            const Icon(Icons.arrow_forward_ios),
          ],
        ),
      ),
    );
  }
}
