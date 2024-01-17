import 'package:flutter/material.dart';

import 'package:stuntle/config/color_theme.dart';
import 'package:stuntle/pages/auth/widget/tap_text.dart';
import 'package:stuntle/pages/homepage/pantau/widgets/detail_popup.dart';
import 'package:stuntle/pages/widget/outline_custom_button.dart';

class PemeriksaanButton extends StatelessWidget {
  final String text2;
  final String text1;
  final int index;
  final bool isChild;
  const PemeriksaanButton({
    Key? key,
    required this.text2,
    required this.text1,
    required this.index,
    required this.isChild,
  }) : super(key: key);

  Color text2Color() {
    switch (text2) {
      case "Baik":
        return greenColor;
      case "Lemah" || "Berpotensi Stunting":
        return yellowColor;

      default:
        return erorColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomOutlineButton(
      onTapFunc: () async {
        await showDialog(
          context: context,
          builder: (context) => DetailPopUp(isChild: isChild),
        );
      },
      minimumSize: const Size(348, 80),
      maximumSize: const Size(double.infinity, 80),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      childWidget: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Pemeriksaan - $index"),
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
    );
  }
}
