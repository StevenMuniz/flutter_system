// ignore_for_file: sort_child_properties_last, must_be_immutable, invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member
import 'package:app_system/domain/providers/homeController.dart';
import 'package:app_system/domain/providers/init.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../routes/fluroRouter.dart';
import '../../routes/navigationService.dart';
import '../../utils/constants.dart';
import '../widgets/customButton.dart';
import '../widgets/customInputDecoration.dart';
import '../widgets/customInputText.dart';

class SignIn extends HookConsumerWidget {
  SignIn({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _txtEmail = TextEditingController();
  final _txtPassword = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final provider = ref.watch<HomeController>(providerHome);

    Widget _register() {
      return InkWell(
        onTap: () {
          /*Navigator.push(
              context, MaterialPageRoute(builder: (context) => const SignUp()));*/
          NavigationService.replaceTo(Flurorouter.signUp);
        },
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 20),
          padding: const EdgeInsets.all(15),
          alignment: Alignment.bottomCenter,
          // ignore: prefer_const_constructors
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'No tengo una cuenta?',
                style: h4,
              ),
              const SizedBox(
                width: 10,
              ),
              Tooltip(
                message: "Registrarte",
                child: CircleAvatar(
                  backgroundColor: Colors.black87,
                  child: Text(
                    ">",
                    style: h3.copyWith(color: Colors.yellowAccent),
                  ),
                  radius: 15,
                ),
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
      child: Stack(
        children: [
          Center(
            child: Form(
              key: _formKey,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 48),
                    padding: EdgeInsets.only(
                        top: size.height * 0.05, left: 10, right: 10),
                    width: 300,
                    height: 300,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black38,
                          spreadRadius: 10,
                          blurRadius: 20,
                        ),
                      ],
                    ),
                    child: Column(
                      children: <Widget>[
                        InputTextFloating(
                          controller: _txtEmail,
                          decoration:
                              CustomInputDecoration.defaultInputDecoration(
                                  hint: 'ingresar identificación',
                                  label: 'USUARIO',
                                  icon: Icons.person),
                          fcValidator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return "Ingresar email";
                            }
                            return null;
                          },
                          fcChanged: (value) {},
                        ),
                        SizedBox(height: size.height * .02),
                        InputTextFloating(
                          controller: _txtPassword,
                          decoration:
                              CustomInputDecoration.defaultInputDecoration(
                                  hint: '******',
                                  label: 'PASSWORD',
                                  icon: Icons.password),
                          fcValidator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return "Ingresar contraseña";
                            }

                            return null;
                          },
                          fcChanged: (value) {},
                          isPassword: true,
                        ),
                        SizedBox(height: size.height * .07),
                        CustomButton1(
                          title: "INGRESAR AL SISTEMA",
                          fcPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              final resp = await provider.login(
                                  _txtEmail.text, _txtPassword.text);
                              NavigationService.replaceTo(
                                  resp ? Flurorouter.dashboard : "/");
                            }
                          },
                          estado: false,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          alignment: Alignment.centerRight,
                          child: const Text(
                            'Olvidé usuario / contraseña?',
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 10),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Positioned(
                    top: 0,
                    child: CircleAvatar(
                      radius: 40.0,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        child: Align(
                          alignment: Alignment.bottomRight,
                        ),
                        radius: 37.0,
                        backgroundImage: AssetImage('assets/images/fondo.jpg'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/images/facebook.svg',
                width: 45,
                height: 45,
              ),
              SvgPicture.asset(
                'assets/images/whatsapp.svg',
                width: 45,
                height: 45,
              ),
              SvgPicture.asset(
                'assets/images/instagram.svg',
                width: 45,
                height: 45,
              ),
            ],
          ),
          Positioned(
            bottom: -25,
            right: 20,
            child: _register(),
          ),
          const Positioned(
            top: 10,
            left: 10,
            child: Text(
              "INICIO SESIÓN",
              style: h3,
            ),
          ),
        ],
      ),
    );
  }
}
