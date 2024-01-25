import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:stuntle/config/color_theme.dart';
import 'package:stuntle/config/font_theme.dart';
import 'package:stuntle/config/route_name.dart';
import 'package:stuntle/cubit/child/child_cubit.dart';

import 'package:stuntle/pages/homepage/pantau/widgets/acrodion.dart';
import 'package:stuntle/pages/homepage/pantau/widgets/grafik_pertumbuhan.dart';
import 'package:stuntle/pages/homepage/pantau/widgets/pemeriksaan_button.dart';

import 'package:stuntle/pages/widget/app_bar.dart';
import 'package:stuntle/pages/widget/loading_widget.dart';

import 'package:stuntle/pages/widget/orange_button.dart';
import 'package:stuntle/pages/widget/outline_custom_button.dart';

class DetailDataAnak extends StatefulWidget {
  final List<dynamic> ids;
  const DetailDataAnak({
    Key? key,
    required this.ids,
  }) : super(key: key);

  @override
  State<DetailDataAnak> createState() => _DetailDataAnakState();
}

class _DetailDataAnakState extends State<DetailDataAnak> {
  @override
  void initState() {
    context.read<ChildCubit>().fetchDataPemeriksaan(widget.ids);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, "Pantau"),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        children: [
          Text(
            "Kondisi Prediksi Anak oleh AI",
            style: heading1(),
          ),
          Text(
            "Berikut adalah kondisi prediksi awal oleh aplikasi kami berdasarkan seluruh data hasil pemeriksaan",
            style: bodyMedium(
              sizeFont: 14,
              colorFont: greyColor,
            ),
          ),

          //Acrodion hasil kondisi anak dari Ai
          const AccrodionKondisiAnak(),
          Text(
            "Grafik Pertumbuhan Anak",
            style: heading1(),
          ),
          Text(
            "Berikut adalah grafik pertumbuhan dari data tumbuh kembang anakmu",
            style: bodyMedium(
              sizeFont: 14,
              colorFont: greyColor,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          //grafik pertumbuhan anak
          const SizedBox(
            height: 370,
            child: GrafikPertumbuhanAnak(),
          ),
          Text(
            "Data Tumbuh Kembang Anak",
            style: heading1(),
          ),
          Text(
            "Berikut adalah riwayat data dari tumbuh kembang anak yang Anda periksakan",
            style: bodyMedium(
              sizeFont: 14,
              colorFont: greyColor,
            ),
          ),
          const SizedBox(
            height: 20,
          ),

          BlocConsumer<ChildCubit, ChildState>(
            listener: (context, state) {
              if (state is DataPemeriksaanEror) {
                Navigator.pushReplacementNamed(
                  context,
                  "/eror",
                  arguments: state.text,
                );
              }
            },
            builder: (context, state) {
              if (state is DataPemeriksaanLoading) {
                return const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: LoadingWidget(),
                );
              } else if (state is DataPemeriksaanSuccess) {
                {
                  return ListView.builder(
                    itemCount: state.data.length,
                    shrinkWrap: true,
                    physics: const AlwaysScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return PemeriksaanButtonChild(
                        index: index,
                        data: state.data[index],
                      );
                    },
                  );
                }
              }
              return const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text("NO DATA"),
              );
            },
          ),

          const SizedBox(
            height: 20,
          ),
          CustomOutlineButton(
            minimumSize: const Size(348, 48),
            maximumSize: const Size(double.infinity, 48),
            contentText: "Tampilkan Data Lebih Banyak",
            onTapFunc: () {},
          ),
          const SizedBox(
            height: 20,
          ),
          OrangeButton(
            contentText: "Tambahkan Data Pemeriksaan Mandiri",
            minimumSize: const Size(348, 48),
            maximumSize: const Size(double.infinity, 48),
            onPressedFunc: () => Navigator.pushNamed(
              context,
              addDataMandiri,
            ),
          ),
          const SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }
}
