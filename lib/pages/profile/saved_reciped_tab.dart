import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stuntle/config/color_theme.dart';
import 'package:stuntle/config/font_theme.dart';
import 'package:stuntle/config/route_name.dart';
import 'package:stuntle/cubit/recipes/recipes_cubit.dart';
import 'package:stuntle/data/model/detail_recipes.dart';

class SavedRecipestab extends StatefulWidget {
  const SavedRecipestab({super.key});

  @override
  State<SavedRecipestab> createState() => _SavedRecipestabState();
}

class _SavedRecipestabState extends State<SavedRecipestab> {
  @override
  void initState() {
    context.read<RecipesCubit>().readRecepiesBook();
    super.initState();
  }

  TextEditingController searchTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocListener<RecipesCubit, RecipesState>(
      listener: (context, state) {
        if (state is AddRecipesSuccess) {
          context.read<RecipesCubit>().readRecepiesBook();
        }
      },
      child: BlocBuilder<RecipesCubit, RecipesState>(
        builder: (context, state) {
          if (state is ReadRecipesSuccess) {
            return CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: TextField(
                      controller: searchTextController,
                      decoration: InputDecoration(
                        hintText: "Cari Resep disini",
                        prefixIcon: const Icon(
                          Icons.search,
                          color: greyColor,
                        ),
                        contentPadding:
                            const EdgeInsets.only(left: 16, top: 8, bottom: 8),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide: const BorderSide(
                            width: 1,
                            color: borderGreyColor,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4),
                          borderSide: const BorderSide(
                            width: 1,
                            color: borderGreyColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return GestureDetector(
                        onTap: () => Navigator.pushNamed(
                            context, detailRecipesRoute,
                            arguments: favoritRecepies[index]),
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
                                    padding: const EdgeInsets.only(
                                        top: 15, bottom: 20),
                                    child: Text(
                                      favoritRecepies[index].judulResep,
                                      style: headline(sizeFont: 14),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Material(
                                        color: orangeColor,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 4, horizontal: 8),
                                          child: Text(
                                            favoritRecepies[index].jenis,
                                            style: headline(
                                              sizeFont: 12,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 6,
                                      ),
                                      Material(
                                        color: lightVioletColor,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 4, horizontal: 8),
                                          child: Text(
                                            favoritRecepies[index]
                                                .targetUsiaResep,
                                            style: headline(
                                              sizeFont: 12,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              Image.network(
                                favoritRecepies[index].urlGambar,
                                width: 84,
                                height: 74,
                              )
                            ],
                          ),
                        ),
                      );
                    },
                    childCount: favoritRecepies.length,
                  ),
                ),
              ],
            );
          }

          return const Center(
            child: Text("Tidak ada data"),
          );
        },
      ),
    );
  }
}
