import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:stuntle/config/color_theme.dart';
import 'package:stuntle/config/font_theme.dart';

import 'package:stuntle/cubit/articel/articel_cubit.dart';

import 'package:stuntle/data/model/articel.dart';
import 'package:stuntle/pages/widget/app_bar.dart';

class DetailArticel extends StatefulWidget {
  const DetailArticel({
    Key? key,
    required this.articel,
  }) : super(key: key);

  final Articel articel;

  @override
  State<DetailArticel> createState() => _DetailArticelState();
}

class _DetailArticelState extends State<DetailArticel> {
  @override
  Widget build(BuildContext context) {
    double screenSize = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: customAppBar(context, "Artikel"),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              child: Column(
                children: [
                  SizedBox(
                    width: screenSize,
                    height: screenSize * 0.5,
                    child: Image.network(
                      widget.articel.linkGambar,
                      fit: BoxFit.cover,
                    ),
                  ),
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(28),
                      topRight: Radius.circular(28),
                    ),
                    child: Container(
                        width: screenSize,
                        decoration: const BoxDecoration(
                          color: whiteColor,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 16,
                            right: 16,
                            top: 32,
                            bottom: 24,
                          ),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 15, bottom: 8),
                                            child: Text(
                                              widget.articel.judulArtikel,
                                              style: heading1(sizeFont: 20),
                                              maxLines:
                                                  3, // Set maximum number of lines
                                              overflow: TextOverflow
                                                  .ellipsis, // Handle overflow with ellipsis
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        if (widget.articel.isFavorit) {
                                          context
                                              .read<ArticelCubit>()
                                              .removeBookmark(widget.articel);
                                        } else {
                                          context
                                              .read<ArticelCubit>()
                                              .addBookmark(widget.articel);
                                        }
                                        setState(() {
                                          widget.articel.isFavorit =
                                              !widget.articel.isFavorit;
                                        });
                                      },
                                      icon: widget.articel.isFavorit
                                          ? const Icon(Icons.bookmark)
                                          : const Icon(Icons.bookmark_outline),
                                      color: const Color(0xff836077),
                                    )
                                  ],
                                ),
                                Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 16),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        // Padding(
                                        //   padding: const EdgeInsets.symmetric(
                                        //       vertical: 2),
                                        //   child: Text(
                                        //     'Ditulis oleh: ${widget.articel.}',
                                        //     style: bodyMedium(
                                        //         sizeFont: 14,
                                        //         colorFont: greyColor),
                                        //   ),
                                        // ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 2),
                                          child: Text(
                                            'Ditinjau oleh:  ${widget.articel.peninjau}',
                                            style: bodyMedium(
                                                sizeFont: 14,
                                                colorFont: greyColor),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 2),
                                          child: Text(
                                            widget.articel.updatedAt,
                                            style: bodyMedium(
                                                sizeFont: 14,
                                                colorFont: greyColor),
                                          ),
                                        ),
                                      ],
                                    )),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 16),
                                  child: Text(
                                    widget.articel.isiText,
                                    style: bodyMedium(
                                      sizeFont: 14,
                                      colorFont: blackColor,
                                    ),
                                  ),
                                ),
                              ]),
                        )),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
