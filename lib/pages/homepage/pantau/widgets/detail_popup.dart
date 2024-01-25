import 'package:flutter/material.dart';

import 'package:stuntle/config/color_theme.dart';
import 'package:stuntle/config/font_theme.dart';
import 'package:stuntle/data/model/pemeriksaan_anak.dart';
import 'package:stuntle/pages/auth/widget/tap_text.dart';

class DetailPopUpChild extends StatelessWidget {
  final PemeriksaanChild data;
  const DetailPopUpChild({
    Key? key,
    required this.data,
  }) : super(key: key);

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
            text1: "Umur Anak: ",
            text2: "${data.umurAnak}",
          ),
          const SizedBox(
            height: 5,
          ),
          TapText(
            text1: "Tinggi Anak: ",
            text2: "${data.tinggiAnak}",
          ),
          const SizedBox(
            height: 5,
          ),
          TapText(
            text1: "Berat Badan Anak: ",
            text2: "${data.beratBadanAnak}",
          ),
          const SizedBox(
            height: 5,
          ),
          TapText(
            text1: "Status Gizi Anak: ",
            text2: "${data.statusAnak}",
            text2Color: greenColor,
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
