import 'package:flutter/material.dart';
import 'package:stuntle/config/color_theme.dart';
import 'package:stuntle/config/font_theme.dart';
import 'package:stuntle/pages/widget/orange_button.dart';
import 'package:stuntle/pages/widget/outline_custom_button.dart';

Future customPopUp(
  BuildContext ctx,
  String image,
  String title,
  String subtitle,
  String orangeButtonTitle,
  String outlineButtonTitle,
) async {
  return await showDialog(
    context: ctx,
    builder: (context) => AlertDialog(
      content: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              image,
              width: 300,
              height: 110,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16, bottom: 8),
              child: Text(
                title,
                style: headline(sizeFont: 20),
              ),
            ),
            Text(
              subtitle,
              style: bodyMedium(
                sizeFont: 12,
                colorFont: lightGreyColor,
              ),
            ),
          ],
        ),
      ),
      actions: [
        OrangeButton(
          contentText: orangeButtonTitle,
          minimumSize: const Size(300, 48),
          maximumSize: const Size(300, 48),
          onPressedFunc: () => print("has been tap"),
        ),
        const SizedBox(
          height: 12,
        ),
        CustomOutlineButton(
          minimumSize: const Size(300, 48),
          maximumSize: const Size(300, 48),
          onTapFunc: () => Navigator.pop(context),
          contentText: outlineButtonTitle,
        )
      ],
    ),
  );
}
