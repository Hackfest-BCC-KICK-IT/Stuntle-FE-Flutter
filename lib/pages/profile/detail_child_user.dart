import 'package:flutter/material.dart';
import 'package:stuntle/config/color_theme.dart';
import 'package:stuntle/config/font_theme.dart';
import 'package:stuntle/config/route_name.dart';
import 'package:stuntle/pages/widget/another_popup.dart';
import 'package:stuntle/pages/widget/app_bar.dart';
import 'package:stuntle/pages/widget/orange_button.dart';
import 'package:stuntle/pages/widget/outline_custom_button.dart';

class DetailChildUser extends StatelessWidget {
  const DetailChildUser({super.key});

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
                    "Data Anak",
                    style: heading1(sizeFont: 22),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Text(
                    "Nama: Arsya Ramadhan",
                    style: bodyMedium(sizeFont: 14),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Text(
                    "Tanggal Lahir: 22 Maret 2002",
                    style: bodyMedium(sizeFont: 14),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Text(
                    "Jenis Kelamin: Laki-Laki",
                    style: bodyMedium(sizeFont: 14),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Text(
                    "Kondisi Lahir: Sehat",
                    style: bodyMedium(sizeFont: 14),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Text(
                    "Berat Badan Lahir: 3kg",
                    style: bodyMedium(sizeFont: 14),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Text(
                    "Panjang Badan Lahir: 30cm",
                    style: bodyMedium(sizeFont: 14),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Text(
                    "Keliling Lingkar Kepala Lahir: 45cm",
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
                      contentText: "Edit Profil Anak",
                      minimumSize: const Size(328, 48),
                      maximumSize: const Size(double.infinity, 48),
                      onPressedFunc: () =>
                          Navigator.pushNamed(context, editChildData)),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomOutlineButton(
                    minimumSize: const Size(328, 48),
                    maximumSize: const Size(double.infinity, 48),
                    contentText: 'Hapus Profil Anak',
                    onTapFunc: () async {
                      await anotherPopUP(
                          context,
                          'Yakin Untuk Menghapus?',
                          'Jika Anda menghapus data profil dari anak Anda, maka seluruh data pemeriksaan yang ada pada anakmu juga akan terhapus',
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
                                Future.delayed(const Duration(milliseconds: 2))
                                    .then((value) => anotherPopUP(
                                            context,
                                            'Berhasil Terhapus',
                                            'Data profil anak Anda dan seluruh pemeriksaannya berhasil dihapus',
                                            [
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
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
