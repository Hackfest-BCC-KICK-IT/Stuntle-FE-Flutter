import 'package:flutter/material.dart';

import 'package:stuntle/config/color_theme.dart';
import 'package:stuntle/config/font_theme.dart';

class OrangeButton extends StatelessWidget {
  final String contentText;
  final void Function()? onPressedFunc;
  final Size minimumSize;
  final Size maximumSize;
  const OrangeButton({
    Key? key,
    required this.contentText,
    this.onPressedFunc,
    required this.minimumSize,
    required this.maximumSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressedFunc,
      style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: orangeColor,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
          minimumSize: minimumSize,
          maximumSize: maximumSize,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          )),
      child: Text(
        contentText,
        style: headline(
          colorFont: Colors.white,
          sizeFont: 14,
        ),
      ),
    );
  }
}
