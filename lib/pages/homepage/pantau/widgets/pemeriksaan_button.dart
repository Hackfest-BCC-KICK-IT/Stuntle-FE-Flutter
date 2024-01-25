import 'package:flutter/material.dart';

import 'package:stuntle/config/color_theme.dart';
import 'package:stuntle/data/model/pemeriksaan_anak.dart';
import 'package:stuntle/pages/auth/widget/tap_text.dart';
import 'package:stuntle/pages/homepage/pantau/widgets/detail_popup.dart';
import 'package:stuntle/pages/widget/outline_custom_button.dart';

class PemeriksaanButtonChild extends StatelessWidget {
  final int index;
  final PemeriksaanChild data;

  const PemeriksaanButtonChild({
    Key? key,
    required this.index,
    required this.data,
  }) : super(key: key);

  Color text2Color() {
    switch (data.statusAnak) {
      case "baik":
        return greenColor;
      case "berpotensi Stunting":
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
            builder: (context) => DetailPopUpChild(
              data: data,
            ),
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
                  text1: "Status Gizi Anak:  ",
                  text2: data.statusAnak,
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
