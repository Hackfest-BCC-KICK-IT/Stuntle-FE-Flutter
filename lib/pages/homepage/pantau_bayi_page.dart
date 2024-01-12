import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stuntle/config/color_theme.dart';
import 'package:stuntle/config/font_theme.dart';
import 'package:stuntle/cubit/child/child_cubit.dart';
import 'package:stuntle/cubit/pregnancy/pregnancy_cubit.dart';
import 'package:stuntle/pages/homepage/data_anak_tab.dart';
import 'package:stuntle/pages/homepage/pantau_kehamilan_tab.dart';
import 'package:stuntle/pages/widget/app_bar.dart';

class PantauAnakPage extends StatefulWidget {
  const PantauAnakPage({Key? key}) : super(key: key);

  @override
  State<PantauAnakPage> createState() => _PantauAnakPageState();
}

class _PantauAnakPageState extends State<PantauAnakPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(_handleTabChange);
    context.read<PregnancyCubit>().hasPrenangcyData();
    context.read<ChildCubit>().hasChildData();
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
      resizeToAvoidBottomInset: false,
      backgroundColor: whiteColor,
      appBar: customAppBar(context, 'Pantau'),
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
                PantauKehamilanTab(),
                DataAnakTab(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
