import 'package:app_system/data/datasources/local/ilocal.dart';
import 'package:app_system/data/models/authenticationDao.dart';

class SqliteLocal extends Ilocal {
  //final Database _db;

  SqliteLocal();

  @override
  Future<void> addAuth(AuthenticationDao auth) async {
    /* final stmt = _db.prepare('INSERT INTO auth VALUES (?,?,?)');
    stmt.execute(
        [auth.usuario.codUsr, auth.usuario.corUsr, auth.usuario.clvUsr]);
    stmt.dispose();

    final ResultSet resultSet = _db.select('SELECT * FROM auth');

    // You can iterate on the result set in multiple ways to retrieve Row objects
    // one by one.
    for (final Row row in resultSet) {
      print('id:${row['id']}, email: ${row['email']}]');
    } */
  }
}
