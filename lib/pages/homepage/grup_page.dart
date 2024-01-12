import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stuntle/config/color_theme.dart';
import 'package:stuntle/config/font_theme.dart';
import 'package:stuntle/cubit/grup/grup_cubit.dart';
import 'package:stuntle/pages/widget/app_bar.dart';
import 'package:stuntle/pages/widget/loading_widget.dart';
import 'package:stuntle/pages/widget/orange_button.dart';
import 'package:url_launcher/url_launcher.dart';

class GrupPage extends StatefulWidget {
  const GrupPage({super.key});

  @override
  State<GrupPage> createState() => _GrupPageState();
}

class _GrupPageState extends State<GrupPage> {
  Future<void> _launchInBrowser(String url) async {
    if (!await launchUrl(
      Uri.parse(url),
      mode: LaunchMode.inAppWebView,
    )) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, 'Grup'),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Pilihan Grup Whatsapp',
              style: heading1(),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              'Berikut adalah pilihan Grup Whatsapp yang dapat kamu pilih untuk bergabung, agar ga ketinggalan informasi dari fasilitas kesehatan yang terhubung',
              style: bodyMedium(sizeFont: 14, colorFont: greyColor),
            ),
            const SizedBox(
              height: 8,
            ),
            Expanded(
              child: BlocConsumer<GrupCubit, GrupState>(
                listener: (context, state) {
                  if (state is GrupEror) {
                    Navigator.pushNamed(context, "/eror",
                        arguments: state.text);
                  }
                },
                builder: (context, state) {
                  if (state is GrupLoading) {
                    return const LoadingWidget();
                  } else if (state is GrupSucces) {
                    return ListView.builder(
                      itemCount: state.listGrup.length,
                      itemBuilder: (context, index) => Container(
                        margin: const EdgeInsets.symmetric(vertical: 16),
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 16),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(color: violetColor)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              flex: 1,
                              child: Text(
                                state.listGrup[index].namaGrup,
                                style: headline(
                                  sizeFont: 14,
                                  colorFont: violetColor,
                                ),
                              ),
                            ),
                            OrangeButton(
                              contentText: 'Gabung',
                              minimumSize: const Size(100, 40),
                              maximumSize: const Size(double.infinity, 40),
                              onPressedFunc: () => _launchInBrowser(
                                  state.listGrup[index].linkGrup),
                            )
                          ],
                        ),
                      ),
                    );
                  }
                  return Center(
                    child: Text(
                      "Saat ini pukesmas belum membuat grup",
                      style: bodyMedium(sizeFont: 14),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
