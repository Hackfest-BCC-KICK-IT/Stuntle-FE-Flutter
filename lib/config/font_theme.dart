import 'package:flutter/material.dart';
import 'package:stuntle/config/color_theme.dart';

TextStyle heading1({
  Color? colorFont,
  double? sizeFont,
}) =>
    TextStyle(
      color: colorFont ?? blackColor,
      fontSize: sizeFont ?? 22,
      fontWeight: FontWeight.w700,
    );

TextStyle headline({
  Color? colorFont,
  double? sizeFont,
}) =>
    TextStyle(
      color: colorFont ?? blackColor,
      fontSize: sizeFont ?? 22,
      fontWeight: FontWeight.w500,
    );

TextStyle bodyMedium({
  Color? colorFont,
  double? sizeFont,
}) =>
    TextStyle(
      color: colorFont ?? blackColor,
      fontSize: sizeFont ?? 20,
      fontWeight: FontWeight.w400,
    );
