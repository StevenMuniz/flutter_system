import 'package:fluro/fluro.dart';

import 'handlers.dart';

class Flurorouter {
  static final FluroRouter router = FluroRouter();
  //HOME
  static String rootRoute = '/';
  static String signUp = '/signUp';
  static String dashboard = '/dashboard';

  //

  static void configureRoutes() {
    router.define(rootRoute,
        handler: Handlers.signIn, transitionType: TransitionType.inFromLeft);
    router.define(signUp,
        handler: Handlers.signUp, transitionType: TransitionType.inFromRight);
    router.define(dashboard,
        handler: Handlers.dashboard,
        transitionType: TransitionType.inFromRight);
  }
}
