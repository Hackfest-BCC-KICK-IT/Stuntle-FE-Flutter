import 'package:flutter/material.dart';
import 'package:stuntle/config/color_theme.dart';
import 'package:stuntle/config/font_theme.dart';

Future anotherPopUP(
  BuildContext ctx,
  String title,
  String content,
  List<Widget>? actionsWidget,
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
          actions: actionsWidget),
    );
