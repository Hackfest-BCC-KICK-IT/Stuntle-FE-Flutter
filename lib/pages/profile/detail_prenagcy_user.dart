import 'package:flutter/material.dart';

import 'package:stuntle/config/color_theme.dart';
import 'package:stuntle/config/font_theme.dart';
import 'package:stuntle/config/route_name.dart';
import 'package:stuntle/pages/widget/another_popup.dart';
import 'package:stuntle/pages/widget/app_bar.dart';
import 'package:stuntle/pages/widget/orange_button.dart';
import 'package:stuntle/pages/widget/outline_custom_button.dart';

class DetailPrenagcyUser extends StatelessWidget {
  final String name;

  const DetailPrenagcyUser({
    Key? key,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, 'Data Profil Kehamilan/Anak Saya'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 5),
                  child: Text(
                    "Data Calon Bayi",
                    style: heading1(sizeFont: 22),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Text(
                    "Nama: $name",
                    style: bodyMedium(sizeFont: 14),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Text(
                    "Hari Estimasi Lahir: 27 Oktober 2023",
                    style: bodyMedium(sizeFont: 14),
                  ),
                ),
              ],
            )),
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                children: [
                  OrangeButton(
                      contentText: "Edit Profil Calon Bayi",
                      minimumSize: const Size(328, 48),
                      maximumSize: const Size(double.infinity, 48),
                      onPressedFunc: () =>
                          Navigator.pushNamed(context, editPrenacgyData)),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomOutlineButton(
                    minimumSize: const Size(328, 48),
                    maximumSize: const Size(double.infinity, 48),
                    contentText: 'Hapus Profil Calon Bayi',
                    onTapFunc: () async {
                      await anotherPopUP(
                          context,
                          'Yakin Untuk Menghapus?',
                          'Jika Anda menghapus data profil dari calon bayi Anda, maka seluruh data pemeriksaan yang ada pada calon bayimu juga akan terhapus',
                          [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                "Batalkan",
                                style: headline(
                                  colorFont: violetColor,
                                  sizeFont: 14,
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () async {
                                Navigator.pop(context);
                                // context
                                //     .read<PregnancyCubit>()
                                //     .removePrenangcyData();
                                Future.delayed(const Duration(milliseconds: 2))
                                    .then((value) => anotherPopUP(
                                            context,
                                            'Berhasil Terhapus',
                                            'Data profil calon bayi Anda dan seluruh pemeriksaannya berhasil dihapus',
                                            [
                                              TextButton(
                                                onPressed: () {
                                                  Navigator
                                                      .pushReplacementNamed(
                                                          context,
                                                          appPagesRoute);
                                                },
                                                child: Text(
                                                  "Oke",
                                                  style: headline(
                                                    colorFont: violetColor,
                                                    sizeFont: 14,
                                                  ),
                                                ),
                                              ),
                                            ]));
                              },
                              child: Text(
                                "Lanjutkan",
                                style: headline(
                                  colorFont: violetColor,
                                  sizeFont: 14,
                                ),
                              ),
                            ),
                          ]);
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
