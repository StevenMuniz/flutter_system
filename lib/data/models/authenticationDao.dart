import 'dart:convert';

import 'package:app_system/data/models/empresaDto.dart';
import 'package:app_system/data/models/usuarioDao.dart';

class AuthenticationDao {
  AuthenticationDao({
    required this.usuario,
    required this.token,
    required this.empresas,
  });

  final UsuarioDao usuario;
  final String token;
  final List<EmpresaDto> empresas;

  factory AuthenticationDao.fromJson(String str) =>
      AuthenticationDao.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AuthenticationDao.fromMap(Map<String, dynamic> json) =>
      AuthenticationDao(
        usuario: UsuarioDao.fromMap(json["usuario"]),
        token: json["token"],
        empresas: List<EmpresaDto>.from(
            json["empresas"].map((x) => EmpresaDto.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "usuario": usuario.toMap(),
        "token": token,
        "empresas": List<dynamic>.from(empresas.map((x) => x.toMap())),
      };
}
