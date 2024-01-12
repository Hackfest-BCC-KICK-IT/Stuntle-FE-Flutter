import 'package:flutter/material.dart';
import 'package:stuntle/config/font_theme.dart';
import 'package:stuntle/config/route_name.dart';
import 'package:stuntle/pages/widget/orange_button.dart';

class ConnectedFaskesWidget extends StatelessWidget {
  const ConnectedFaskesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Anda Belum Terhubung Pada Fasilitas Kesehatan',
              style: heading1(),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              'Anda perlu terhubung pada fasilitas kesehatan agar dapat memantau kehamilanmu',
              style: bodyMedium(sizeFont: 14),
            ),
            const SizedBox(
              height: 16,
            ),
            OrangeButton(
              contentText: "Ayo Hubungkan",
              minimumSize: const Size(328, 48),
              maximumSize: const Size(double.infinity, 48),
              onPressedFunc: () =>
                  Navigator.pushReplacementNamed(context, medicalFacilityRoute),
            ),
          ],
        ),
      ),
    );
  }
}
