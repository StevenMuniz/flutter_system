import 'package:app_system/ui/utils/constants.dart';
import 'package:flutter/material.dart';

class CustomButton {
  static Widget backButton(String cadena) {
    return InkWell(
      onTap: () {
        //Navigator.pop(context);
        //NavigationService.navigateTo(cadena);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(left: 0, top: 10, bottom: 10),
              child: const Icon(Icons.keyboard_arrow_left, color: Colors.black),
            ),
            const Text('Atrás', style: TextStyle(fontWeight: FontWeight.w500))
          ],
        ),
      ),
    );
  }
}

class CustomButton1 extends StatelessWidget {
  final String title;
  final double width;
  final double height;
  final Function fcPressed;
  final bool estado;
  const CustomButton1(
      {Key? key,
      required this.title,
      this.width = 0.0,
      this.height = 45,
      required this.fcPressed,
      this.estado = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: primaryColor,
          elevation: 2,
          minimumSize: Size(width > 1 ? width : size.width,
              height) /* shape: const StadiumBorder() */
          ),
      onPressed: () => fcPressed(),
      child: (estado)
          ? const SizedBox(
              width: 16,
              height: 16,
              child: CircularProgressIndicator(
                color: Colors.white,
                strokeWidth: 1.5,
              ))
          : Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                title,
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),
    );
  }
}
