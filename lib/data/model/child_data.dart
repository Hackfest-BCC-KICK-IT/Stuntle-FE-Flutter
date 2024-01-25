class Child {
  int? id;
  String? namaAnak;
  String? jenisKelamin;
  String? tanggalLahir;
  String? kondisiLahir;
  double? beratBadanLahir;
  double? panjangBadanLahir;
  double? lingkarKepala;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;
  int? fkOrtuId;
  List<int>? fkDataPemeriksaanAnak;
  String? usiaAnak;
  dynamic namaAyah;
  dynamic namaIbu;

  Child({
    this.id,
    this.namaAnak,
    this.jenisKelamin,
    this.tanggalLahir,
    this.kondisiLahir,
    this.beratBadanLahir,
    this.panjangBadanLahir,
    this.lingkarKepala,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.fkOrtuId,
    this.fkDataPemeriksaanAnak,
    this.usiaAnak,
    this.namaAyah,
    this.namaIbu,
  });

  factory Child.fromJson(Map<String, dynamic> json) => Child(
        id: json["id"],
        namaAnak: json["namaAnak"],
        jenisKelamin: json["jenisKelamin"],
        tanggalLahir: json["tanggalLahir"],
        kondisiLahir: json["kondisiLahir"],
        beratBadanLahir: json["beratBadanLahir"],
        panjangBadanLahir: json["panjangBadanLahir"],
        lingkarKepala: json["lingkarKepala"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        deletedAt: json["deletedAt"],
        fkOrtuId: json["fkOrtuId"],
        fkDataPemeriksaanAnak: json["fkDataPemeriksaanAnak"] == null
            ? []
            : List<int>.from(json["fkDataPemeriksaanAnak"]!.map((x) => x)),
        usiaAnak: json["usiaAnak"],
        namaAyah: json["namaAyah"],
        namaIbu: json["namaIbu"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "namaAnak": namaAnak,
        "jenisKelamin": jenisKelamin,
        "tanggalLahir": tanggalLahir,
        "kondisiLahir": kondisiLahir,
        "beratBadanLahir": beratBadanLahir,
        "panjangBadanLahir": panjangBadanLahir,
        "lingkarKepala": lingkarKepala,
        "createdAt":
            "${createdAt!.year.toString().padLeft(4, '0')}-${createdAt!.month.toString().padLeft(2, '0')}-${createdAt!.day.toString().padLeft(2, '0')}",
        "updatedAt":
            "${updatedAt!.year.toString().padLeft(4, '0')}-${updatedAt!.month.toString().padLeft(2, '0')}-${updatedAt!.day.toString().padLeft(2, '0')}",
        "deletedAt": deletedAt,
        "fkOrtuId": fkOrtuId,
        "fkDataPemeriksaanAnak": fkDataPemeriksaanAnak == null
            ? []
            : List<dynamic>.from(fkDataPemeriksaanAnak!.map((x) => x)),
        "usiaAnak": usiaAnak,
        "namaAyah": namaAyah,
        "namaIbu": namaIbu,
      };
}

List<Child> userChidlData = [];
