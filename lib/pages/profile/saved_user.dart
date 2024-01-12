import 'package:flutter/material.dart';
import 'package:stuntle/config/color_theme.dart';
import 'package:stuntle/config/font_theme.dart';
import 'package:stuntle/pages/profile/saved_articel_tab.dart';
import 'package:stuntle/pages/profile/saved_reciped_tab.dart';
import 'package:stuntle/pages/widget/app_bar.dart';

class SavedUser extends StatefulWidget {
  const SavedUser({super.key});

  @override
  State<SavedUser> createState() => _SavedUserState();
}

class _SavedUserState extends State<SavedUser>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, 'Resep/Artikel Tersimpan'),
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
                        child: Text("Resep Makan",
                            style: headline(
                                sizeFont: 14,
                                colorFont: _tabController.index == 0
                                    ? orangeColor
                                    : greyColor)),
                      ),
                      Tab(
                        child: Text(
                          "Artikel",
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
                child: TabBarView(controller: _tabController, children: const [
                  SavedRecipestab(),
                  SavedArticelTab(),
                ]),
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
