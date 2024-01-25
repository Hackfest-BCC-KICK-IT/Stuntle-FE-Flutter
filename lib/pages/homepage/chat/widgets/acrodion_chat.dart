import 'package:flutter/material.dart';
import 'package:stuntle/config/color_theme.dart';
import 'package:stuntle/config/font_theme.dart';

class AcrodionChat extends StatelessWidget {
  const AcrodionChat({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width * 0.7,
      ),
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ExpansionTile(
        title: Row(
          children: [
            const Icon(
              Icons.chat_bubble_outline_sharp,
              color: blueColor,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              "Tanya Cepat",
              style: heading1(
                colorFont: blackColor,
                sizeFont: 14,
              ),
            ),
          ],
        ),
        children: [
          ListTile(
            title: itemBuilder(
              Icons.favorite_border_sharp,
              "Saya ingin konsultasi terkait kehamilan saya",
            ),
            onTap: () {
              // Handle Item 1 tap
            },
          ),
          ListTile(
            title: itemBuilder(
              Icons.child_care,
              "Saya ingin konsultasi terkait tumbuh kembang anak saya",
            ),
            onTap: () {
              // Handle Item 2 tap
            },
          ),
          ListTile(
            title: itemBuilder(
              Icons.health_and_safety_outlined,
              "Saya ingin konsultasi terkait Keluarga Berencana",
            ),
            onTap: () {
              // Handle Item 3 tap
            },
          ),
          ListTile(
            title: itemBuilder(
              Icons.trending_down_sharp,
              "Kenapa Tumbuh anak melambat?",
            ),
            onTap: () {
              // Handle Item 4 tap
            },
          ),
        ],
      ),
    );
  }

  Widget itemBuilder(
    IconData icon,
    String text,
  ) =>
      Row(
        children: [
          Icon(
            icon,
            color: blueColor,
          ),
          const SizedBox(
            width: 10,
          ),
          Flexible(
            child: Text(
              text,
              style: bodyMedium(
                colorFont: blackColor,
                sizeFont: 14,
              ),
              softWrap: true,
            ),
          ),
        ],
      );
}
