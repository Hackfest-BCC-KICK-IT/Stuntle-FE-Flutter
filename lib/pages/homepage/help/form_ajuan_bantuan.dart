import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stuntle/config/color_theme.dart';
import 'package:stuntle/config/font_theme.dart';
import 'package:stuntle/cubit/help/help_cubit.dart';
import 'package:stuntle/data/model/help.dart';
import 'package:stuntle/pages/auth/widget/text_form.dart';
import 'package:stuntle/pages/widget/app_bar.dart';
import 'package:stuntle/pages/widget/orange_button.dart';
import 'package:stuntle/pages/widget/outline_custom_button.dart';

import '../../../config/route_name.dart';
import '../../widget/loading_widget.dart';

class FormAjuanBantuanPage extends StatefulWidget {
  const FormAjuanBantuanPage({super.key});

  @override
  State<FormAjuanBantuanPage> createState() => _FormAjuanBantuanPageState();
}

class _FormAjuanBantuanPageState extends State<FormAjuanBantuanPage> {
  final TextEditingController _judulTextController = TextEditingController();
  final TextEditingController _descriptionTextController =
      TextEditingController();

  @override
  void dispose() {
    _judulTextController.dispose();
    _descriptionTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, 'Ajukan'),
      body: BlocConsumer<HelpCubit, HelpState>(
        listener: (context, state) {
          if (state is AddHelpEror) {
            Navigator.pushNamed(context, "/eror", arguments: state.text);
          } else if (state is AddHelpSuccess) {
            Navigator.pushReplacementNamed(context, bantuanPage);
          }
        },
        builder: (context, state) {
          if (state is AddHelpLoading) {
            return const LoadingWidget();
          }
          return SingleChildScrollView(
              child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 24, top: 8),
                  child: Text(
                    'Lengkapi Form Pengajuan',
                    style: heading1(),
                  ),
                ),
                TextForm(
                    textEditingController: _judulTextController,
                    hintText: 'Judul Pengajuan',
                    subText: 'Masukkan judul dari pengajuan bantuan Anda'),
                Container(
                  height: 300,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: borderGreyColor,
                      width: 1,
                    ),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Expanded(
                        child: TextField(
                          controller: _descriptionTextController,
                          decoration: const InputDecoration(
                            contentPadding:
                                EdgeInsets.only(left: 16, top: 8, bottom: 8),
                            hintText: 'Deskripsi Pengajuan',
                          ),
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          expands: true,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Masukkan deskripsi dari pengajuan bantuan Anda",
                  style: bodyMedium(
                    sizeFont: 14,
                    colorFont: greyColor,
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: OrangeButton(
                          contentText: "Simpan Perubahan",
                          minimumSize: const Size(328, 48),
                          maximumSize: const Size(double.infinity, 48),
                          onPressedFunc: () => context
                              .read<HelpCubit>()
                              .addHelpData(
                                HelpSubmit(
                                  additionalMessages: ' ',
                                  description: _descriptionTextController.text,
                                  statusHelp: StatusHelpType.process,
                                  title: _judulTextController.text,
                                ),
                              ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: CustomOutlineButton(
                            minimumSize: const Size(328, 48),
                            maximumSize: const Size(double.infinity, 48),
                            contentText: 'Batalkan Perubahan',
                            onTapFunc: () => Navigator.pop(context)),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ));
        },
      ),
    );
  }
}
