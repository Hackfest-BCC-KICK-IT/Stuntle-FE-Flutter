import 'package:flutter/material.dart';
import 'package:stuntle/config/color_theme.dart';

import 'package:stuntle/config/font_theme.dart';
import 'package:stuntle/pages/food_recipes/recipes_child.dart';
import 'package:stuntle/pages/food_recipes/recipes_mother.dart';

class FoodRecipesPage extends StatefulWidget {
  const FoodRecipesPage({super.key});

  @override
  State<FoodRecipesPage> createState() => _FoodRecipesPageState();
}

class _FoodRecipesPageState extends State<FoodRecipesPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(_handleTabChange);
  }

  @override
  void dispose() {
    _tabController.removeListener(_handleTabChange);
    _tabController.dispose();

    super.dispose();
  }

  void _handleTabChange() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: whiteColor,
        elevation: 0,
        title: Text(
          "Resep Makan",
          style: heading1(sizeFont: 16),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Column(
            children: [
              Container(
                constraints: const BoxConstraints.expand(height: 50),
                child: TabBar(
                    controller: _tabController,
                    tabs: [
                      Tab(
                        child: Text("Ibu Hamil",
                            style: headline(
                                sizeFont: 14,
                                colorFont: _tabController.index == 0
                                    ? orangeColor
                                    : greyColor)),
                      ),
                      Tab(
                        child: Text(
                          "Bayi & Anak",
                          style: headline(
                              sizeFont: 14,
                              colorFont: _tabController.index == 1
                                  ? orangeColor
                                  : greyColor),
                        ),
                      ),
                    ],
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorColor: orangeColor,
                    labelStyle: headline()),
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: const [
                    RecipesMother(),
                    RecipesChild(),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              )
            ],
          ),
        ),
      ),
    );
  }
}
