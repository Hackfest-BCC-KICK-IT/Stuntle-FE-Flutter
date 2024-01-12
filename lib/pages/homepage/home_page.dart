import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stuntle/config/color_theme.dart';
import 'package:stuntle/config/font_theme.dart';
import 'package:stuntle/config/route_name.dart';
import 'package:stuntle/cubit/health/health_cubit.dart';
import 'package:stuntle/data/constants/our_service_const.dart';
import 'package:stuntle/data/model/user.dart';
import 'package:stuntle/pages/widget/loading_widget.dart';

import 'package:stuntle/pages/widget/orange_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
              child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.only(top: 42),
            child: Text(
              "Selamat Datang, ${currUser.data.namaIbu}",
              style: heading1(),
            ),
          ),
          BlocConsumer<HealthCubit, HealthState>(
            listener: (context, state) {
              if (state is SuccessConnectedFakes) {
                context.read<HealthCubit>().isConnextedFakes();
              }
            },
            builder: (context, state) {
              if (state is HasConnectedFakes) {
                return Container(
                  height: 88,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  margin: const EdgeInsets.only(top: 20),
                  decoration: BoxDecoration(
                      color: lightGreenColor,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        width: 1,
                        color: greenColor,
                      )),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Anda sudah terhubung dengan\n${currUser.namaFaskes}",
                        style: bodyMedium(
                          sizeFont: 14,
                          colorFont: greenColor,
                        ),
                      ),
                      OrangeButton(
                        contentText: "Lihat Disini",
                        minimumSize: const Size(97, 48),
                        maximumSize: const Size(double.infinity, 48),
                        onPressedFunc: () => Navigator.pushNamed(
                          context,
                          nearFaskesRoute,
                        ),
                      )
                    ],
                  ),
                );
              } else if (state is LoadingConnectedFakes) {
                return const SizedBox(
                  height: 40,
                  width: double.infinity,
                  child: LoadingWidget(),
                );
              }
              return Container(
                height: 88,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                margin: const EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                    color: lightYellowColor,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      width: 1,
                      color: yellowColor,
                    )),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Anda belum terhubung ke\nfasilitas kesehatan",
                      style: bodyMedium(
                        sizeFont: 14,
                        colorFont: yellowColor,
                      ),
                    ),
                    OrangeButton(
                        contentText: "Hubungkan",
                        minimumSize: const Size(97, 48),
                        maximumSize: const Size(double.infinity, 48),
                        onPressedFunc: () =>
                            Navigator.pushNamed(context, medicalFacilityRoute))
                  ],
                ),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.only(top: 36, bottom: 2),
            child: Text(
              "Layanan Kami",
              style: heading1(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Text(
              "Berikut adalah layanan bantuan yang dapat Anda gunakan untuk mencegah stunting pada anak",
              style: bodyMedium(
                sizeFont: 14,
                colorFont: greyColor,
              ),
            ),
          ),
          GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            crossAxisCount: 2,
            children: List.generate(
                4,
                (index) => GestureDetector(
                      onTap: () => Navigator.pushNamed(
                          context, servicesConst[index]['routeTo']),
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              servicesConst[index]['color1'],
                              servicesConst[index]['color2']
                            ],
                            stops: const [0, 1],
                            transform:
                                const GradientRotation(316 * 3.14159 / 180),
                          ),
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromRGBO(0, 0, 0, 0.15),
                              blurRadius: 4,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              servicesConst[index]['image'],
                              width: 89,
                              height: 84,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: Text(
                                servicesConst[index]['title'],
                                style: heading1(
                                    sizeFont: 14, colorFont: whiteColor),
                              ),
                            )
                          ],
                        ),
                      ),
                    )),
          ),
        ]),
      ))),
    );
  }
}
