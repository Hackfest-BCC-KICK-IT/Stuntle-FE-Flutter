import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stuntle/config/color_theme.dart';
import 'package:stuntle/config/font_theme.dart';
import 'package:stuntle/cubit/help/help_cubit.dart';
import 'package:stuntle/pages/homepage/ajukan_bantuan_tab.dart';
import 'package:stuntle/pages/homepage/status_bantuan_tab.dart';
import 'package:stuntle/pages/widget/app_bar.dart';
import 'package:stuntle/pages/widget/loading_widget.dart';

class BantuanPage extends StatefulWidget {
  const BantuanPage({super.key});

  @override
  State<BantuanPage> createState() => _BantuanPageState();
}

class _BantuanPageState extends State<BantuanPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(_handleTabChange);
    context.read<HelpCubit>().fetchHelpData();
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
      appBar: customAppBar(context, 'Ajukan Bantuan'),
      body: BlocConsumer<HelpCubit, HelpState>(
        listener: (context, state) {
          if (state is GetHelpEror) {
            Navigator.pushNamed(context, "/eror", arguments: state.text);
          }
        },
        builder: (context, state) {
          if (state is GetHelpLoading) {
            return const LoadingWidget();
          }
          return Column(
            children: [
              Container(
                constraints: const BoxConstraints.expand(height: 50),
                child: TabBar(
                    controller: _tabController,
                    tabs: [
                      Tab(
                        child: Text("Ajukan",
                            style: headline(
                                sizeFont: 14,
                                colorFont: _tabController.index == 0
                                    ? orangeColor
                                    : greyColor)),
                      ),
                      Tab(
                        child: Text(
                          "Status Ajuan",
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
                    AjukanBantuanTab(),
                    StatusBantuanTab(),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
