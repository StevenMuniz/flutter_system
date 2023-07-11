import 'dart:convert';

class PermisosDao {
  PermisosDao({
    required this.codPry,
    required this.nomPry,
    required this.clsPry,
    required this.clxPry,
    required this.urlPry,
    required this.desPry,
    required this.stsPry,
    required this.iconPry,
    required this.perAcc,
  });

  final String codPry;
  final String nomPry;
  final String clsPry;
  final String clxPry;
  final String urlPry;
  final String desPry;
  final String stsPry;
  final String iconPry;
  final String perAcc;

  factory PermisosDao.fromJson(String str) =>
      PermisosDao.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PermisosDao.fromMap(Map<String, dynamic> json) => PermisosDao(
        codPry: json["codPry"],
        nomPry: json["nomPry"],
        clsPry: json["clsPry"],
        clxPry: json["clxPry"],
        urlPry: json["urlPry"],
        desPry: json["desPry"],
        stsPry: json["stsPry"],
        iconPry: json["iconPry"],
        perAcc: json["per_acc"],
      );

  Map<String, dynamic> toMap() => {
        "codPry": codPry,
        "nomPry": nomPry,
        "clsPry": clsPry,
        "clxPry": clxPry,
        "urlPry": urlPry,
        "desPry": desPry,
        "stsPry": stsPry,
        "iconPry": iconPry,
        "per_acc": perAcc,
      };
}
