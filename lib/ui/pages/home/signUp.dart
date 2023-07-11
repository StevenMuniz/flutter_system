import 'package:app_system/ui/pages/widgets/customInputText.dart';
import 'package:flutter/material.dart';

import '../../routes/fluroRouter.dart';
import '../../routes/navigationService.dart';
import '../../utils/constants.dart';
import '../widgets/customInputDecoration.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    Widget _volver() {
      return InkWell(
        onTap: () {
          /*Navigator.pop(context);*/
          NavigationService.replaceTo(Flurorouter.rootRoute);
        },
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 20),
          padding: const EdgeInsets.all(15),
          alignment: Alignment.bottomCenter,
          // ignore: prefer_const_constructors
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Tooltip(
                message: "Login",
                child: CircleAvatar(
                  backgroundColor: Colors.black87,
                  child: Text(
                    "<",
                    style: h3.copyWith(color: Colors.yellowAccent),
                  ),
                  radius: 15,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              const Text(
                'Inicio Sesión',
                style: h4,
              ),
            ],
          ),
        ),
      );
    }

    return Container(
      decoration: BoxDecoration(
        //color: Colors.w,
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
        image: DecorationImage(
          image: const ExactAssetImage("assets/images/fondo2.jpg"),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
              Colors.white.withOpacity(0.3), BlendMode.dstATop),
        ),
        boxShadow: const [
          BoxShadow(
            color: Colors.black38,
            spreadRadius: 10,
            blurRadius: 20,
          ),
        ],
      ),
      child: Stack(children: [
        Padding(
          padding: const EdgeInsets.only(left: 100, right: 100),
          child: Wrap(
            spacing: 5,
            children: [
              InputTextGroup(
                title: "NOMBRE:",
                controller: null,
                fcValidator: (value) {},
                fcChanged: (value) {},
                decoration: CustomInputDecoration.inputDecorationDefault(),
                column: 2.5,
              ),
              InputTextGroup(
                title: "C.I(cédula identidad):",
                controller: null,
                fcValidator: (value) {},
                fcChanged: (value) {},
                decoration: CustomInputDecoration.inputDecorationDefault(),
                column: 2.5,
              ),
              InputTextGroup(
                title: "TELEFONO:",
                controller: null,
                fcValidator: (value) {},
                fcChanged: (value) {},
                decoration: CustomInputDecoration.inputDecorationDefault(),
              ),
              InputTextGroup(
                title: "CORREO:",
                controller: null,
                fcValidator: (value) {},
                fcChanged: (value) {},
                decoration: CustomInputDecoration.inputDecorationDefault(),
              ),
              InputTextGroup(
                title: "TIPO",
                controller: null,
                fcValidator: (value) {},
                fcChanged: (value) {},
                decoration: CustomInputDecoration.inputDecorationDefault(),
              ),
              InputTextGroup(
                title: "CONTRASEÑA",
                controller: null,
                fcValidator: (value) {},
                fcChanged: (value) {},
                decoration: CustomInputDecoration.inputDecorationDefault(),
              ),
              InputTextGroup(
                title: "CONFIRMAR CONTRASEÑA",
                controller: null,
                fcValidator: (value) {},
                fcChanged: (value) {},
                decoration: CustomInputDecoration.inputDecorationDefault(),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: -25,
          right: 20,
          child: _volver(),
        ),
        const Positioned(
          top: 10,
          left: 10,
          child: Text(
            "REGISTRARSE",
            style: h3,
          ),
        ),
      ]),
    );
  }
}
