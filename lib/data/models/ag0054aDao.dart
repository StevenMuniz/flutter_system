import 'dart:convert';

import 'package:app_system/data/datasources/remote/httpRemote.dart';

class Ag0054ADao {
  String codUsr;
  String nombArc;
  String extArc;
  String tamArc;
  late HttpRemote httpRemote;
  Ag0054ADao({
    required this.codUsr,
    required this.nombArc,
    required this.extArc,
    required this.tamArc,
  });

  factory Ag0054ADao.fromJson(String str) =>
      Ag0054ADao.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Ag0054ADao.fromMap(Map<String, dynamic> json) => Ag0054ADao(
        codUsr: json["codUsr"],
        nombArc: json["nombArc"],
        extArc: json["extArc"],
        tamArc: json["tamArc"],
      );

  Map<String, dynamic> toMap() => {
        "codUsr": codUsr,
        "nombArc": nombArc,
        "extArc": extArc,
        "tamArc": tamArc,
      };

/*
 Future formatTxt(String cadena, String tipoDoc) async {
    String aux = "";
    try {
      var spliceOpt = cadena.split("\n");
      spliceOpt.removeAt(spliceOpt.length - 1);
      for (var i = 0; i < spliceOpt.length; i++) {
        if (i >= 2) {
          String cadena = "${spliceOpt[i]}\t${spliceOpt[++i]}";
          final arra_ = cadena.replaceAll("\t\t", "\t").split("\t");
          aux = arra_[8];
          await _validate2(aux, tipoDoc);
        }
      }
    } catch (e) {
      UtilView.messageDanger('$e');
    }
   // notifyListeners();
  }*/

/*

  Future _validate2(String cadena, String tipoDoc) async {
    try {
      final arrayByte = await httpRemote.getAllAg0054A(cadena);
      formatPdf(tipoDoc);
    } catch (e) {
      UtilView.messageDanger('Se');
    }
  }

*/

/*

  void formatPdf(String tipoDoc) {
    String auxCadena = '';
    
      DateTime fecExt = DateTime(1999, 01, 01);
      String estado = '';
      String fdpExt = '';
      bool result = false;
      int contador = 1;
      double base0 = 0.0;
      double base1 = 0.0;
      double ivaExt = 0.0;
      double valorPrima = 0.0;
      String gloExt = '';
      String aux = '<comprobante>';

 


  }
*/
}
