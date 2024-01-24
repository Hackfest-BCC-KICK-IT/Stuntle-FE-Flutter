import 'package:flutter/material.dart';

import 'package:stuntle/config/color_theme.dart';
import 'package:stuntle/config/font_theme.dart';
import 'package:stuntle/config/route_name.dart';
import 'package:stuntle/data/model/detail_recipes.dart';

class CardRecepies extends StatelessWidget {
  final Recepies recepiesData;
  const CardRecepies({
    Key? key,
    required this.recepiesData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, detailRecipesRoute,
          arguments: recepiesData),
      child: Container(
        width: 200,
        height: 85,
        margin: const EdgeInsets.symmetric(vertical: 16),
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15, bottom: 20),
                  child: Text(
                    recepiesData.judulResep,
                    style: headline(sizeFont: 14),
                  ),
                ),
                Row(
                  children: [
                    Material(
                      color: orangeRecepies,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 4, horizontal: 8),
                        child: Text(
                          recepiesData.jenis,
                          style: headline(
                            sizeFont: 12,
                            colorFont: orangeColor,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    Material(
                      color: purpleRecepies,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 4, horizontal: 8),
                        child: Text(
                          recepiesData.targetUsiaResep,
                          style: headline(
                            sizeFont: 12,
                            colorFont: lightVioletColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: SizedBox(
                width: 84,
                height: 74,
                child: Image.network(
                  recepiesData.urlGambar,
                  fit: BoxFit.cover,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
