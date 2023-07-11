import 'dart:convert';

class UsuarioDao {
  UsuarioDao({
    required this.codEmp,
    required this.codUsr,
    required this.nomUsr,
    required this.clvUsr,
    required this.ctaUsr,
    required this.nicUsr,
    required this.corUsr,
    required this.celUsr,
    required this.rolUsr,
    required this.clsUsr,
    required this.fexUsr,
    required this.stsUsr,
  });

  final String codEmp;
  final String codUsr;
  final String nomUsr;
  final String clvUsr;
  final dynamic ctaUsr;
  final String nicUsr;
  final String corUsr;
  final String celUsr;
  final String rolUsr;
  final String clsUsr;
  final DateTime fexUsr;
  final String stsUsr;

  factory UsuarioDao.fromJson(String str) => UsuarioDao.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UsuarioDao.fromMap(Map<String, dynamic> json) => UsuarioDao(
        codEmp: json["codEmp"],
        codUsr: json["codUsr"],
        nomUsr: json["nomUsr"],
        clvUsr: json["clvUsr"],
        ctaUsr: json["ctaUsr"],
        nicUsr: json["nicUsr"],
        corUsr: json["corUsr"],
        celUsr: json["celUsr"],
        rolUsr: json["rolUsr"],
        clsUsr: json["clsUsr"],
        fexUsr: DateTime.parse(json["fexUsr"]),
        stsUsr: json["stsUsr"],
      );

  Map<String, dynamic> toMap() => {
        "codEmp": codEmp,
        "codUsr": codUsr,
        "nomUsr": nomUsr,
        "clvUsr": clvUsr,
        "ctaUsr": ctaUsr,
        "nicUsr": nicUsr,
        "corUsr": corUsr,
        "celUsr": celUsr,
        "rolUsr": rolUsr,
        "clsUsr": clsUsr,
        "fexUsr": fexUsr.toIso8601String(),
        "stsUsr": stsUsr,
      };
}
