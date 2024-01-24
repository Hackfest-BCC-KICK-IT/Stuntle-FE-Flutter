import 'package:flutter/material.dart';

import 'package:stuntle/config/color_theme.dart';
import 'package:stuntle/data/model/pemeriksaan_kehamilan.dart';
import 'package:stuntle/pages/auth/widget/tap_text.dart';
import 'package:stuntle/pages/homepage/pantau/baby/widgets/detail_pop_up_kehamilan.dart';
import 'package:stuntle/pages/widget/outline_custom_button.dart';

class PemeriksaanButtonKehamilan extends StatelessWidget {
  final String text2;
  final String text1;
  final int index;
  final PemeriksaanPrenangcy data;

  const PemeriksaanButtonKehamilan({
    Key? key,
    required this.text2,
    required this.text1,
    required this.index,
    required this.data,
  }) : super(key: key);

  Color text2Color() {
    switch (text2) {
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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: CustomOutlineButton(
        onTapFunc: () async {
          await showDialog(
            context: context,
            builder: (context) => DetailPopUpKehamilan(data: data),
          );
        },
        minimumSize: const Size(348, 80),
        maximumSize: const Size(double.infinity, 80),
        childWidget: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Pemeriksaan - ${index + 1}"),
                const SizedBox(
                  height: 2,
                ),
                TapText(
                  text1: text1,
                  text2: text2,
                  text2Color: text2Color(),
                )
              ],
            ),
            const Icon(
              Icons.arrow_forward_ios_sharp,
            )
          ],
        ),
      ),
    );
  }
}
