import 'package:app_system/data/datasources/local/ilocal.dart';
import 'package:app_system/data/datasources/local/sqliteLocal.dart';
import 'package:app_system/data/datasources/remote/httpRemote.dart';
import 'package:app_system/data/datasources/remote/iremote.dart';
import 'package:app_system/data/repositories/repositoryApi.dart';
import 'package:app_system/domain/repositories/irepository_api.dart';
import 'package:app_system/ui/utils/util.dart';
import 'package:get_it/get_it.dart';

import 'package:http/http.dart' as http;

final getIt = GetIt.I;

Future<void> initializeDI() async {
  await _data();
  await _domain();
  await _view();
}

/* Future<WasmSqlite3> loadSqlite() async {
  final fs = await IndexedDbFileSystem.open(dbName: "escolar");

  return await WasmSqlite3.loadFromUrl(
    Uri.parse('sqlite.wasm'),
    environment: SqliteEnvironment(fileSystem: fs),
  );
} */

Future<void> _data() async {
  //var db;
  if (Util.plataform() == 'W') {
    //final sqlite = await SqliteWeb.sqliteWebInitF();
    //db = sqlite.open('test.db');
  } else {
    /* Database db = sqlite3.openInMemory();

    db.execute('''
    CREATE TABLE auth(
      id NOT NULL PRIMARY KEY,
      email text,
      password text
    );
    ''');
    // DATA
    getIt.registerSingleton<Local>(SqliteLocal(db)); */
  }
  getIt.registerSingleton<Ilocal>(SqliteLocal());
  getIt.registerSingleton<Iremote>(HttpRemote(http.Client()));
  getIt.registerSingleton<IrepositoryApi>(
      RepositoryApi(getIt.get(), getIt.get()));
}

Future<void> _domain() async {}

Future<void> _view() async {}
