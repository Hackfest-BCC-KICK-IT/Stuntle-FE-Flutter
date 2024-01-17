import 'package:flutter/material.dart';
import 'package:stuntle/config/color_theme.dart';
import 'package:stuntle/config/font_theme.dart';
import 'package:stuntle/pages/homepage/pantau/widgets/acrodion.dart';
import 'package:stuntle/pages/homepage/pantau/widgets/pemeriksaan_button.dart';
import 'package:stuntle/pages/widget/app_bar.dart';
import 'package:stuntle/pages/widget/orange_button.dart';
import 'package:stuntle/pages/widget/outline_custom_button.dart';

class DetailDataAnak extends StatelessWidget {
  const DetailDataAnak({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, "Pantau"),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        children: [
          Text(
            "Kondisi Prediksi Anak oleh AI",
            style: heading1(),
          ),
          Text(
            "Berikut adalah kondisi prediksi awal oleh aplikasi kami berdasarkan seluruh data hasil pemeriksaan",
            style: bodyMedium(
              sizeFont: 14,
              colorFont: greyColor,
            ),
          ),

          //Acrodion hasil kondisi anak dari Ai
          const AccrodionKondisiAnak(),
          Text(
            "Data Tumbuh Kembang Anak",
            style: heading1(),
          ),
          Text(
            "Berikut adalah riwayat data dari tumbuh kembang anak yang Anda periksakan",
            style: bodyMedium(
              sizeFont: 14,
              colorFont: greyColor,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const PemeriksaanButton(
            text2: "Baik",
            index: 3,
            text1: "Status Gizi Anak:",
            isChild: true,
          ),
          const SizedBox(
            height: 14,
          ),
          const PemeriksaanButton(
            text2: "Lemah",
            index: 2,
            text1: "Status Gizi Anak:",
            isChild: true,
          ),
          const SizedBox(
            height: 14,
          ),
          const PemeriksaanButton(
            text2: "Beresiko",
            index: 1,
            text1: "Status Gizi Anak:",
            isChild: true,
          ),
          const SizedBox(
            height: 20,
          ),
          CustomOutlineButton(
            minimumSize: const Size(348, 48),
            maximumSize: const Size(double.infinity, 48),
            contentText: "Tampilkan Data Lebih Banyak",
            onTapFunc: () {},
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
          const SizedBox(
            height: 20,
          ),
          OrangeButton(
            contentText: "Tambahkan Data Pemeriksaan Mandiri",
            minimumSize: const Size(348, 48),
            maximumSize: const Size(double.infinity, 48),
            onPressedFunc: () {},
          )
        ],
      ),
    );
  }
}
