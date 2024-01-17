import 'package:flutter/material.dart';

import 'package:stuntle/config/color_theme.dart';
import 'package:stuntle/config/font_theme.dart';

class CustomOutlineButton extends StatelessWidget {
  final Size minimumSize;
  final Size maximumSize;
  final Widget? childWidget;
  final String? contentText;
  final OutlinedBorder? shape;
  final void Function()? onTapFunc;
  const CustomOutlineButton({
    Key? key,
    required this.minimumSize,
    required this.maximumSize,
    this.childWidget,
    this.contentText,
    this.shape,
    this.onTapFunc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onTapFunc,
      style: OutlinedButton.styleFrom(
        shape: shape,
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 10,
        ),
        minimumSize: minimumSize,
        maximumSize: maximumSize,
        side: const BorderSide(
          width: 1,
          color: lightVioletColor,
        ),
      ),
      child: childWidget ??
          Text(
            contentText!,
            style: headline(
              sizeFont: 14,
              colorFont: lightVioletColor,
            ),
          ),
    );
  }
}
