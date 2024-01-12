import 'package:flutter/material.dart';
import 'package:stuntle/config/color_theme.dart';
import 'package:stuntle/config/font_theme.dart';
import 'package:stuntle/config/route_name.dart';
import 'package:stuntle/pages/auth/widget/link_popup.dart';
import 'package:stuntle/pages/auth/widget/text_form.dart';
import 'package:stuntle/pages/widget/orange_button.dart';
import 'package:stuntle/pages/widget/outline_custom_button.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final TextEditingController _emailTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 62,
            horizontal: 16,
          ),
          child: Form(
            child: ListView(
              children: [
                // Show Logo Image
                Image.asset(
                  "assets/images/stuntle_logo.jpg",
                  width: 120,
                  height: 98,
                ),

                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Reset Kata Sandimu Disini",
                  style: heading1(),
                ),
                const SizedBox(
                  height: 2,
                ),
                Text(
                  "Masukkan alamat email yang didaftarkan pada akun tersebut",
                  style: bodyMedium(
                    colorFont: greyColor,
                    sizeFont: 14,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),

                //Email FLied for user
                TextForm(
                  textEditingController: _emailTextController,
                  hintText: "Email",
                  subText: "Pastikan alamat emailnya telah terverifikasi",
                ),

                //Reset  button
                OrangeButton(
                  maximumSize: const Size(double.infinity, 48),
                  minimumSize: const Size(270, 48),
                  contentText: "Reset Kata Sandi",
                  onPressedFunc: () async {
                    await linkPopUp(
                      context,
                      'Tautan Berhasil Terkirim',
                      'Silahkan ubah kata sandi Anda dengan mengklik tautan ubah kata sandi yang kami kirimkan pada email Anda',
                      'Ubah Sekarang',
                    );
                  },
                ),

                const SizedBox(
                  height: 20,
                ),
                CustomOutlineButton(
                  minimumSize: const Size(280, 48),
                  maximumSize: const Size(double.infinity, 48),
                  contentText: "Kembali Ke Menu Masuk",
                  onTapFunc: () =>
                      Navigator.pushReplacementNamed(context, loginRoute),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
