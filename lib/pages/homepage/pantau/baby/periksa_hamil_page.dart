import 'package:flutter/material.dart';

import 'package:stuntle/config/color_theme.dart';
import 'package:stuntle/config/font_theme.dart';
import 'package:stuntle/config/route_name.dart';
import 'package:stuntle/pages/widget/app_bar.dart';
import 'package:stuntle/pages/widget/orange_button.dart';
import 'package:stuntle/pages/widget/outline_custom_button.dart';

class PeriksaHamilPage extends StatelessWidget {
  final List<dynamic>? id;
  const PeriksaHamilPage({
    Key? key,
    this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, 'Pantau'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 28, left: 16, right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Estimasi Tanggal Kelahiran",
                style: heading1(),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 2,
                  bottom: 20,
                ),
                child: RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text:
                            'Berdasarkan tanggal hari pertama dari haid terakhir Anda, bayi Anda kemungkinan lahir pada tanggal :',
                        style: TextStyle(
                          color: greyColor,
                        ),
                      ),
                      TextSpan(
                        text: '27 Oktober 2023',
                        style: TextStyle(color: orangeColor),
                      ),
                    ],
                  ),
                ),
              ),
              Text(
                "Data Kehamilan",
                style: heading1(),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 2,
                  bottom: 20,
                ),
                child: Text(
                  'Berikut adalah riwayat data dari kehamilan yang Anda periksakan',
                  style: bodyMedium(sizeFont: 14, colorFont: greyColor),
                ),
              ),
              Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    'assets/images/periksa_kehamilan.jpg',
                    height: 214,
                  )),
              const SizedBox(
                height: 10,
              ),
              pemeriksaanWidget(context),
              Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                  bottom: 5,
                ),
                child: Text(
                  "Hasil Pemeriksaan Kehamilan",
                  style: heading1(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 20,
                ),
                child: Wrap(
                  children: [
                    Text(
                      'Jika Anda melakukan pemeriksaan di rumah sakit atau posyandu yang berbeda dari yang terhubung denganmu, Anda dapat mengirimkan pemeriksaannya melalui tombol dibawah ini',
                      style: bodyMedium(sizeFont: 14, colorFont: greyColor),
                    ),
                  ],
                ),
              ),
              CustomOutlineButton(
                maximumSize: const Size(double.infinity, 48),
                minimumSize: const Size(348, 48),
                contentText: "Kirim Hasil Pemeriksaan",
                onTapFunc: () {},
              ),
              const SizedBox(
                height: 50,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget pemeriksaanWidget(BuildContext ctx) {
    if (id != null && id!.isNotEmpty) {
      return OrangeButton(
        contentText: "Lihat Data Kehamilan",
        maximumSize: const Size(double.infinity, 48),
        minimumSize: const Size(348, 48),
        onPressedFunc: () => Navigator.pushNamed(
          ctx,
          detailDataKehamilan,
          arguments: id,
        ),
      );
    }

    return Text(
      'Belum ada data kehamilan saat ini, periksakan kehamilanmu untuk melihat data perkembangannya',
      textAlign: TextAlign.center,
      style: bodyMedium(sizeFont: 14, colorFont: greyColor),
    );
  }
}
