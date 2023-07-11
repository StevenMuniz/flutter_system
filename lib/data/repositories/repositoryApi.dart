import 'dart:typed_data';

import 'package:app_system/data/datasources/local/ilocal.dart';
import 'package:app_system/data/datasources/remote/iremote.dart';
import 'package:app_system/data/models/ag0054aDao.dart';
import 'package:app_system/data/models/authenticationDao.dart';
import 'package:app_system/data/models/cursoDao.dart';
import 'package:app_system/data/models/materiaDao.dart';
import 'package:app_system/data/models/materiacursoDao.dart';
import 'package:app_system/data/models/mg0032Dao.dart';
import 'package:app_system/data/models/periodoDao.dart';
import 'package:app_system/data/models/permisosDao.dart';

import '../../domain/repositories/irepository_api.dart';

class RepositoryApi extends IrepositoryApi {
  final Iremote _remote;
  final Ilocal _local;
  RepositoryApi(this._remote, this._local);

  @override
  Future<AuthenticationDao?> getAllLogin(String email, String password) async {
    AuthenticationDao? auth = await _remote.login(email, password);
    if (auth != null) {
      _local.addAuth(auth);
    }
    return auth;
  }

  @override
  Future<List<PermisosDao>> permisos(
      String cod_emp, String cod_usr, String rol, String ambiente) async {
    List<PermisosDao> permisos =
        await _remote.permisos(cod_emp, cod_usr, rol, ambiente);
    return permisos;
  }

  @override
  Future<List<CursoDao>> getAllCurso() async {
    List<CursoDao> cursos = await _remote.getAllCurso();
    return cursos;
  }

  @override
  Future<String> addCurso(CursoDao cursoDao) async {
    return _remote.addCurso(cursoDao);
  }

  @override
  Future<String> editCurso(CursoDao cursoDao) async {
    return _remote.addCurso(cursoDao);
  }

  @override
  Future<List<PeriodoDao>> getAllPeriodo() async {
    List<PeriodoDao> periodos = await _remote.getAllPeriodo();
    return periodos;
  }

  //Materia
  @override
  Future<List<MateriaDao>> getAllMateria() async {
    // TODO: implement getAllMateria
    List<MateriaDao> materia = await _remote.getAllMateria();
    return materia;
  }

  //Mg0032
  @override
  Future<List<Mg0032Dao>> getAllMg0032() async {
    // TODO: implement getAllMg0032
    List<Mg0032Dao> mg0032 = await _remote.getAllMg0032();
    return mg0032;
  }

  @override
  Future<String> addMg0032(Mg0032Dao mg0032Dao) {
    // TODO: implement addMg0032
    return _remote.addMg0032(mg0032Dao);
  }

  @override
  Future<String> editMg0032(Mg0032Dao mg0032Dao) {
    // TODO: implement editMg0032
    return _remote.addMg0032(mg0032Dao);
  }

  //MateriaCurso
  @override
  Future<List<MateriaCursoDao>> getAllMateriaCurso() async {
    List<MateriaCursoDao> materiacursoDao = await _remote.getAllMateriaCurso();
    return materiacursoDao;
  }

  @override
  Future<List<Mg0032Dao>> getAllPersona(String e) async {
    List<Mg0032Dao> mg0032 = await _remote.getAllPersona(e);
    return mg0032;
  }

  @override
  Future<List<Mg0032Dao>> getAllMg0032User(String name) async {
    // TODO: implement getAllMg0032User
    List<Mg0032Dao> mg0032Dao = await _remote.getAllMg0032();
    return mg0032Dao;
  }

//ag0054a
  @override
  Future<List<Ag0054ADao>> getAllAg0054A(ByteData a, String e) async {
    // TODO: implement getAllMg0032
    List<Ag0054ADao> ag0054a = await _remote.getAllAg0054A(a, e);
    return ag0054a;
  }
}
