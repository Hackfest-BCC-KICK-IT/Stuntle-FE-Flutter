import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:stuntle/config/color_theme.dart';
import 'package:stuntle/config/font_theme.dart';
import 'package:stuntle/cubit/recipes/recipes_cubit.dart';
import 'package:stuntle/data/constants/recipes_cons.dart';
import 'package:stuntle/data/model/detail_recipes.dart';
import 'package:stuntle/pages/widget/filter_chip.dart';
import 'package:stuntle/pages/widget/loading_widget.dart';
import 'package:stuntle/pages/widget/modal_bottom.dart';
import 'package:stuntle/pages/widget/card_recepies.dart';

class SearchRecipesPage extends StatefulWidget {
  final String textTitle;

  const SearchRecipesPage({
    Key? key,
    required this.textTitle,
  }) : super(key: key);

  @override
  State<SearchRecipesPage> createState() => _SearchRecipesPageState();
}

class _SearchRecipesPageState extends State<SearchRecipesPage> {
  TextEditingController searchTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(
                            onPressed: () => Navigator.pop(context),
                            icon: const Icon(
                              Icons.arrow_back,
                              size: 32,
                            )),
                        const SizedBox(
                          width: 6,
                        ),
                        Expanded(
                          child: TextField(
                            controller: searchTextController,
                            onSubmitted: (value) {
                              String recepiesFor = "";
                              widget.textTitle.contains("Ibu Hamil")
                                  ? recepiesFor = "kehamilan"
                                  : recepiesFor = "bayianak";

                              context
                                  .read<RecipesCubit>()
                                  .searchRecepies(value, recepiesFor);
                            },
                            decoration: InputDecoration(
                              hintText: "Cari Resep disini",
                              prefixIcon: const Icon(
                                Icons.search,
                                color: greyColor,
                              ),
                              contentPadding: const EdgeInsets.only(
                                  left: 16, top: 8, bottom: 8),
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
                        const SizedBox(
                          width: 6,
                        ),
                        IconButton(
                            onPressed: () async {
                              await showModalBottomSheet(
                                backgroundColor: Colors.transparent,
                                isScrollControlled: true,
                                context: context,
                                builder: (context) {
                                  return const FilterModalBottomSheet();
                                },
                              );
                            },
                            icon: const Icon(
                              Icons.tune,
                              size: 32,
                            )),
                      ],
                    )),
              ),
              SliverToBoxAdapter(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: timeDataFilters.map((filter) {
                      return FilterChipCustom(
                          filter: filter,
                          onSelectedFunc: (bool selected) {
                            setState(() {
                              if (selected) {
                                resetFilters(timeDataFilters);
                                filter.isSelected = true;
                              }
                            });
                          });
                    }).toList(),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(top: 28),
                  child: Text(
                    widget.textTitle,
                    style: heading1(),
                  ),
                ),
              ),
              BlocConsumer<RecipesCubit, RecipesState>(
                listener: (context, state) {
                  if (state is SearchRecepiesEror) {
                    Navigator.pushNamed(context, "/eror",
                        arguments: state.text);
                  }
                },
                builder: (context, state) {
                  if (state is SearchRecepiesLoading) {
                    return const SliverToBoxAdapter(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 35),
                        child: LoadingWidget(),
                      ),
                    );
                  } else if (state is SearchRecepiesNoData) {
                    return const SliverToBoxAdapter(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 35),
                        child: Center(
                          child: Text("Resep Tidak ditemukan"),
                        ),
                      ),
                    );
                  } else if (state is SearchRecepiesSuccess) {
                    return SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          return CardRecepies(
                            recepiesData: state.dataApi[index],
                          );
                        },
                        childCount: state.dataApi.length,
                      ),
                    );
                  }
                  return SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return CardRecepies(
                          recepiesData: listPrenangcyRecepies[index],
                        );
                      },
                      childCount: listPrenangcyRecepies.length,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
