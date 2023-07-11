import 'dart:convert';

class EmpresaDto {
  EmpresaDto({
    required this.codEmp,
    required this.nomEmp,
    required this.numRuc,
    required this.cl1Emp,
    required this.cl2Emp,
    required this.cl3Emp,
    required this.cl4Emp,
    required this.cl5Emp,
    required this.fexEmp,
    required this.uiaEmp,
  });

  final String codEmp;
  final String nomEmp;
  final String numRuc;
  final String cl1Emp;
  final String cl2Emp;
  final String cl3Emp;
  final String cl4Emp;
  final String cl5Emp;
  final DateTime fexEmp;
  final String uiaEmp;

  factory EmpresaDto.fromJson(String str) => EmpresaDto.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory EmpresaDto.fromMap(Map<String, dynamic> json) => EmpresaDto(
        codEmp: json["codEmp"],
        nomEmp: json["nomEmp"],
        numRuc: json["numRuc"],
        cl1Emp: json["cl1Emp"],
        cl2Emp: json["cl2Emp"],
        cl3Emp: json["cl3Emp"],
        cl4Emp: json["cl4Emp"],
        cl5Emp: json["cl5Emp"],
        fexEmp: DateTime.parse(json["fexEmp"]),
        uiaEmp: json["uiaEmp"],
      );

  Map<String, dynamic> toMap() => {
        "codEmp": codEmp,
        "nomEmp": nomEmp,
        "numRuc": numRuc,
        "cl1Emp": cl1Emp,
        "cl2Emp": cl2Emp,
        "cl3Emp": cl3Emp,
        "cl4Emp": cl4Emp,
        "cl5Emp": cl5Emp,
        "fexEmp":
            "${fexEmp.year.toString().padLeft(4, '0')}-${fexEmp.month.toString().padLeft(2, '0')}-${fexEmp.day.toString().padLeft(2, '0')}",
        "uiaEmp": uiaEmp,
      };
}
