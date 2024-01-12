import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:stuntle/config/color_theme.dart';
import 'package:stuntle/config/font_theme.dart';
import 'package:stuntle/cubit/recipes/recipes_cubit.dart';
import 'package:stuntle/data/model/detail_recipes.dart';
import 'package:stuntle/pages/widget/app_bar.dart';

class DetailRecipes extends StatefulWidget {
  final Recepies recipes;
  const DetailRecipes({
    Key? key,
    required this.recipes,
  }) : super(key: key);

  @override
  State<DetailRecipes> createState() => _DetailRecipesState();
}

class _DetailRecipesState extends State<DetailRecipes> {
  @override
  Widget build(BuildContext context) {
    double screenSize = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: customAppBar(context, "Resep Makan"),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              child: Column(
                children: [
                  SizedBox(
                    width: screenSize,
                    height: screenSize * 0.5,
                    child: Image.network(
                      widget.recipes.urlGambar,
                      fit: BoxFit.cover,
                    ),
                  ),
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(28),
                      topRight: Radius.circular(28),
                    ),
                    child: Container(
                      width: screenSize,
                      decoration: const BoxDecoration(
                        color: whiteColor,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 16,
                          right: 16,
                          top: 32,
                          bottom: 24,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  widget.recipes.judulResep,
                                  style: heading1(sizeFont: 20),
                                ),
                                IconButton(
                                  onPressed: () {
                                    if (widget.recipes.isBook) {
                                      context
                                          .read<RecipesCubit>()
                                          .removeBookmark(widget.recipes);
                                    } else {
                                      context
                                          .read<RecipesCubit>()
                                          .addBookmark(widget.recipes);
                                    }
                                    setState(() {
                                      widget.recipes.isBook =
                                          !widget.recipes.isBook;
                                    });
                                  },
                                  icon: widget.recipes.isBook
                                      ? const Icon(Icons.bookmark)
                                      : const Icon(Icons.bookmark_outline),
                                  color: const Color(0xff836077),
                                )
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              child: Wrap(
                                runSpacing: 8,
                                spacing: 8,
                                children: [
                                  Material(
                                    color: orangeColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 4, horizontal: 8),
                                      child: Text(
                                        widget.recipes.jenis,
                                        style: headline(
                                          sizeFont: 12,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Material(
                                    color: lightVioletColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 4, horizontal: 8),
                                      child: Text(
                                        widget.recipes.targetUsiaResep,
                                        style: headline(
                                          sizeFont: 12,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Material(
                                    color: greenColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 4, horizontal: 8),
                                      child: Text(
                                        widget.recipes.durasiMemasak,
                                        style: headline(
                                          sizeFont: 12,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Material(
                                    color: yellowColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 4, horizontal: 8),
                                      child: Text(
                                        widget.recipes.bahanUtama,
                                        style: headline(
                                          sizeFont: 12,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              child: Text(
                                "Bahan Yang Perlu Disiapkan",
                                style: headline(
                                    sizeFont: 16, colorFont: violetColor),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 16),
                              child: Text(
                                widget.recipes.bahanText,
                                style: bodyMedium(
                                    sizeFont: 14, colorFont: greyColor),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(bottom: 16, top: 16),
                              child: Text(
                                "Cara Membuat",
                                style: headline(
                                    sizeFont: 16, colorFont: violetColor),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 16),
                              child: Text(
                                widget.recipes.caraMembuatText,
                                style: bodyMedium(
                                    sizeFont: 14, colorFont: greyColor),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(bottom: 16, top: 16),
                              child: Text(
                                "Informasi Nilai Gizi",
                                style: headline(
                                    sizeFont: 16, colorFont: violetColor),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 16),
                              child: Text(
                                widget.recipes.nilaiGiziText,
                                style: bodyMedium(
                                    sizeFont: 14, colorFont: greyColor),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
