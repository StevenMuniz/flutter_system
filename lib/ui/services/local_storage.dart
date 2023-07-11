import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static late SharedPreferences prefs;

  static Future<void> configurePrefs() async {
    prefs = await SharedPreferences.getInstance();
  }

  static Future<void> createCache(String email, password) async {
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    _preferences.setString('a1', email); //permiso.toMap()
    _preferences.setString('a2', password); //json.encode(password)
    List<String> auths = [email, password];
    _preferences.setStringList("auth", auths);
  }

  /*Future readCache(String permiso) async {
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    var cache = _preferences.getString(permiso);
    // print("2");
    return cache;
  }

  Future removeCache(String permiso) async {
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    _preferences.remove(permiso);
  }

  Future createCacheSingle(String value, String referencia) async {
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    _preferences.setString(referencia, value);
  
  }*/
}
