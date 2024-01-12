import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stuntle/config/color_theme.dart';
import 'package:stuntle/config/font_theme.dart';
import 'package:stuntle/config/route_name.dart';
import 'package:stuntle/cubit/articel/articel_cubit.dart';
import 'package:stuntle/data/model/articel.dart';
import 'package:stuntle/pages/widget/card_articel.dart';

import 'package:stuntle/pages/widget/loading_widget.dart';

class ArticlePage extends StatefulWidget {
  const ArticlePage({super.key});

  @override
  State<ArticlePage> createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: whiteColor,
            elevation: 0,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                'Artikel',
                style: heading1(sizeFont: 16),
              ),
              centerTitle: true,
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () =>
                        Navigator.pushNamed(context, searchArticelRoute),
                    child: Container(
                      padding:
                          const EdgeInsets.only(left: 16, top: 8, bottom: 5),
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
                            "Cari Artikel Disini",
                            style:
                                bodyMedium(sizeFont: 14, colorFont: greyColor),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 28,
                    ),
                    child: Text(
                      "Artikel Harian Untuk Orang Tua",
                      style: heading1(sizeFont: 20),
                    ),
                  ),
                ],
              ),
            ),
          ),
          BlocConsumer<ArticelCubit, ArticelState>(
            listener: (context, state) {
              if (state is FetchArticelEror) {
                Navigator.pushNamed(context, "/eror", arguments: state.text);
              } else if (state is ReadArticelBookSuccess ||
                  state is ReadArticelBookEror) {
                context.read<ArticelCubit>().fetchDataArticel();
              }
            },
            builder: (context, state) {
              if (state is FetchArticelLoading) {
                return const SliverToBoxAdapter(child: LoadingWidget());
              } else if (state is FetchArticelNoData) {
                return const Center(
                  child: Text("Tidak ada data artikel dari puskesmas "),
                );
              }

              return SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return CardArticel(singleAricel: listDataArticel[index]);
                  },
                  childCount: listDataArticel.length,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
