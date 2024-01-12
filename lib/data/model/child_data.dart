class Child {
  String namaAnak;
  String tanggalLahirAnak;
  String jenisKelamin;
  String kondisiLahir;
  double beratBadanLahir;
  double panjangBadanLahir;
  double lingkarKepala;

  Child({
    required this.namaAnak,
    required this.tanggalLahirAnak,
    required this.jenisKelamin,
    required this.kondisiLahir,
    required this.beratBadanLahir,
    required this.panjangBadanLahir,
    required this.lingkarKepala,
  });

  factory Child.fromJson(Map<String, dynamic> json) => Child(
        namaAnak: json["namaAnak"],
        tanggalLahirAnak: json["tanggalLahirAnak"],
        jenisKelamin: json["jenisKelamin"],
        kondisiLahir: json["kondisiLahir"],
        beratBadanLahir: json["beratBadanLahir"],
        panjangBadanLahir: json["panjangBadanLahir"],
        lingkarKepala: json["lingkarKepala"],
      );

  Map<String, dynamic> toJson() => {
        "namaAnak": namaAnak,
        "tanggalLahirAnak": tanggalLahirAnak,
        "jenisKelamin": jenisKelamin,
        "kondisiLahir": kondisiLahir,
        "beratBadanLahir": beratBadanLahir,
        "panjangBadanLahir": panjangBadanLahir,
        "lingkarKepala": lingkarKepala,
      };
}

List<Child> userChidlData = [];
