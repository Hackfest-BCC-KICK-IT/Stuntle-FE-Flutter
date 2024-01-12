import 'package:flutter/material.dart';
import 'package:stuntle/config/color_theme.dart';
import 'package:stuntle/config/font_theme.dart';

import 'package:stuntle/config/route_name.dart';
import 'package:stuntle/data/model/articel.dart';

class CardArticel extends StatelessWidget {
  final Articel singleAricel;
  const CardArticel({
    Key? key,
    required this.singleAricel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, detailArticelRoute,
          arguments: singleAricel),
      child: Container(
        width: 200,
        height: 85,
        margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        padding: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: borderGreyColor,
            width: 1,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 15, bottom: 8, right: 14),
                    child: Text(
                      singleAricel.judulArtikel,
                      style: headline(sizeFont: 14),
                      maxLines: 3, // Set maximum number of lines
                      overflow: TextOverflow
                          .ellipsis, // Handle overflow with ellipsis
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 84,
              height: 74,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
              child: Image.network(
                singleAricel.linkGambar,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    'assets/images/baby.jpg',
                    fit: BoxFit.cover,
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
