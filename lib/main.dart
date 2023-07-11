// ignore_for_file: unused_local_variable

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:app_system/domain/providers/homeController.dart';
import 'package:app_system/domain/providers/init.dart';
import 'package:app_system/ui/pages/home/dashboardLayout.dart';
import 'package:app_system/ui/pages/home/homeLayout.dart';
import 'package:app_system/ui/pages/home/splash_layout.dart';
import 'package:app_system/ui/routes/fluroRouter.dart';
import 'package:app_system/ui/routes/navigationService.dart';
import 'package:app_system/ui/services/di.dart';
import 'package:app_system/ui/services/notificationsService.dart';
import 'package:app_system/ui/services/local_storage.dart';
import 'package:app_system/domain/providers/logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'ui/utils/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorage.configurePrefs();
  await initializeDI();
  Flurorouter.configureRoutes();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(ProviderScope(observers: [Logger()], child: const MyApp()));
}

class MyApp extends HookConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AdaptiveTheme(
      light: ThemeData.light().copyWith(
        //useMaterial3: true,
        scaffoldBackgroundColor: creamColor,
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
            .apply(bodyColor: Colors.black),
        canvasColor: snowColor,
      ),
      dark: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: bgColor,
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
            .apply(bodyColor: Colors.white),
        canvasColor: secondaryColor,
      ),
      initial: AdaptiveThemeMode.light,
      builder: (theme, darkTheme) => MaterialApp(
        title: 'SISTEMA',
        theme: theme,
        darkTheme: darkTheme,
        themeMode: ThemeMode.system,
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        onGenerateRoute: Flurorouter.router.generator,
        navigatorKey: NavigationService.navigatorKey,
        scaffoldMessengerKey: NotificationsService.messengerKey,
        builder: (context, child) {
          final provider = ref.watch<HomeController>(providerHome);

          if (provider.authStatus == AuthStatus.authenticated) {
            return DashboardLayout(child: child!);
          } else if (provider.authStatus == AuthStatus.checking) {
            return const SplashLayout();
          } else {
            return HomeLayout(child: child!);
          }
        },
      ),
    );
    /* return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SISTEMA',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: bgColor,
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
            .apply(bodyColor: Colors.white),
        canvasColor: secondaryColor,
        //useMaterial3: true,
      ),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => HomeController()),
        ],
        child: MainScreen(),
      ),
    ); */
  }
}
