import 'package:flutter/material.dart';
import 'package:stuntle/config/color_theme.dart';
import 'package:stuntle/config/font_theme.dart';
import 'package:stuntle/pages/profile/data_child_user.dart';
import 'package:stuntle/pages/profile/data_pregnacy_user.dart';
import 'package:stuntle/pages/widget/app_bar.dart';

class DataUserPage extends StatefulWidget {
  const DataUserPage({super.key});

  @override
  State<DataUserPage> createState() => _DataUserPageState();
}

class _DataUserPageState extends State<DataUserPage>
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
      backgroundColor: whiteColor,
      appBar: customAppBar(context, 'Data Profil Kehamilan/Anak Saya'),
      body: Column(
        children: [
          Container(
            constraints: const BoxConstraints.expand(height: 50),
            child: TabBar(
                controller: _tabController,
                tabs: [
                  Tab(
                    child: Text("Kehamilan Saya",
                        style: headline(
                            sizeFont: 14,
                            colorFont: _tabController.index == 0
                                ? orangeColor
                                : greyColor)),
                  ),
                  Tab(
                    child: Text(
                      "Anak Saya",
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
                DataPregnacyUser(),
                DataChildUser(),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          )
        ],
      ),
    );
  }
}
