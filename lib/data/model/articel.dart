class Articel {
  int id;
  String publicId;
  String linkGambar;
  String judulArtikel;
  String peninjau;
  String isiText;
  String updatedAt;
  bool isFavorit;

  Articel({
    required this.id,
    required this.publicId,
    required this.linkGambar,
    required this.judulArtikel,
    required this.peninjau,
    required this.isiText,
    required this.updatedAt,
    required this.isFavorit,
  });

  factory Articel.fromJson(Map<String, dynamic> json) => Articel(
        id: json["id"],
        publicId: json["publicId"],
        linkGambar: json["linkGambar"],
        judulArtikel: json["judulArtikel"],
        peninjau: json["peninjau"],
        isiText: json["isiText"],
        updatedAt: json["updatedAt"],
        isFavorit: json["IsFavorit"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "publicId": publicId,
        "linkGambar": linkGambar,
        "judulArtikel": judulArtikel,
        "peninjau": peninjau,
        "isiText": isiText,
        "updatedAt": updatedAt,
        "IsFavorit": isFavorit,
      };
}

//favorit articel user
List<Articel> favoritArticel = [];

// articel from api
List<Articel> listDataArticel = [];
