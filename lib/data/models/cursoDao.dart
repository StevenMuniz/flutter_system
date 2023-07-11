import 'dart:convert';

class CursoDao {
  CursoDao({
    required this.codCur,
    required this.nomCur,
    required this.fecCur,
    required this.estCur,
  });

  String codCur;
  String nomCur;
  DateTime fecCur;
  String estCur;

  factory CursoDao.fromJson(String str) => CursoDao.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CursoDao.fromMap(Map<String, dynamic> json) => CursoDao(
        codCur: json["codCur"],
        nomCur: json["nomCur"],
        fecCur: DateTime.parse(json["fecCur"]),
        estCur: json["estCur"],
      );

  Map<String, dynamic> toMap() => {
        "codCur": codCur,
        "nomCur": nomCur,
        "fecCur": fecCur.toIso8601String(),
        "estCur": estCur,
      };
}
