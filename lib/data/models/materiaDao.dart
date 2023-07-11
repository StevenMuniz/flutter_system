import 'dart:convert';

class MateriaDao {
    String codMat;
    String nomMat;
    DateTime fecIng;
    String stsMat;

    MateriaDao({
        required this.codMat,
        required this.nomMat,
        required this.fecIng,
        required this.stsMat,
    });

    factory MateriaDao.fromJson(String str) => MateriaDao.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory MateriaDao.fromMap(Map<String, dynamic> json) => MateriaDao(
        codMat: json["codMat"],
        nomMat: json["nomMat"],
        fecIng: DateTime.parse(json["fecIng"]),
        stsMat: json["stsMat"],
    );

    Map<String, dynamic> toMap() => {
        "codMat": codMat,
        "nomMat": nomMat,
        "fecIng": fecIng.toIso8601String(),
        "stsMat": stsMat,
    };



     @override
  String toString() {
    
    return nomMat;
  
}
}