import 'package:flutter/material.dart';
import 'package:stuntle/config/color_theme.dart';
import 'package:stuntle/config/font_theme.dart';
import 'package:stuntle/config/route_name.dart';
import 'package:stuntle/pages/widget/orange_button.dart';

class AjukanBantuanTab extends StatelessWidget {
  const AjukanBantuanTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 24, bottom: 5),
            child: Text(
              'Ajukan Bantuan Disini',
              style: heading1(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Text(
              'Anda dapat mengajukan bantuan pada fasilitas kesehatan yang terhubung denganmu melalui tombol dibawah',
              style: bodyMedium(
                sizeFont: 14,
                colorFont: greyColor,
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: OrangeButton(
              contentText: 'Ajukan Bantuan',
              minimumSize: const Size(328, 48),
              maximumSize: const Size(double.infinity, 48),
              onPressedFunc: () =>
                  Navigator.pushNamed(context, formBantuanPage),
            ),
          )
        ],
      ),
    );
  }
}
