import 'package:flutter/material.dart';
import 'package:stuntle/config/color_theme.dart';
import 'package:stuntle/config/font_theme.dart';
import 'package:stuntle/pages/homepage/pantau/widgets/pemeriksaan_button.dart';
import 'package:stuntle/pages/widget/app_bar.dart';
import 'package:stuntle/pages/widget/outline_custom_button.dart';

class DetailDataKehamilan extends StatelessWidget {
  const DetailDataKehamilan({super.key});

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
            "Data Kehamilan",
            style: heading1(),
          ),
          Text(
            "Berikut adalah riwayat data dari kehamilan yang Anda periksakan",
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
            text1: "Status Kehamilan: ",
            isChild: false,
          ),
          const SizedBox(
            height: 14,
          ),
          const PemeriksaanButton(
            text2: "Lemah",
            index: 2,
            text1: "Status Kehamilan: ",
            isChild: false,
          ),
          const SizedBox(
            height: 14,
          ),
          const PemeriksaanButton(
            text2: "Beresiko",
            index: 1,
            text1: "Status Kehamilan: ",
            isChild: false,
          ),
          const SizedBox(
            height: 20,
          ),
          CustomOutlineButton(
            minimumSize: const Size(348, 48),
            maximumSize: const Size(double.infinity, 48),
            contentText: "Tampilkan Data Lebih Banyak",
            onTapFunc: () {},
          ),
        ],
      ),
    );
  }
}
