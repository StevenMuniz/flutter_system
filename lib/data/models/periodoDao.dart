import 'dart:convert';

class PeriodoDao {
    String codPrd;
    String nomPrd;
    DateTime fecPrd;
    String estPrd;

    PeriodoDao({
        required this.codPrd,
        required this.nomPrd,
        required this.fecPrd,
        required this.estPrd,
    });

    factory PeriodoDao.fromJson(String str) => PeriodoDao.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory PeriodoDao.fromMap(Map<String, dynamic> json) => PeriodoDao(
        codPrd: json["codPrd"],
        nomPrd: json["nomPrd"],
        fecPrd: DateTime.parse(json["fecPrd"]),
        estPrd: json["estPrd"],
    );

    Map<String, dynamic> toMap() => {
        "codPrd": codPrd,
        "nomPrd": nomPrd,
        "fecPrd": fecPrd.toIso8601String(),
        "estPrd": estPrd,
    };


    @override
  String toString() {
    
    return nomPrd;
  }
}