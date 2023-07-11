import 'package:app_system/ui/pages/home/widgets/dashboardDefault.dart';
import 'package:app_system/ui/pages/home/signIn.dart';
import 'package:app_system/ui/pages/home/signUp.dart';
import 'package:fluro/fluro.dart';

class Handlers {
  static Handler signIn = Handler(handlerFunc: (context, params) {
    //Future.delayed(const Duration(milliseconds: 100), () {});

    return SignIn();
  });

  static Handler signUp = Handler(handlerFunc: (context, params) {
    //Future.delayed(const Duration(milliseconds: 100), () {});
    return const SignUp();
  });

  static Handler dashboard = Handler(handlerFunc: (context, params) {
    //Future.delayed(const Duration(milliseconds: 100), () {});
    return const DashboardDefault();
  });
}
