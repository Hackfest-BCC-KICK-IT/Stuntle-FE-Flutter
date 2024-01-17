import 'package:flutter/material.dart';

import 'package:stuntle/config/color_theme.dart';
import 'package:stuntle/config/font_theme.dart';
import 'package:stuntle/pages/homepage/pantau/child/pemeriksaan_mandiri/camera_page.dart';
import 'package:stuntle/pages/widget/another_popup.dart';
import 'package:stuntle/pages/widget/orange_button.dart';

class CameraFliedWidget extends StatelessWidget {
  final TextEditingController textEditingController;
  final String hintText;
  final String subText;
  const CameraFliedWidget({
    Key? key,
    required this.textEditingController,
    required this.hintText,
    required this.subText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: textEditingController,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Isi Form Dengan Benar';
            }
            return null;
          },
          decoration: InputDecoration(
            hintText: hintText,
            contentPadding: const EdgeInsets.only(left: 16, top: 8, bottom: 8),
            suffixIcon: IconButton(
                onPressed: () async {
                  await anotherPopUP(context, "Perhatikan",
                      "Fitur masih proses pengembangan Beta", [
                    OrangeButton(
                      contentText: "Okey",
                      minimumSize: const Size(240, 35),
                      maximumSize: const Size(double.infinity, 35),
                      onPressedFunc: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const CameraPage())),
                    )
                  ]);
                },
                icon: const Icon(
                  Icons.camera_alt_outlined,
                  color: orangeColor,
                )),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: const BorderSide(
                width: 1,
                color: borderGreyColor,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                width: 1,
                color: borderGreyColor,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 4,
            left: 16,
            bottom: 16,
          ),
          child: Text(
            subText,
            style: bodyMedium(
              colorFont: greyColor,
              sizeFont: 12,
            ),
          ),
        ),
      ],
    );
  }
}
