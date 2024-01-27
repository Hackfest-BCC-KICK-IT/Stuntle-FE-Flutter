import 'package:flutter/material.dart';
import 'package:stuntle/config/color_theme.dart';
import 'package:stuntle/config/font_theme.dart';
import 'package:stuntle/config/route_name.dart';
import 'package:stuntle/pages/homepage/pantau/child/pemeriksaan_mandiri/widgets/form_add_data.dart';
import 'package:stuntle/pages/widget/app_bar.dart';
import 'package:stuntle/pages/widget/orange_button.dart';

class AddDataMandiri extends StatelessWidget {
  const AddDataMandiri({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, "Pantau"),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          Text(
            "Pemeriksaan Mandiri",
            style: heading1(),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 4,
              bottom: 12,
            ),
            child: Text(
              "Pada menu ini, Anda dapat menambahkan data hasil pemeriksaan secara mandiri yang Anda lakukan pada anak Anda selama 1 kali per bulan.",
              style: bodyMedium(
                sizeFont: 14,
                colorFont: greyColor,
              ),
            ),
          ),
          Material(
            color: lightYellowColor,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Text(
                    "Anda dapat mengukur tinggi anak dengan memfotonya melalui icon kamera (Versi Beta)",
                    style: heading1(
                      sizeFont: 12,
                      colorFont: brownColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  OrangeButton(
                    contentText: "Lihat Panduan Penggunaan Fitur Foto",
                    minimumSize: const Size(280, 40),
                    maximumSize: const Size(double.infinity, 40),
                    onPressedFunc: () => Navigator.pushNamed(
                      context,
                      panduanAiCamera,
                    ),
                  )
                ],
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: FormAddDataMandiri(),
          )
        ],
      ),
    );
  }
}
