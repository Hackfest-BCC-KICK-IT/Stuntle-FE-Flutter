import 'package:flutter/material.dart';

import 'package:stuntle/config/font_theme.dart';
import 'package:stuntle/data/model/help.dart';
import 'package:stuntle/data/model/user.dart';
import 'package:stuntle/pages/widget/app_bar.dart';

class DetailBantuanPage extends StatelessWidget {
  final HelpSubmit helpSubmit;
  const DetailBantuanPage({
    Key? key,
    required this.helpSubmit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, "Detail Bantuan"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 25,
              ),
              Text(
                "Detail Pengajuan",
                style: heading1(),
              ),
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 7,
              ),
              Text(
                "Judul Pengajuan: ${helpSubmit.title}",
                style: headline(sizeFont: 16),
              ),
              const SizedBox(
                height: 7,
              ),
              Text(
                "Deskripsi Pengajuan: ${helpSubmit.description}",
                style: headline(sizeFont: 16),
              ),
              const SizedBox(
                height: 7,
              ),
              Text(
                "Nama Pengaju: ${currUser.data.namaIbu}",
                style: headline(sizeFont: 16),
              ),
              const SizedBox(
                height: 25,
              ),
              Text(
                "Hasil Pengajuan",
                style: heading1(),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                helpSubmit.additionalMessages == ""
                    ? "Mohon untuk bersabar hingaa tenaga kesehatan fasilitas merespon ajuan anda"
                    : helpSubmit.additionalMessages,
                style: headline(sizeFont: 16),
              ),
              const SizedBox(
                height: 7,
              ),
              RichText(
                text: TextSpan(
                    text: 'Status Ajuanmu: ',
                    style: headline(sizeFont: 16),
                    children: [
                      TextSpan(
                        text: helpSubmit.statusHelp.text,
                        style: headline(
                          sizeFont: 16,
                          colorFont: helpSubmit.statusHelp.color,
                        ),
                      )
                    ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
