import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stuntle/config/color_theme.dart';
import 'package:stuntle/config/font_theme.dart';
import 'package:stuntle/cubit/help/help_cubit.dart';
import 'package:stuntle/data/model/help.dart';
import 'package:stuntle/pages/widget/card_bantuan.dart';

class StatusBantuanTab extends StatelessWidget {
  const StatusBantuanTab({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: [
      SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 24, bottom: 5),
                child: Text(
                  'Status Ajuanmu',
                  style: heading1(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Text(
                  'Pantau status dari ajuanmu untuk melihat prosesnya disini',
                  style: bodyMedium(
                    sizeFont: 14,
                    colorFont: greyColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      SliverPadding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        sliver: BlocBuilder<HelpCubit, HelpState>(
          builder: (context, state) {
            if (state is GetHelpSuccess) {
              return SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) => CardBantuan(
                    helpSubmit: dataHelpUser[index],
                  ),
                  childCount: dataHelpUser.length,
                ),
              );
            }
            return SliverToBoxAdapter(
              child: Text(
                "Anda tidak memilki ajuan bantuan ",
                style: bodyMedium(
                  sizeFont: 14,
                  colorFont: greyColor,
                ),
              ),
            );
          },
        ),
      )
    ]);
  }
}
