import 'package:app_system/domain/providers/homeController.dart';
import 'package:app_system/domain/providers/init.dart';
import 'package:app_system/ui/pages/home/widgets/bezierContainer.dart';
import 'package:app_system/ui/pages/widgets/customButton.dart';
import 'package:app_system/ui/pages/widgets/customInputDecoration.dart';
import 'package:app_system/ui/pages/widgets/customInputText.dart';
import 'package:app_system/ui/routes/fluroRouter.dart';
import 'package:app_system/ui/routes/navigationService.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SignInMobile extends StatefulHookConsumerWidget {
  const SignInMobile({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignInMobileState();
}

class _SignInMobileState extends ConsumerState<SignInMobile> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isPassword = true;
  bool isVisible = false;
  final txtEmail = TextEditingController();
  final txtPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final provider = ref.watch<HomeController>(providerHome);
    final size = MediaQuery.of(context).size;
    return Stack(
      fit: StackFit.loose,
      children: <Widget>[
        Positioned(
          top: -size.height * .15,
          right: -size.width * .4,
          child: const BezierContainer(),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: size.height * .15),
                Image.asset(
                  "assets/images/logo.png",
                  height: 130,
                  width: 150,
                ),
                const SizedBox(height: 50),
                InputTextGroup(
                  title: "Email",
                  controller: txtEmail,
                  fcChanged: (value) {},
                  fcValidator: (value) {
                    String valor = value.toString();
                    if (valor.isEmpty) {
                      return "Ingresar email";
                    }

                    return null;
                  },
                  decoration: CustomInputDecoration.inputDecorationDefault(
                    prefixIcon: const Icon(
                      Icons.person,
                      color: Colors.grey,
                    ),
                  ),
                ),
                InputTextGroup(
                  title: "Contraseña",
                  controller: txtPassword,
                  fcChanged: (String value) {
                    setState(() {
                      if (value.isEmpty) {
                        isVisible = true;
                      } else {
                        isVisible = false;
                      }
                    });
                  },
                  fcValidator: (value) {
                    String valor = value.toString();
                    if (valor.isEmpty) {
                      return "Ingresar contraseña";
                    }

                    return null;
                  },
                  decoration: CustomInputDecoration.inputDecorationDefault(
                    prefixIcon: const Icon(
                      Icons.key,
                      color: Colors.grey,
                    ),
                    suffixIcon: Visibility(
                      visible: isVisible,
                      child: InkWell(
                        onTap: () => setState(() {
                          isPassword = !isPassword;
                        }),
                        child: const Icon(
                          Icons.remove_red_eye_rounded,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ),
                  isPassword: isPassword,
                ),
                SizedBox(height: size.height * .05),
                CustomButton1(
                  title: "INGRESAR AL SISTEMA",
                  fcPressed: () {
                    if (formKey.currentState!.validate()) {
                      provider.login(txtEmail.text, txtPassword.text);
                    }
                  },
                  estado: false,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  alignment: Alignment.centerRight,
                  child: const Text('Olvidé usuario / contraseña?',
                      style: TextStyle(fontWeight: FontWeight.w500)),
                ),
                _divider(),
                _facebookButton(),
                SizedBox(height: size.height * .055),
                _register(),
              ],
            ),
          ),
        ),
        Positioned(
            top: 40,
            left: 0,
            child: CustomButton.backButton(Flurorouter.rootRoute)),
      ],
    );
  }

  Widget _divider() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: const Row(
        children: <Widget>[
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 1,
              ),
            ),
          ),
          Text('o'),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                thickness: 1,
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
    );
  }

  Widget _facebookButton() {
    return Container(
      height: 50,
      margin: const EdgeInsets.symmetric(vertical: 20),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xff1959a9),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(5),
                    topLeft: Radius.circular(5)),
              ),
              alignment: Alignment.center,
              child: const Text('f',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w400)),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xff2872ba),
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(5),
                    topRight: Radius.circular(5)),
              ),
              alignment: Alignment.center,
              child: const Text('Iniciar con Facebook',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w400)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _register() {
    return InkWell(
      onTap: () {
        /* Navigator.push(
            context, MaterialPageRoute(builder: (context) => SignUpPage())); */
        NavigationService.replaceTo(Flurorouter.rootRoute);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 20),
        padding: const EdgeInsets.all(15),
        alignment: Alignment.bottomCenter,
        // ignore: prefer_const_constructors
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text(
              'No tengo una cuenta?',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Registrarte',
              style: TextStyle(
                  color: Color(0xfff79c4f),
                  fontSize: 13,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
