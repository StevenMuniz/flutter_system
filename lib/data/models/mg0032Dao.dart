import 'dart:convert';

class  Mg0032Dao{
    String codRef;
    String nomRef;
    String codPai;
    String codEst;
    String codCiu;
    String codZon;
    String dirRef;
    String telRef;
    String imgJpg;
    String codAux;
    String nomAux;
    String tipRef;
    String numRef;
    String calCli;
    String calBco;
    String calObr;
    String calPrv;
    DateTime fecRef;
    DateTime fcrRef;

    Mg0032Dao({
        required this.codRef,
        required this.nomRef,
        required this.codPai,
        required this.codEst,
        required this.codCiu,
        required this.codZon,
        required this.dirRef,
        required this.telRef,
        required this.imgJpg,
        required this.codAux,
        required this.nomAux,
        required this.tipRef,
        required this.numRef,
        required this.calCli,
        required this.calBco,
        required this.calObr,
        required this.calPrv,
        required this.fecRef,
        required this.fcrRef,
    });

    factory Mg0032Dao.fromJson(String str) => Mg0032Dao.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Mg0032Dao.fromMap(Map<String, dynamic> json) => Mg0032Dao(
        codRef: json["codRef"],
        nomRef: json["nomRef"],
        codPai: json["codPai"],
        codEst: json["codEst"],
        codCiu: json["codCiu"],
        codZon: json["codZon"],
        dirRef: json["dirRef"],
        telRef: json["telRef"],
        imgJpg: json["imgJpg"],
        codAux: json["codAux"],
        nomAux: json["nomAux"],
        tipRef: json["tipRef"],
        numRef: json["numRef"],
        calCli: json["calCli"],
        calBco: json["calBco"],
        calObr: json["calObr"],
        calPrv: json["calPrv"],
        fecRef: DateTime.parse(json["fecRef"]),
        fcrRef: DateTime.parse(json["fcrRef"]),
    );

    Map<String, dynamic> toMap() => {
        "codRef": codRef,
        "nomRef": nomRef,
        "codPai": codPai,
        "codEst": codEst,
        "codCiu": codCiu,
        "codZon": codZon,
        "dirRef": dirRef,
        "telRef": telRef,
        "imgJpg": imgJpg,
        "codAux": codAux,
        "nomAux": nomAux,
        "tipRef": tipRef,
        "numRef": numRef,
        "calCli": calCli,
        "calBco": calBco,
        "calObr": calObr,
        "calPrv": calPrv,
        "fecRef": "${fecRef.year.toString().padLeft(4, '0')}-${fecRef.month.toString().padLeft(2, '0')}-${fecRef.day.toString().padLeft(2, '0')}",
        "fcrRef": "${fcrRef.year.toString().padLeft(4, '0')}-${fcrRef.month.toString().padLeft(2, '0')}-${fcrRef.day.toString().padLeft(2, '0')}",
    };
}