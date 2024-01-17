import 'package:flutter/material.dart';
import 'package:stuntle/config/color_theme.dart';
import 'package:stuntle/config/font_theme.dart';
import 'package:stuntle/config/route_name.dart';
import 'package:stuntle/pages/auth/widget/tap_text.dart';
import 'package:stuntle/pages/widget/app_bar.dart';
import 'package:stuntle/pages/widget/orange_button.dart';
import 'package:stuntle/pages/widget/outline_custom_button.dart';

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
                "Umur Anak Anda",
                style: heading1(),
              ),
              const Padding(
                padding: EdgeInsets.only(
                  top: 2,
                  bottom: 16,
                ),
                child: TapText(
                  text1:
                      "Berdasarkan data tanggal lahir anak Anda yang diinputkan, anak Anda saat ini berusia : ",
                  text2: "1 Tahun, 1 Bulan, 2 Hari",
                  textAlign: TextAlign.start,
                  text2Color: orangeColor,
                ),
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
              const SizedBox(
                height: 10,
              ),
              // Text(
              //   'Belum ada data anak saat ini, periksakan anakmu untuk melihat data tumbuh kembangnya',
              //   textAlign: TextAlign.center,
              //   style: bodyMedium(sizeFont: 14, colorFont: greyColor),
              // ),
              OrangeButton(
                contentText: "Lihat Data Tumbuh Kembang Anak",
                maximumSize: const Size(double.infinity, 48),
                minimumSize: const Size(348, 48),
                onPressedFunc: () => Navigator.pushNamed(
                  context,
                  detailDataAnak,
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                  bottom: 5,
                ),
                child: Text(
                  "Hasil Pemeriksaan Anak",
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
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)))),
              const SizedBox(
                height: 50,
              )
            ],
          ),
        ),
      ),
    );
  }
}
