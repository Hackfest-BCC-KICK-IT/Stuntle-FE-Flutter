class PemeriksaanChild {
  int? id;
  String? tanggalPemeriksaan;
  String? tempatPemeriksaan;
  String? namaPemeriksa;
  String? umurAnak;
  double? tinggiAnak;
  double? beratBadanAnak;
  String? statusAnak;
  String? pesanTambahan;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;
  int? fkFaskesId;
  int? fkOrtuId;
  int? fkDataAnak;

  PemeriksaanChild({
    this.id,
    this.tanggalPemeriksaan,
    this.tempatPemeriksaan,
    this.namaPemeriksa,
    this.umurAnak,
    this.tinggiAnak,
    this.beratBadanAnak,
    this.statusAnak,
    this.pesanTambahan,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.fkFaskesId,
    this.fkOrtuId,
    this.fkDataAnak,
  });

  factory PemeriksaanChild.fromJson(Map<String, dynamic> json) =>
      PemeriksaanChild(
        id: json["id"],
        tanggalPemeriksaan: json["tanggalPemeriksaan"],
        tempatPemeriksaan: json["tempatPemeriksaan"],
        namaPemeriksa: json["namaPemeriksa"],
        umurAnak: json["umurAnak"],
        tinggiAnak: json["tinggiAnak"],
        beratBadanAnak: json["beratBadanAnak"],
        statusAnak: json["statusAnak"],
        pesanTambahan: json["pesanTambahan"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        deletedAt: json["deletedAt"],
        fkFaskesId: json["fkFaskesId"],
        fkOrtuId: json["fkOrtuId"],
        fkDataAnak: json["fkDataAnak"],
      );
}
