import 'package:flutter/material.dart';
import 'package:stuntle/config/color_theme.dart';
import 'package:stuntle/config/font_theme.dart';
import 'package:stuntle/pages/widget/app_bar.dart';
import 'package:stuntle/pages/widget/orange_button.dart';

class PeriksaAnakPage extends StatelessWidget {
  const PeriksaAnakPage({super.key});

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
                "Hasil Pemeriksaan Anak",
                style: heading1(),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 2,
                  bottom: 16,
                ),
                child: Text(
                  'Jika Anda melakukan pemeriksaan di tempat yang berbeda dari yang terhubung denganmu, Anda dapat mengirimkan pemeriksaannya melalui tombol dibawah ini',
                  style: bodyMedium(sizeFont: 14, colorFont: greyColor),
                ),
              ),
              OrangeButton(
                contentText: 'Kirim Hasil Pemeriksaan',
                minimumSize: const Size(328, 48),
                maximumSize: const Size(double.infinity, 48),
                onPressedFunc: () => print('has been tap'),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  "Data Tumbuh Kembang Anak",
                  style: heading1(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 2,
                  bottom: 20,
                ),
                child: Text(
                  'Berikut adalah riwayat data dari tumbuh kembang anak yang Anda periksakan',
                  style: bodyMedium(sizeFont: 14, colorFont: greyColor),
                ),
              ),
              Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    'assets/images/periksa_anak.jpg',
                    height: 214,
                  )),
              Text(
                'Belum ada data anak saat ini, periksakan anakmu untuk melihat data tumbuh kembangnya',
                textAlign: TextAlign.center,
                style: bodyMedium(sizeFont: 14, colorFont: greyColor),
              )
            ],
          ),
        ),
      ),
    );
  }
}
