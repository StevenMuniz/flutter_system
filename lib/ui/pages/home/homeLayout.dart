import 'dart:ui';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:app_system/domain/providers/init.dart';
import 'package:app_system/ui/pages/home/signInMobile.dart';
import 'package:app_system/ui/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../utils/constants.dart';
import '../widgets/menu_item.dart';

class HomeLayout extends HookConsumerWidget {
  final Widget child;
  const HomeLayout({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;

    Widget desktopHome() {
      return Stack(
        children: [
          Container(
            padding: const EdgeInsets.only(
              top: 50.0,
              bottom: 50.0,
              left: /*isMobil ? 10 :*/ 120.0,
              right: 120.0,
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: const ExactAssetImage("assets/images/fondo.jpg"),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.9), BlendMode.dstATop),
              ),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 4.0, sigmaY: 5.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40.0),
                ),
                elevation: 25,
                shadowColor: Colors.white,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: Container(
                        height: size.height,
                        decoration: const BoxDecoration(
                          color: bgColor,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            bottomLeft: Radius.circular(30),
                          ),
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            stops: [0, 0.2, 0.5, 0.8],
                            colors: [
                              Color.fromARGB(255, 51, 37, 58),
                              Color.fromARGB(255, 88, 70, 97),
                              Color(0xFF212332),
                              Color.fromARGB(255, 57, 60, 80),
                            ],
                            tileMode: TileMode.repeated,
                          ),
                        ),
                        child: Stack(
                          alignment: AlignmentDirectional.center,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Sistema Contable",
                                  style: GoogleFonts.badScript(
                                    textStyle: const TextStyle(
                                      color: Colors.white,
                                      letterSpacing: .5,
                                      fontSize: 35,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                const Image(
                                  image: AssetImage(
                                      "assets/images/illustration-1.png"),
                                  width: 150,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 20),
                                  child: AnimatedTextKit(
                                      totalRepeatCount: 5,
                                      pause: const Duration(milliseconds: 3000),
                                      displayFullTextOnTap: true,
                                      stopPauseOnTap: true,
                                      animatedTexts: [
                                        TyperAnimatedText(
                                          'Registrate, en caso de no posee una cuenta.',
                                          textStyle:
                                              h3.copyWith(color: Colors.white),
                                        ),
                                        TyperAnimatedText(
                                          'En caso de perdida de información, contactarse con un administrador.',
                                          textStyle:
                                              h3.copyWith(color: Colors.white),
                                        ),
                                        TyperAnimatedText(
                                          'Cuida tus contraseñas, no las compartas con nadie.',
                                          textStyle:
                                              h3.copyWith(color: Colors.white),
                                        ),
                                      ]),
                                ),
                              ],
                            ),
                            Positioned(
                              bottom: 5,
                              right: 5,
                              child: Text("Code1011101 © 2023",
                                  style: h5.copyWith(color: Colors.white)),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: child,
                    ),
                  ],
                ),
              ),
            ),
          ),
          const Positioned(
            right: 10,
            bottom: 5,
            child: Text(
              "version 0.1",
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Positioned(
            left: 10,
            right: 10,
            top: 5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    MenuItemsp(
                      text: 'Contáctanos'.toUpperCase(),
                      isActive: true,
                      onPressed: () {},
                    )
                  ],
                ),
                Row(
                  children: [
                    MenuItemsp(
                      text: 'Sesión'.toUpperCase(),
                      isActive: false,
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      );
    }

    return Scaffold(
      key: ref.watch(providerHome).scaffoldKey,
      body: Responsive(
        mobile: const SignInMobile(),
        desktop: desktopHome(),
      ),
    );
  }
}
