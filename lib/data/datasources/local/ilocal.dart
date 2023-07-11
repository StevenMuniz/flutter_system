import 'package:app_system/data/models/authenticationDao.dart';

abstract class Ilocal {
  Future<void> addAuth(AuthenticationDao auth);
}
