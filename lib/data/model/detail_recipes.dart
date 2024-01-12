import 'package:flutter/material.dart';

List<Map<String, String>> filterData = [
  {"id": "orang_tua", "value": "Orang Tua"},
  {"id": "bayi_anak", "value": "Bayi & Anak"},
  {"id": "trimester_1", "value": "Trisemester 1"},
  {"id": "trimester_2", "value": "Trisemester 2"},
  {"id": "trimester_3", "value": "Trisemester 3"},
  {"id": "0_3_bulan", "value": "0 - 3 Bulan"},
  {"id": "3_6_bulan", "value": "3 - 6 Bulan"},
  {"id": "6_12_bulan", "value": "6 - 12 Bulan"},
  {"id": "1_tahun", "value": "1 Tahun"},
  {"id": "2_tahun", "value": "2 Tahun"},
  {"id": "sarapan", "value": "Sarapan"},
  {"id": "makan_siang", "value": "Makan Siang"},
  {"id": "makan_malam", "value": "Makan Malam"},
  {"id": "snack_sehat", "value": "Snack Sehat"},
  {"id": "sayuran", "value": "Sayuran"},
  {"id": "buah_buahan", "value": "Buah-Buahan"},
  {"id": "daging_sapi", "value": "Daging Sapi"},
  {"id": "daging_ayam", "value": "Daging Ayam"},
  {"id": "daging_ikan", "value": "Daging Ikan"},
  {"id": "telur", "value": "Telur"},
  {"id": "susu", "value": "Susu"},
  {"id": "lainnya", "value": "Lainnya"},
  {"id": "10_20_menit", "value": "10 - 20 Menit"},
  {"id": "20_30_menit", "value": "20 - 30 Menit"},
  {"id": "30_60_menit", "value": "30 - 60 Menit"},
  {"id": "diatas_60_menit", "value": "Diatas 60 Menit"},
];

String findDataToUser(String searchString) {
  for (var data in filterData) {
    if (data["id"] == searchString) {
      return data["value"]!;
    }
  }
  return "404";
}

class Recepies {
  int id;
  String urlGambar;
  String judulResep;
  String targetResep;
  String targetUsiaResep;
  String jenis;
  String bahanUtama;
  String durasiMemasak;
  String bahanText;
  String caraMembuatText;
  String nilaiGiziText;
  String updatedAt;
  bool isBook;

  Recepies({
    required this.id,
    required this.urlGambar,
    required this.judulResep,
    required this.targetResep,
    required this.targetUsiaResep,
    required this.jenis,
    required this.bahanUtama,
    required this.durasiMemasak,
    required this.bahanText,
    required this.caraMembuatText,
    required this.nilaiGiziText,
    required this.updatedAt,
    required this.isBook,
  });

  factory Recepies.fromJson(Map<String, dynamic> json) => Recepies(
        id: json["id"],
        urlGambar: json["urlGambar"],
        judulResep: json["judulResep"],
        targetResep: json["targetResep"],
        targetUsiaResep: json["targetUsiaResep"],
        jenis: json["jenis"],
        bahanUtama: json["bahanUtama"],
        durasiMemasak: json["durasiMemasak"],
        bahanText: json["bahanText"],
        caraMembuatText: json["caraMembuatText"],
        nilaiGiziText: json["nilaiGiziText"],
        updatedAt: json["updatedAt"],
        isBook: json["isBook"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "urlGambar": urlGambar,
        "judulResep": judulResep,
        "targetResep": targetResep,
        "targetUsiaResep": targetUsiaResep,
        "jenis": jenis,
        "bahanUtama": bahanUtama,
        "durasiMemasak": durasiMemasak,
        "bahanText": bahanText,
        "caraMembuatText": caraMembuatText,
        "nilaiGiziText": nilaiGiziText,
        "updatedAt": updatedAt,
        "isBook": isBook,
      };
}

class TypeRecipes {
  String text;
  Color color;

  TypeRecipes({
    required this.text,
    required this.color,
  });

  factory TypeRecipes.fromJson(Map<String, dynamic> json) {
    return TypeRecipes(
      text: json['text'],
      color: Color(json['color']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'color': color.value,
    };
  }
}

//for favorit user
List<Recepies> favoritRecepies = [];

//for child recepies
List<Recepies> listChildRecepies = [];

//for prenangcy recepies
List<Recepies> listPrenangcyRecepies = [];
