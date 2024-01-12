import 'package:flutter/material.dart';
import 'package:stuntle/config/color_theme.dart';
import 'package:stuntle/config/font_theme.dart';
import 'package:stuntle/pages/auth/widget/text_form.dart';
import 'package:stuntle/pages/widget/another_popup.dart';
import 'package:stuntle/pages/widget/app_bar.dart';
import 'package:stuntle/pages/widget/custom_date_picker.dart';
import 'package:stuntle/pages/widget/custom_dropdown.dart';
import 'package:stuntle/pages/widget/orange_button.dart';
import 'package:stuntle/pages/widget/outline_custom_button.dart';

class EditChildData extends StatefulWidget {
  const EditChildData({super.key});

  @override
  State<EditChildData> createState() => _EditChildDataState();
}

class _EditChildDataState extends State<EditChildData> {
  final TextEditingController _nameTextController = TextEditingController();
  final TextEditingController _weightTextController = TextEditingController();
  final TextEditingController _longTextController = TextEditingController();
  final TextEditingController _headBabyTextController = TextEditingController();

  @override
  void dispose() {
    _nameTextController.dispose();
    _weightTextController.dispose();
    _longTextController.dispose();
    _headBabyTextController.dispose();
    super.dispose();
  }

  String? _selectedDate;

  void handlDateSelected(String? date) {
    setState(() {
      _selectedDate = date;
    });
  }

  String? _selectedChildGender;
  String? _selectedChildCondition;

  void _handleChildGenderSelected(String? value) {
    setState(() {
      _selectedChildGender = value;
    });
  }

  void _handleChildConditionSelected(String? value) {
    setState(() {
      _selectedChildCondition = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppBar(context, 'Data Profil Kehamilan/Anak Saya'),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Column(
                  children: [
                    Text(
                      "Edit Data Kehamilan",
                      style: heading1(),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 24),
                      child: Image.asset("assets/images/hamil2.jpg"),
                    ),

                    //name flied
                    TextForm(
                        textEditingController: _nameTextController,
                        hintText: 'Nama Anak',
                        subText: 'Masukkan nama anak Anda'),

                    CustomDatePicker(
                      title: 'Tanggal Lahir Anak',
                      subTitlel: 'Pilih tanggal lahir dari anak Anda',
                      onDateSelected: handlDateSelected,
                    ),

                    //dropdown child gender
                    CustomDropDown(
                      data: const ["Laki-Laki", "Perempuan"],
                      labelText: 'Laki-Laki',
                      subText: 'Pilih jenis kelamin dari anak Anda',
                      onValueSelected: _handleChildGenderSelected,
                    ),

                    //kondisi lahir anak
                    CustomDropDown(
                      data: const ["Sehat", "Prematur", "Terkena Virus"],
                      labelText: 'Kondisi Lahir',
                      subText: 'Pilih kondisi lahir dari anak Anda',
                      onValueSelected: _handleChildConditionSelected,
                    ),

                    //berat badan anak
                    TextForm(
                        textEditingController: _weightTextController,
                        hintText: 'Berat Badan Lahir',
                        subText: 'Masukkan berat badan lahir anak dalam kg'),

                    //panjang badan anak
                    TextForm(
                        textEditingController: _longTextController,
                        hintText: 'Panjang Badan Lahir',
                        subText: 'Masukkan panjang badan lahir anak dalam cm'),

                    //lingkar anak
                    TextForm(
                        textEditingController: _headBabyTextController,
                        hintText: 'Lingkar Kepala',
                        subText: 'Masukkan keliling lingkar kepala dalam cm')
                  ],
                ),
                const SizedBox(
                  height: 30,
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
                          await anotherPopUP(
                              context,
                              'Perubahan Tersimpan',
                              'Perubahan profil data pada calon bayi Anda berhasil dilakukan dan telah tersimpan',
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
          ),
        ));
  }
}
