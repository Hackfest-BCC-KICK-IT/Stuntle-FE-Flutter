import 'package:flutter/material.dart';
import 'package:stuntle/config/color_theme.dart';
import 'package:stuntle/config/font_theme.dart';
import 'package:stuntle/pages/auth/widget/tap_text.dart';

class AccrodionKondisiAnak extends StatelessWidget {
  const AccrodionKondisiAnak({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: whiteColor,
      margin: const EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
          side: const BorderSide(color: greyColor, width: 1)),
      child: ExpansionTile(
        backgroundColor: whiteColor,
        trailing: const Material(
          color: orangeColor,
          shape: CircleBorder(),
          child: Padding(
            padding: EdgeInsets.all(4.0),
            child: Icon(
              Icons.keyboard_arrow_down_rounded,
              color: whiteColor,
            ),
          ),
        ),
        title: const Row(
          children: [
            Material(
              color: orangeColor,
              borderRadius: BorderRadius.all(
                Radius.circular(12),
              ),
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(
                  Icons.lightbulb_outline_rounded,
                  color: whiteColor,
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TapText(
                  text1: "Tinggi anak ",
                  text2: "normal bawah",
                  text2Color: greenColor,
                ),
                SizedBox(
                  height: 4,
                ),
                TapText(
                  text1:
                      "Tingkatkan kebutuhan nutrisinya\nagar tingginya menjadi ",
                  text2: "“ideal”",
                  text2Color: greenColor,
                  textAlign: TextAlign.start,
                )
              ],
            ),
          ],
        ),
        children: [
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Interpretasi : ",
                style: headline(
                  sizeFont: 14,
                  colorFont: blackColor,
                ),
              ),
              Material(
                color: lightGreenColor,
                shape: const StadiumBorder(),
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Tinggi normal bawah",
                      style: headline(
                        sizeFont: 16,
                        colorFont: greenColor,
                      ),
                    )),
              ),
            ],
          ),
          Card(
            margin: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 10,
            ),
            child: Material(
              color: lightYellowColor,
              borderRadius: BorderRadius.circular(8),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 12,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    columnText("Data", "27 Jun 2023"),
                    columnText("Usia", "0T 3B 2H"),
                    columnText("Tinggi Terbaru", "57.3 cm"),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 16,
              right: 16,
              bottom: 16,
              top: 12,
            ),
            child: Text(
              "Tinggi terbaru anakmu saat ini berada di level normal bawah dimana tinggi badan ideal untuk usia anakmu adalah 60 - 62,5 cm. Pastikan kebutuhan protein, Kalsium, dan Vitamin D nya cukup.",
              style: bodyMedium(
                colorFont: blackColor,
                sizeFont: 12,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget columnText(String title, String data) => Column(
        children: [
          Text(
            title,
            style: bodyMedium(
              colorFont: blackColor,
              sizeFont: 12,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            data,
            style: headline(
              sizeFont: 12,
              colorFont: blackColor,
            ),
          ),
        ],
      );
}
