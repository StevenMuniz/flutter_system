import 'dart:convert';

class MateriaCursoDao {
    String codPrd;
    String codMat;
    String codCur;

    MateriaCursoDao({
        required this.codPrd,
        required this.codMat,
        required this.codCur,
    });

    factory MateriaCursoDao.fromJson(String str) => MateriaCursoDao.fromJson(json.decode(str));

    String toJson() => json.encode(toJson());

    factory MateriaCursoDao.fromMap(Map<String, dynamic> json) => MateriaCursoDao(
        codPrd: json["codPrd"],
        codMat: json["codMat"],
        codCur: json["codCur"],
    );

    Map<String, dynamic> toMap() => {
        "codPrd": codPrd,
        "codMat": codMat,
        "codCur": codCur,
    };

  @override
  String toString() {
    
    return codPrd;
  
}

}
