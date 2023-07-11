import 'dart:io';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Util {
  static String plataform() {
    if (kIsWeb || Platform.isWindows) {
      return 'W';
    } else if (Platform.isWindows) {
      return 'D';
    } else {
      return 'M';
    }
  }

  static messageDanger(String _message) {
    Fluttertoast.showToast(
      msg: _message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 4,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 12,
      webPosition: "center",
      webBgColor: "red",
    );
  }

  static messageAccess(String _message) {
    Fluttertoast.showToast(
      msg: _message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 3,
      backgroundColor: Colors.blueGrey,
      textColor: Colors.white,
      fontSize: 12,
      webPosition: "center",
      webBgColor: 'rgb(46,64,83)',
    );
  }

  static messageWarning(String _message) {
    Fluttertoast.showToast(
      msg: _message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 4,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 12,
      webPosition: "center",
      webBgColor: "orange",
    );
  }

  static List<String> cargos = [
    "ADMINISTRATIVO",
    "DOCENTES",
    "ESTUDIANTES",
  ];

  static List<String> cargosDats = [
    "DATOS GENERALES",
    "DATOS SECUNDARIOS",
    "DOCUMENTOS",
  ];

  static Map<String, ImageIcon> icosDataListass = {
    "DATOS GENERALES": const ImageIcon(AssetImage("assets/documento.png")),
    "DATOS SECUNDARIOS": const ImageIcon(AssetImage("assets/documento.png")),
    "DOCUMENTOS": const ImageIcon(AssetImage("assets/documento.png"))
  };

  static Map<String, Image> icosDataLista = {
    "DATOS GENERALES": Image.asset("assets/documento.png"),
    "DATOS SECUNDARIOS": Image.asset("assets/documento.png"),
    "DOCUMENTOS": Image.asset("assets/documento.png")
  };

  static Map<String, IconData> icosDataList = {
    "DATOS GENERALES": Icons.person_2_outlined,
    "DATOS SECUNDARIOS": Icons.school_outlined,
    "DOCUMENTOS": Icons.file_copy
  };
}
