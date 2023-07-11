import 'dart:convert';

class ResponseDao {
  ResponseDao({
    required this.code,
    required this.msg,
    required this.data,
  });

  final int code;
  final String msg;
  final dynamic data;

  factory ResponseDao.fromJson(String str) =>
      ResponseDao.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ResponseDao.fromMap(Map<String, dynamic> json) => ResponseDao(
        code: json["code"],
        msg: json["msg"],
        data: json["data"],
      );

  Map<String, dynamic> toMap() => {
        "code": code,
        "msg": msg,
        "data": data,
      };
}
