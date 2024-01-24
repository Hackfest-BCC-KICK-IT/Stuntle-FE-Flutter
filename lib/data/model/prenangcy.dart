class Prenangcy {
  int? id;
  String? namaCalonBayi;
  dynamic usiaKehamilan;
  DateTime? tanggalPertamaHaid;
  dynamic prediksiTanggalLahir;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;
  int? fkOrtuId;
  List<dynamic>? fkPemeriksaanIds;
  dynamic namaAyah;
  dynamic namaIbu;

  Prenangcy({
    this.id,
    this.namaCalonBayi,
    this.usiaKehamilan,
    this.tanggalPertamaHaid,
    this.prediksiTanggalLahir,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.fkOrtuId,
    this.fkPemeriksaanIds,
    this.namaAyah,
    this.namaIbu,
  });

  factory Prenangcy.fromJson(Map<String, dynamic> json) => Prenangcy(
        id: json["id"],
        namaCalonBayi: json["namaCalonBayi"],
        usiaKehamilan: json["usiaKehamilan"],
        tanggalPertamaHaid: DateTime.parse(json["tanggalPertamaHaid"]),
        prediksiTanggalLahir: json["prediksiTanggalLahir"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        deletedAt: json["deletedAt"],
        fkOrtuId: json["fkOrtuId"],
        fkPemeriksaanIds:
            List<dynamic>.from(json["fkPemeriksaanIds"].map((x) => x)),
        namaAyah: json["namaAyah"],
        namaIbu: json["namaIbu"],
      );
}
