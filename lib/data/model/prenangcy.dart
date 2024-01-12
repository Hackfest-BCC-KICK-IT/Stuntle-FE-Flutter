class Prenangcy {
  int? id;
  String? namaCalonBayi;
  String? tanggalPertamaHaid;

  Prenangcy({
    this.id,
    this.namaCalonBayi,
    this.tanggalPertamaHaid,
  });

  factory Prenangcy.fromJson(Map<String, dynamic> json) => Prenangcy(
        id: json["id"],
        namaCalonBayi: json["namaCalonBayi"],
        tanggalPertamaHaid: json["tanggalPertamaHaid"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "namaCalonBayi": namaCalonBayi,
        "tanggalPertamaHaid": tanggalPertamaHaid ?? DateTime.now()
      };
}
