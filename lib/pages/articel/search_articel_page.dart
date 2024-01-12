import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stuntle/config/color_theme.dart';
import 'package:stuntle/config/font_theme.dart';
import 'package:stuntle/cubit/articel/articel_cubit.dart';
import 'package:stuntle/data/model/articel.dart';
import 'package:stuntle/pages/widget/card_articel.dart';
import 'package:stuntle/pages/widget/loading_widget.dart';

class SearchArticel extends StatefulWidget {
  const SearchArticel({super.key});

  @override
  State<SearchArticel> createState() => _SearchArticelState();
}

class _SearchArticelState extends State<SearchArticel> {
  TextEditingController searchTextController = TextEditingController();
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
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 16,
                      ),
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
                              onSubmitted: (value) => context
                                  .read<ArticelCubit>()
                                  .searchArticel(searchTextController.text),
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
                        ],
                      )),
                  Text(
                    "Berikut Artikel Terkait Pencarianmu",
                    style: heading1(sizeFont: 20),
                  ),
                ],
              ),
            ),
          ),
          BlocConsumer<ArticelCubit, ArticelState>(
            listener: (context, state) {
              if (state is SearchArticelEror) {
                Navigator.pushNamed(context, "/eror", arguments: state.text);
              }
            },
            builder: (context, state) {
              if (state is SearchArticelLoading) {
                return const SliverToBoxAdapter(
                    child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 40),
                        child: LoadingWidget()));
              } else if (state is SearchArticelNoData) {
                return SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 40),
                    child: Text(
                      "Artikel tidak ditemukan",
                      textAlign: TextAlign.center,
                      style: bodyMedium(),
                    ),
                  ),
                );
              } else if (state is SearchArticelSuccess) {
                return SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return CardArticel(singleAricel: state.resultData[index]);
                    },
                    childCount: state.resultData.length,
                  ),
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
