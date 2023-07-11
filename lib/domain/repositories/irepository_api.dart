import 'package:app_system/data/models/ag0054aDao.dart';
import 'package:app_system/data/models/authenticationDao.dart';
import 'package:app_system/data/models/cursoDao.dart';
import 'package:app_system/data/models/materiaDao.dart';
import 'package:app_system/data/models/materiacursoDao.dart';
import 'package:app_system/data/models/mg0032Dao.dart';
import 'package:app_system/data/models/periodoDao.dart';
import 'package:app_system/data/models/permisosDao.dart';
import 'package:flutter/foundation.dart';

abstract class IrepositoryApi {
// Future<AuthenticationDao?> getAllLogin(String email, String password);
  Future<AuthenticationDao?> getAllLogin(String email, String password);
  Future<List<PermisosDao>> permisos(
      String cod_emp, String cod_usr, String rol, String ambiente);

  //CURSO
  Future<List<CursoDao>> getAllCurso();
  Future<String> addCurso(CursoDao cursoDao);
  Future<String> editCurso(CursoDao cursoDao);

  //PERIODO
  Future<List<PeriodoDao>> getAllPeriodo();
  //MATERIA
  Future<List<MateriaDao>> getAllMateria();
  //MATERIA X CURSO
  Future<List<MateriaCursoDao>> getAllMateriaCurso();
  //Mg0032 puede ser persona
  Future<List<Mg0032Dao>> getAllMg0032User(String name);
  Future<List<Mg0032Dao>> getAllMg0032();
  Future<String> addMg0032(Mg0032Dao mg0032Dao);
  Future<String> editMg0032(Mg0032Dao mg0032Dao);
  //Future<String> getAllMg0032Rol(Mg0032Dao mg0032Dao);

  //USUARIO O PERSONA
  //SERVICIO PERSONA POR ROL
  Future<List> getAllPersona(String e);

  //Ag0054A
  Future<List<Ag0054ADao>> getAllAg0054A(ByteData a, String e);

  //FICHA TECNICA O INSERTAR DATOS PERSONALES O  GENERAL
  //DATOS DEL REPRESENTANTE
}
