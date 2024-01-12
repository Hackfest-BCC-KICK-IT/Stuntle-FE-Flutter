import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:stuntle/config/color_theme.dart';

class TapText extends StatelessWidget {
  final String? text1;
  final String? text2;
  final void Function()? onTapFunc;
  final TextAlign? textAlign;
  final double? padding;

  const TapText({
    Key? key,
    required this.text1,
    required this.text2,
    this.onTapFunc,
    this.textAlign,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: padding ?? 0),
      child: RichText(
        textAlign: textAlign ?? TextAlign.center,
        text: TextSpan(
          children: [
            TextSpan(
              text: text1,
              style: const TextStyle(
                color: greyColor,
              ),
            ),
            TextSpan(
              text: text2,
              style: const TextStyle(
                color: violetColor,
              ),
              recognizer: TapGestureRecognizer()..onTap = onTapFunc,
            ),
          ],
        ),
      ),
    );
  }
}
