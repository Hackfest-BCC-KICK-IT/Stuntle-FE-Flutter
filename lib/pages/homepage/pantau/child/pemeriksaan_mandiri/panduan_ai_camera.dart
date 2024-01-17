import 'package:flutter/material.dart';
import 'package:stuntle/config/color_theme.dart';
import 'package:stuntle/config/font_theme.dart';
import 'package:stuntle/pages/widget/app_bar.dart';
import 'package:stuntle/pages/widget/orange_button.dart';

class PanduanAiCamera extends StatelessWidget {
  const PanduanAiCamera({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, "Pantau"),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          Text(
            "Panduan Penggunaan Fitur Foto",
            style: heading1(),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 4,
              bottom: 12,
            ),
            child: Text(
              "Perhatikan cara penggunaan fitur ini untuk mendapatkan hasil pengukuran yang akurat:",
              style: bodyMedium(
                sizeFont: 14,
                colorFont: greyColor,
              ),
            ),
          ),
          Text(
            "1. Pastikan anak Anda berada dalam posisi tegak dan lurus (baik dalam keadaan berdiri/terlentang) dengan posisi kaki dan bahu sejajar, serta mengarah ke kamera, seperti gambar dibawah ini:",
            style: bodyMedium(
              sizeFont: 14,
              colorFont: greyColor,
            ),
          ),
          Container(
            height: 185,
            margin: const EdgeInsets.only(
              top: 5,
              bottom: 20,
            ),
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: greyColor,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Image.asset(
                "assets/images/baby_ai.jpg",
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          Text(
            "2. Pastikan Anda memfoto anak dengan posisi Anda berhadapan, sejajar, dalam keadaan lurus, dan berjarak sekitar 80 - 100 cm dari anak, seperti gambar dibawah ini:",
            style: bodyMedium(
              sizeFont: 14,
              colorFont: greyColor,
            ),
          ),
          Container(
            height: 185,
            margin: const EdgeInsets.only(
              top: 5,
              bottom: 20,
            ),
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: greyColor,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Image.asset(
                "assets/images/jarak.jpg",
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          Text(
            "3. Pastikan saat Anda ingin memfoto, hanya ada Anak anda dalam kamera dan tidak ada objek atau benda lainnya, seperti gambar dibawah ini:",
            style: bodyMedium(
              sizeFont: 14,
              colorFont: greyColor,
            ),
          ),
          Container(
            height: 185,
            margin: const EdgeInsets.only(
              top: 5,
              bottom: 20,
            ),
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
                color: greyColor,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Image.asset(
                "assets/images/scan.jpg",
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          Text(
            "4. Fitur ini masih dalam tahap “Pengujian” sehingga pastikan hasil data tinggi anak yang diberikan juga realistis.",
            style: bodyMedium(
              sizeFont: 14,
              colorFont: greyColor,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: OrangeButton(
              contentText: "Kembali",
              minimumSize: const Size(348, 48),
              maximumSize: const Size(double.infinity, 48),
              onPressedFunc: () => Navigator.pop(context),
            ),
          )
        ],
      ),
    );
  }
}
