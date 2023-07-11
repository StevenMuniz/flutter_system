// ignore_for_file: non_constant_identifier_names, prefer_typing_uninitialized_variables

import 'package:app_system/domain/providers/homeController.dart';
import 'package:app_system/ui/services/di.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final providerHome = ChangeNotifierProvider((_) => HomeController(getIt()));
