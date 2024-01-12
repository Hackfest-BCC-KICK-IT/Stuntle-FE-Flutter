import 'package:flutter/material.dart';
import 'package:stuntle/config/route_name.dart';
import 'package:stuntle/pages/auth/widget/text_form.dart';
import 'package:stuntle/pages/widget/app_bar.dart';
import 'package:stuntle/pages/widget/orange_button.dart';

class ProfileUser extends StatelessWidget {
  const ProfileUser({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController _firstNameController = TextEditingController();
    TextEditingController _lastNameController = TextEditingController();
    TextEditingController _emailNameController = TextEditingController();
    TextEditingController _numberNameController = TextEditingController();
    return Scaffold(
        appBar: customAppBar(context, 'Akun Saya'),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                TextForm(
                    textEditingController: _firstNameController,
                    hintText: 'Masukan Nama Depan',
                    subText: 'Masukkan sesuai dengan nama anda di KTP'),
                TextForm(
                    textEditingController: _lastNameController,
                    hintText: 'Masukan Nama Belakang',
                    subText: 'Masukkan sesuai dengan nama anda di KTP'),
                TextForm(
                    textEditingController: _emailNameController,
                    hintText: 'Masukan Email Anda',
                    subText: 'Masukkan alamat email aktif anda'),
                TextForm(
                    textEditingController: _numberNameController,
                    hintText: 'Masukan Nomor Telepon Anda',
                    subText: 'Masukkan nomor telepon aktif Anda'),
                const SizedBox(
                  height: 20,
                ),
                OrangeButton(
                  contentText: 'Simpan Perubahan',
                  minimumSize: const Size(348, 48),
                  maximumSize: const Size(double.infinity, 48),
                  onPressedFunc: () =>
                      Navigator.pushReplacementNamed(context, appPagesRoute),
                )
              ],
            ),
          ),
        ));
  }
}
