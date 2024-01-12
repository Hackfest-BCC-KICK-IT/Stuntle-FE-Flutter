import 'package:flutter/material.dart';

import 'package:stuntle/config/color_theme.dart';
import 'package:stuntle/data/model/help.dart';

import '../../config/font_theme.dart';
import '../../config/route_name.dart';

class CardBantuan extends StatelessWidget {
  final HelpSubmit helpSubmit;
  const CardBantuan({
    Key? key,
    required this.helpSubmit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          Navigator.pushNamed(context, detailBantuan, arguments: helpSubmit),
      child: Container(
        width: double.infinity,
        height: 80,
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
        margin: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: borderGreyColor,
            width: 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              helpSubmit.title,
              style: headline(sizeFont: 16),
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(
              height: 3,
            ),
            RichText(
              text: TextSpan(
                  text: 'Status Ajuanmu: ',
                  style: bodyMedium(sizeFont: 14),
                  children: [
                    TextSpan(
                      text: helpSubmit.statusHelp.text,
                      style: bodyMedium(
                        sizeFont: 14,
                        colorFont: helpSubmit.statusHelp.color,
                      ),
                    )
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
