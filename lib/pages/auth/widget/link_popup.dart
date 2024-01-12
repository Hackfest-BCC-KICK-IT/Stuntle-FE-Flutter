import 'package:flutter/material.dart';
import 'package:stuntle/config/color_theme.dart';
import 'package:stuntle/config/font_theme.dart';

Future linkPopUp(
  BuildContext ctx,
  String title,
  String content,
  String textButton,
) async =>
    await showDialog(
      context: ctx,
      builder: (context) => AlertDialog(
        title: Text(
          title,
          style: bodyMedium(sizeFont: 22),
        ),
        content: Text(
          content,
          style: bodyMedium(
            colorFont: lightGreyColor,
            sizeFont: 14,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              textButton,
              style: headline(colorFont: violetColor, sizeFont: 14),
            ),
          ),
        ],
      ),
    );
