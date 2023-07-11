import 'package:app_system/data/models/authenticationDao.dart';
import 'package:app_system/data/models/permisosDao.dart';
import 'package:app_system/domain/repositories/irepository_api.dart';
import 'package:app_system/ui/routes/fluroRouter.dart';
import 'package:app_system/ui/services/local_storage.dart';
import 'package:app_system/ui/utils/util.dart';
import 'package:flutter/material.dart';

enum AuthStatus { checking, authenticated, notAuthenticated }

class HomeController extends ChangeNotifier {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late bool enableItems = true;
  late AuthStatus authStatus;
  String currentPage = '/';
  final IrepositoryApi _irepositoryApi;
  //
  AuthenticationDao? authDto;
  late List<PermisosDao> permisosModulo;
  late List<PermisosDao> permisosMenu;
  late List<PermisosDao> permisosItem;

  GlobalKey<ScaffoldState> get scaffoldKey => _scaffoldKey;

  HomeController(this._irepositoryApi) {
    isAuthenticated();
  }
  void controlMenu() {
    if (!_scaffoldKey.currentState!.isDrawerOpen) {
      _scaffoldKey.currentState!.openDrawer();
    }
  }

  Future<void> isAuthenticated() async {
    final email = LocalStorage.prefs.getString('a1');
    final password = LocalStorage.prefs.getString('a2');
    if (email == null && password == null) {
      authStatus = AuthStatus.notAuthenticated;
    } else {
      authStatus = AuthStatus.checking;
      login(email!, password!);
    }
  }

  Future<bool> login(String email, String password) async {
    try {
      authDto = await _irepositoryApi.getAllLogin(email, password);
      if (authDto != null) {
        final permisos = await _irepositoryApi.permisos(
          authDto!.usuario.codEmp,
          authDto!.usuario.codUsr,
          authDto!.usuario.rolUsr,
          Util.plataform(),
        );
        permisosModulo =
            permisos.where((element) => element.codPry.length == 2).toList();

        permisosMenu =
            permisos.where((element) => element.codPry.length == 4).toList();

        permisosItem =
            permisos.where((element) => element.codPry.length == 6).toList();
        authStatus = authDto != null && permisos.isNotEmpty
            ? AuthStatus.authenticated
            : AuthStatus.notAuthenticated;
        LocalStorage.createCache(email, password);
        currentPage = Flurorouter.dashboard;
        notifyListeners();
        return true;
      } else {
        Util.messageDanger("email/contraseña incorrecto");
        authStatus = AuthStatus.notAuthenticated;
        return false;
      }
    } catch (e) {
      Util.messageDanger('Error: $e');
      return false;
    }
  }
}
