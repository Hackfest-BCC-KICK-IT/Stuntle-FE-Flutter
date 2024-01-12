import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stuntle/config/color_theme.dart';
import 'package:stuntle/config/font_theme.dart';
import 'package:stuntle/config/route_name.dart';
import 'package:stuntle/cubit/articel/articel_cubit.dart';

import 'package:stuntle/data/model/articel.dart';

class SavedArticelTab extends StatefulWidget {
  const SavedArticelTab({super.key});

  @override
  State<SavedArticelTab> createState() => _SavedArticelTabState();
}

class _SavedArticelTabState extends State<SavedArticelTab> {
  TextEditingController searchTextController = TextEditingController();

  @override
  void initState() {
    context.read<ArticelCubit>().readArticelBook();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ArticelCubit, ArticelState>(
      listener: (context, state) {
        if (state is AddArticelBookSucess) {
          context.read<ArticelCubit>().readArticelBook();
        }
      },
      child: BlocBuilder<ArticelCubit, ArticelState>(
        builder: (context, state) {
          if (state is ReadArticelBookSuccess) {
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
                            context, detailArticelRoute,
                            arguments: favoritArticel[index]),
                        child: Container(
                          width: 200,
                          height: 85,
                          margin: const EdgeInsets.symmetric(
                            vertical: 16,
                          ),
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
                                      padding: const EdgeInsets.only(
                                          top: 15,
                                          bottom: 8,
                                          left: 5,
                                          right: 15),
                                      child: Text(
                                        favoritArticel[index].judulArtikel,
                                        style: headline(sizeFont: 14),
                                        maxLines:
                                            3, // Set maximum number of lines
                                        overflow: TextOverflow
                                            .ellipsis, // Handle overflow with ellipsis
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Image.network(
                                favoritArticel[index].linkGambar,
                                width: 84,
                                height: 74,
                              )
                            ],
                          ),
                        ),
                      );
                    },
                    childCount: favoritArticel.length,
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
