import 'dart:typed_data';

import 'package:app_system/data/models/ag0054aDao.dart';
import 'package:app_system/data/models/authenticationDao.dart';
import 'package:app_system/data/models/materiaDao.dart';
import 'package:app_system/data/models/materiacursoDao.dart';
import 'package:app_system/data/models/mg0032Dao.dart';
import 'package:app_system/data/models/permisosDao.dart';

import '../../models/cursoDao.dart';
import '../../models/periodoDao.dart';

abstract class Iremote {
  Future<AuthenticationDao?> login(String email, String password);
  Future<List<PermisosDao>> permisos(
      String cod_emp, String cod_usr, String rol, String ambiente);

  //CURSOS
  Future<List<CursoDao>> getAllCurso();
  Future<String> addCurso(CursoDao dao);
  Future<String> editCurso(CursoDao dao);

//PERIODO
  Future<List<PeriodoDao>> getAllPeriodo();

// Materia
  Future<List<MateriaDao>> getAllMateria();

  // Materia - PERSONA
  Future<List<Mg0032Dao>> getAllMg0032();
  Future<String> addMg0032(Mg0032Dao mg0032Dao);
  Future<String> editMg0032(Mg0032Dao mg0032Dao);
  Future<String> consultarMg0032(Mg0032Dao mg0032dao);

  Future<List<Mg0032Dao>> getAllPersona(String e);

  // MateriaCurso
  Future<List<MateriaCursoDao>> getAllMateriaCurso();

  //ag0054a
  Future<List<Ag0054ADao>> getAllAg0054A(ByteData a, String e);
}
