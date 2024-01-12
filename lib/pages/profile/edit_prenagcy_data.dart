import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stuntle/config/color_theme.dart';
import 'package:stuntle/config/font_theme.dart';
import 'package:stuntle/config/route_name.dart';
import 'package:stuntle/cubit/pregnancy/pregnancy_cubit.dart';

import 'package:stuntle/pages/auth/widget/text_form.dart';
import 'package:stuntle/pages/widget/another_popup.dart';
import 'package:stuntle/pages/widget/app_bar.dart';
import 'package:stuntle/pages/widget/custom_date_picker.dart';
import 'package:stuntle/pages/widget/orange_button.dart';
import 'package:stuntle/pages/widget/outline_custom_button.dart';

class EditPrenagcyData extends StatefulWidget {
  const EditPrenagcyData({super.key});

  @override
  State<EditPrenagcyData> createState() => _EditPrenagcyDataState();
}

class _EditPrenagcyDataState extends State<EditPrenagcyData> {
  final TextEditingController _nameTextController = TextEditingController();

  String titleDatePicker = 'Hari Pertama Haid Terakhir';

  String? _selectedDate;

  @override
  void initState() {
    context.read<PregnancyCubit>().hasPrenangcyData();
    super.initState();
  }

  void handlDateSelected(String? date) {
    setState(() {
      _selectedDate = date;
    });
  }

  @override
  void dispose() {
    super.dispose();
    _nameTextController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: customAppBar(context, 'Data Profil Kehamilan/Anak Saya'),
        body: BlocListener<PregnancyCubit, PregnancyState>(
            listener: (context, state) {
              if (state is HasPregnancyData) {
                _nameTextController.text =
                    state.prenangcyData.namaCalonBayi.toString();
                titleDatePicker =
                    state.prenangcyData.tanggalPertamaHaid.toString();
              }
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 14),
                          child: Text(
                            "Edit Data Kehamilan",
                            style: heading1(),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 24),
                          child: Image.asset("assets/images/hamil.jpg"),
                        ),
                        TextForm(
                          textEditingController: _nameTextController,
                          hintText: 'Nama Calon Bayi',
                          subText: 'Masukkan nama calon bayi Anda',
                        ),
                        CustomDatePicker(
                          subTitlel:
                              'Pilih tanggal hari pertama dari haid terakhir Anda',
                          title: titleDatePicker,
                          onDateSelected: handlDateSelected,
                        )
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      children: [
                        OrangeButton(
                          contentText: "Simpan Perubahan",
                          minimumSize: const Size(328, 48),
                          maximumSize: const Size(double.infinity, 48),
                          onPressedFunc: () async {
                            context.read<PregnancyCubit>().addPrenagcyData(
                                _nameTextController.text,
                                _selectedDate.toString());
                            await anotherPopUP(
                                context,
                                'Perubahan Tersimpan',
                                'Perubahan profil data pada calon bayi Anda berhasil dilakukan dan telah tersimpan',
                                [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pushReplacementNamed(
                                          context, appPagesRoute);
                                    },
                                    child: Text(
                                      "Oke",
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
                          height: 10,
                        ),
                        CustomOutlineButton(
                            minimumSize: const Size(328, 48),
                            maximumSize: const Size(double.infinity, 48),
                            contentText: 'Batalkan Perubahan',
                            onTapFunc: () => Navigator.pop(context)),
                        const SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )));
  }
}
