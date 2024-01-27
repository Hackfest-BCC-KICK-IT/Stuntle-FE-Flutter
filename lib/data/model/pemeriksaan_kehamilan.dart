class PemeriksaanPrenangcy {
  int? id;
  String? tanggalPemeriksaan;
  String? tempatPemeriksaan;
  String? namaPemeriksa;
  int? usiaKandungan;
  String? tekananDarah;
  double? beratBadanIbu;
  String? statusKehamilan;
  String? pesanTambahan;
  int? fkOrtuId;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;
  int? fkFaskesId;
  int? fkDataKehamilan;

  PemeriksaanPrenangcy({
    this.id,
    this.tanggalPemeriksaan,
    this.tempatPemeriksaan,
    this.namaPemeriksa,
    this.usiaKandungan,
    this.tekananDarah,
    this.beratBadanIbu,
    this.statusKehamilan,
    this.pesanTambahan,
    this.fkOrtuId,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.fkFaskesId,
    this.fkDataKehamilan,
  });

  factory PemeriksaanPrenangcy.fromJson(Map<String, dynamic> json) =>
      PemeriksaanPrenangcy(
        id: json["id"],
        tanggalPemeriksaan: json["tanggalPemeriksaan"],
        tempatPemeriksaan: json["tempatPemeriksaan"],
        namaPemeriksa: json["namaPemeriksa"],
        usiaKandungan: json["usiaKandungan"],
        tekananDarah: json["tekananDarah"],
        beratBadanIbu: json["beratBadanIbu"],
        statusKehamilan: json["statusKehamilan"],
        pesanTambahan: json["pesanTambahan"],
        fkOrtuId: json["fkOrtuId"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        deletedAt: json["deletedAt"],
        fkFaskesId: json["fkFaskesId"],
        fkDataKehamilan: json["fkDataKehamilan"],
      );
}
