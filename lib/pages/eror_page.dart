import 'package:flutter/material.dart';

import 'package:stuntle/config/font_theme.dart';
import 'package:stuntle/config/route_name.dart';
import 'package:stuntle/pages/widget/orange_button.dart';

class ErorPage extends StatelessWidget {
  const ErorPage({
    Key? key,
    this.erorText,
  }) : super(key: key);
  final String? erorText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "EROR PAGE",
              style: heading1(),
            ),
            const SizedBox(
              height: 15,
            ),

            //Message Eror
            Text(
              "Maaf sepertinya layanan saat ini tidak dapat diakses, coba sesaat lagi",
              style: bodyMedium(),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              "Dev eror : ${erorText ?? "tidak ada eror dev"}",
              style: bodyMedium(),
            ),
            const SizedBox(
              height: 25,
            ),
            OrangeButton(
                contentText: "Kembali Halaman Sebelum",
                minimumSize: const Size(348, 48),
                maximumSize: const Size(double.infinity, 48),
                onPressedFunc: () =>
                    Navigator.pushReplacementNamed(context, appPagesRoute)),
          ],
        ),
      ),
    );
  }
}
