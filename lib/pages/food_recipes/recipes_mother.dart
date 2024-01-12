import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:stuntle/config/color_theme.dart';
import 'package:stuntle/config/font_theme.dart';
import 'package:stuntle/config/route_name.dart';
import 'package:stuntle/cubit/recipes/recipes_cubit.dart';
import 'package:stuntle/data/constants/recipes_cons.dart';
import 'package:stuntle/data/model/detail_recipes.dart';
import 'package:stuntle/pages/widget/filter_chip.dart';
import 'package:stuntle/pages/widget/card_recepies.dart';
import 'package:stuntle/pages/widget/loading_widget.dart';

class RecipesMother extends StatefulWidget {
  const RecipesMother({super.key});

  @override
  State<RecipesMother> createState() => _RecipesMotherState();
}

class _RecipesMotherState extends State<RecipesMother> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: InkWell(
            onTap: () => Navigator.pushNamed(context, searchRecipesRoute,
                arguments: "Resep Makanan Untuk Ibu Hamil"),
            child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Container(
                  padding: const EdgeInsets.only(left: 16, top: 8, bottom: 5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(
                        width: 1,
                        color: borderGreyColor,
                      )),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.search,
                        color: greyColor,
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Text(
                        "Cari Resep disini",
                        style: bodyMedium(sizeFont: 14, colorFont: greyColor),
                      )
                    ],
                  ),
                )),
          ),
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
              'Resep Makanan Untuk Ibu Hamil',
              style: heading1(),
            ),
          ),
        ),
        BlocConsumer<RecipesCubit, RecipesState>(
          listener: (context, state) {
            if (state is FetchPrenangcyRecepiesEror) {
              Navigator.pushNamed(context, "/eror", arguments: state.text);
            } else if (state is ReadRecipesSuccess ||
                state is ReadRecipesEror) {
              context.read<RecipesCubit>().fetchRecepiesData();
            }
          },
          builder: (context, state) {
            if (state is FetchChildRecepiesLoading) {
              return const SliverToBoxAdapter(
                  child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15),
                child: LoadingWidget(),
              ));
            } else if (state is FetchPrenangcyRecepiesNoData) {
              return const SliverToBoxAdapter(
                child: Center(
                  child: Text("Tidak ada data"),
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
    );
  }
}
