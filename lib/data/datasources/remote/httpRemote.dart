import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart';
import 'package:app_system/data/models/ag0054aDao.dart';
import 'package:app_system/data/models/authenticationDao.dart';
import 'package:app_system/data/models/cursoDao.dart';
import 'package:app_system/data/models/materiaDao.dart';
import 'package:app_system/data/models/materiacursoDao.dart';
import 'package:app_system/data/models/mg0032Dao.dart';
import 'package:app_system/data/models/periodoDao.dart';
import 'package:app_system/data/models/permisosDao.dart';
import 'package:app_system/data/models/responseDao.dart';
import 'package:app_system/data/datasources/remote/iremote.dart';

class HttpRemote extends Iremote {
  final String _baseUrl = "192.168.100.92:8080";
  final String _path = '/twtEscolar';
  final Client _client;

  HttpRemote(this._client);

  @override
  Future<AuthenticationDao?> login(String email, String password) async {
    try {
      var url = Uri.http(_baseUrl, '$_path/auth/login',
          {'email': email, 'password': password});
      final response = await _client.get(url);
      final dao = ResponseDao.fromJson(utf8.decode(response.bodyBytes));
      if (dao.code == 200) {
        final auth = AuthenticationDao.fromMap(dao.data);
        return auth;
      } else {
        return null;
      }
    } catch (e) {
      throw ('Error, $e');
    }
  }

  @override
  Future<List<PermisosDao>> permisos(
      String cod_emp, String cod_usr, String rol, String ambiente) async {
    try {
      List<PermisosDao> list = [];
      var url = Uri.http(_baseUrl, '$_path/auth/permisos', {
        'cod_emp': cod_emp,
        'cod_user': cod_usr,
        'rol': rol,
        'ambiente': ambiente,
      });
      final response = await _client.get(url);
      ResponseDao dao = ResponseDao.fromJson(utf8.decode(response.bodyBytes));
      if (dao.code == 200) {
        list = dao.data
            .map<PermisosDao>((json) => PermisosDao.fromMap(json))
            .toList();
      }
      return list;
    } catch (e) {
      throw ('Error, $e');
    }
  }

  @override
  Future<List<CursoDao>> getAllCurso() async {
    try {
      List<CursoDao> list = [];
      var url = Uri.http(_baseUrl, '$_path/cursos/getAll');
      final response = await _client.get(url);
      ResponseDao dao = ResponseDao.fromJson(utf8.decode(response.bodyBytes));
      if (dao.code == 200) {
        list =
            dao.data.map<CursoDao>((json) => CursoDao.fromMap(json)).toList();
      }
      return list;
    } catch (e) {
      throw ('Error, $e');
    }
  }

  @override
  Future<String> addCurso(CursoDao curso) async {
    try {
      var url = Uri.http(_baseUrl, '$_path/cursos/add');
      final response = await _client.post(
        url,
        body: curso.toJson(),
        headers: {
          "Content-type": "application/json;charset=UTF-8",
        },
      );
      ResponseDao dao = ResponseDao.fromJson(utf8.decode(response.bodyBytes));
      if (dao.code == 200) {
        return dao.data.toString();
      }
      return '';
    } catch (e) {
      throw ('Error, $e');
    }
  }

  @override
  Future<String> editCurso(CursoDao curso) async {
    try {
      var url = Uri.http(_baseUrl, '$_path/cursos/add');
      final response = await _client.put(
        url,
        body: curso.toJson(),
        headers: {
          "Content-type": "application/json;charset=UTF-8",
        },
      );
      ResponseDao dao = ResponseDao.fromJson(utf8.decode(response.bodyBytes));
      if (dao.code == 200) {
        return dao.data.toString();
      }
      return '';
    } catch (e) {
      throw ('Error, $e');
    }
  }

  //Periodo

  @override
  Future<List<PeriodoDao>> getAllPeriodo() async {
    try {
      List<PeriodoDao> list = [];
      var url = Uri.http(_baseUrl, '$_path/periodos/getAll');
      final response = await _client.get(url);
      ResponseDao dao = ResponseDao.fromJson(utf8.decode(response.bodyBytes));
      if (dao.code == 200) {
        list = dao.data
            .map<PeriodoDao>((json) => PeriodoDao.fromMap(json))
            .toList();
      }
      return list;
    } catch (e) {
      throw ('Error, $e');
    }
  }

  //Materia

  @override
  Future<List<MateriaDao>> getAllMateria() async {
    try {
      List<MateriaDao> list = [];
      var url = Uri.http(_baseUrl, '$_path/materias/getAll');
      final response = await _client.get(url);
      ResponseDao dao = ResponseDao.fromJson(utf8.decode(response.bodyBytes));
      if (dao.code == 200) {
        list = dao.data
            .map<MateriaDao>((json) => MateriaDao.fromMap(json))
            .toList();
      }
      return list;
    } catch (e) {
      throw ('Error, $e');
    }
  }

  //Mg0032

  @override
  Future<List<Mg0032Dao>> getAllPersona(String e) async {
    try {
      List<Mg0032Dao> list = [];

      var url = Uri.http(_baseUrl, '$_path/mg0032/getAllRol', {'rol': e});
      final response = await _client.get(url);
      ResponseDao dao = ResponseDao.fromJson(utf8.decode(response.bodyBytes));
      if (dao.code == 200) {
        list =
            dao.data.map<Mg0032Dao>((json) => Mg0032Dao.fromMap(json)).toList();
      }
      return list;
    } catch (e) {
      throw ('Error, $e');
    }
  }

  @override
  Future<List<Mg0032Dao>> getAllMg0032() async {
    try {
      List<Mg0032Dao> list = [];
      var url = Uri.http(_baseUrl, '$_path/mg0032/getAll');
      final response = await _client.get(url);
      ResponseDao dao = ResponseDao.fromJson(utf8.decode(response.bodyBytes));
      if (dao.code == 200) {
        list =
            dao.data.map<Mg0032Dao>((json) => Mg0032Dao.fromMap(json)).toList();
      }
      return list;
    } catch (e) {
      throw ('Error, $e');
    }
  }

  @override
  Future<String> addMg0032(Mg0032Dao mg0032Dao) async {
    try {
      var url = Uri.http(_baseUrl, '$_path/mg0032/add');
      final response = await _client.post(
        url,
        body: mg0032Dao.toJson(),
        headers: {
          "Content-type": "application/json;charset=UTF-8",
        },
      );
      ResponseDao dao = ResponseDao.fromJson(utf8.decode(response.bodyBytes));
      if (dao.code == 200) {
        return dao.data.toString();
      }
      return '';
    } catch (e) {
      throw ('Error, $e');
    }
  }

  @override
  Future<String> consultarMg0032(Mg0032Dao mg0032dao) async {
    try {
      var url = Uri.http(_baseUrl, '$_path/mg0032/add');
      final response = await _client.post(
        url,
        body: mg0032dao.toJson(),
        headers: {
          "Content-type": "application/json;charset=UTF-8",
        },
      );
      ResponseDao dao = ResponseDao.fromJson(utf8.decode(response.bodyBytes));
      if (dao.code == 200) {
        return dao.data.toString();
      }
      return '';
    } catch (e) {
      throw ('Error, $e');
    }
  }

  @override
  Future<String> editMg0032(Mg0032Dao mg0032Dao) async {
    try {
      var url = Uri.http(_baseUrl, '$_path/mg0032/add');
      final response = await _client.put(
        url,
        body: mg0032Dao.toJson(),
        headers: {
          "Content-type": "application/json;charset=UTF-8",
        },
      );
      ResponseDao dao = ResponseDao.fromJson(utf8.decode(response.bodyBytes));
      if (dao.code == 200) {
        return dao.data.toString();
      }
      return '';
    } catch (e) {
      throw ('Error, $e');
    }
  }

  //MateriaCurso
  @override
  Future<List<MateriaCursoDao>> getAllMateriaCurso() async {
    try {
      List<MateriaCursoDao> list = [];
      var url = Uri.http(_baseUrl, '$_path/matcur/getAll');
      final response = await _client.get(url);
      ResponseDao dao = ResponseDao.fromJson(utf8.decode(response.bodyBytes));
      if (dao.code == 200) {
        list = dao.data
            .map<MateriaCursoDao>((json) => MateriaCursoDao.fromMap(json))
            .toList();
      }
      return list;
    } catch (e) {
      throw ('Error, $e');
    }
  }

//ag0054

/*Future<Ag0054ADao> getArch(String cadena) async {
   var url = Uri.http(_baseUrl, '$_path/ag0054a/getAll');

    try {
      final respuesta = await _client.get(url);
      if (respuesta.statusCode == 200) {
        return respuesta.bodyBytes;
      } else {
        throw Exception(respuesta.body);
      }
    } catch (e) {
      throw ('$e');
    }
  }*/

  @override
  Future<List<Ag0054ADao>> getAllAg0054A(ByteData a, String e) async {
    try {
      List<Ag0054ADao> list = [];
      var url = Uri.http(_baseUrl, '$_path/ag0054a/getAll');
      final response = await _client.get(url);
      ResponseDao dao = ResponseDao.fromJson(utf8.decode(response.bodyBytes));
      if (dao.code == 200) {
        list = dao.data
            .map<Ag0054ADao>((json) => Ag0054ADao.fromMap(json))
            .toList();
      }
      return list;
    } catch (e) {
      throw ('Error, $e');
    }
  }
}
