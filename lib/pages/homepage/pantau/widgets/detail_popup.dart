import 'package:flutter/material.dart';

import 'package:stuntle/config/color_theme.dart';
import 'package:stuntle/config/font_theme.dart';
import 'package:stuntle/pages/auth/widget/tap_text.dart';

class DetailPopUp extends StatelessWidget {
  final bool isChild;
  const DetailPopUp({
    Key? key,
    required this.isChild,
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
          const TapText(
            text1: "Tanggal Pemeriksaan: ",
            text2: "18 Okt 2023",
          ),
          const SizedBox(
            height: 5,
          ),
          const TapText(
            text1: "Tempat Pemeriksaan: ",
            text2: "Bantar Batu",
          ),
          const SizedBox(
            height: 5,
          ),
          const SizedBox(
            height: 5,
          ),
          const TapText(
            text1: "Diperiksa Oleh: ",
            text2: "Dr. Sumiati",
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
          hasilPemeriksaan(),
          const SizedBox(
            height: 5,
          ),
          const TapText(
            text1: "Pesan Tambahan: ",
            text2: "Jaga pola makannya ya bunda biar bayinya tetap sehat",
          ),
        ],
      ),
    );
  }

  Widget hasilPemeriksaan() {
    if (isChild) {
      return const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TapText(
            text1: "Umur Anak: ",
            text2: "1 Tahun 3 Bulan 4 Hari",
          ),
          SizedBox(
            height: 5,
          ),
          TapText(
            text1: "Tinggi Anak: ",
            text2: "88 cm",
          ),
          SizedBox(
            height: 5,
          ),
          TapText(
            text1: "Berat Badan Anak: ",
            text2: "10 kg",
          ),
          SizedBox(
            height: 5,
          ),
          TapText(
            text1: "Status Gizi Anak: ",
            text2: "Baik",
            text2Color: greenColor,
          ),
        ],
      );
    }
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TapText(
          text1: "Usia Kandungan: ",
          text2: "16 minggu",
        ),
        SizedBox(
          height: 5,
        ),
        TapText(
          text1: "Tekanan Darah: ",
          text2: "120/80 mmHg",
        ),
        SizedBox(
          height: 5,
        ),
        TapText(
          text1: "Berat Badan Ibu: ",
          text2: "89 kg",
        ),
        SizedBox(
          height: 5,
        ),
        TapText(
          text1: "Status Kehamilan: ",
          text2: "Baik",
          text2Color: greenColor,
        ),
      ],
    );
  }
}
