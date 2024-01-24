import 'package:flutter/material.dart';

import 'package:stuntle/config/color_theme.dart';
import 'package:stuntle/config/font_theme.dart';
import 'package:stuntle/data/model/pemeriksaan_kehamilan.dart';
import 'package:stuntle/pages/auth/widget/tap_text.dart';

class DetailPopUpKehamilan extends StatelessWidget {
  final PemeriksaanPrenangcy data;
  const DetailPopUpKehamilan({
    Key? key,
    required this.data,
  }) : super(key: key);

  Color text2Color() {
    switch (data.statusKehamilan) {
      case "baik":
        return greenColor;
      case "lemah":
        return yellowColor;

      default:
        return erorColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Detail Pemeriksaan",
            style: headline(
              sizeFont: 16,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          TapText(
            text1: "Tanggal Pemeriksaan: ",
            text2: "${data.tanggalPemeriksaan}",
          ),
          const SizedBox(
            height: 5,
          ),
          TapText(
            text1: "Tempat Pemeriksaan: ",
            text2: "${data.tempatPemeriksaan}",
          ),
          const SizedBox(
            height: 5,
          ),
          const SizedBox(
            height: 5,
          ),
          TapText(
            text1: "Diperiksa Oleh: ",
            text2: "${data.namaPemeriksa}",
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            "Hasil Pemeriksaan",
            style: headline(
              sizeFont: 16,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          TapText(
            text1: "Usia Kandungan: ",
            text2: "${data.usiaKandungan}",
          ),
          const SizedBox(
            height: 5,
          ),
          TapText(
            text1: "Tekanan Darah: ",
            text2: "${data.tekananDarah}",
          ),
          const SizedBox(
            height: 5,
          ),
          TapText(
            text1: "Berat Badan Ibu: ",
            text2: "${data.beratBadanIbu}",
          ),
          const SizedBox(
            height: 5,
          ),
          TapText(
            text1: "Status Kehamilan: ",
            text2: "${data.statusKehamilan}",
            text2Color: text2Color(),
          ),
          const SizedBox(
            height: 5,
          ),
          TapText(
            text1: "Pesan Tambahan: ",
            text2: "${data.pesanTambahan}",
          ),
        ],
      ),
    );
  }
}
