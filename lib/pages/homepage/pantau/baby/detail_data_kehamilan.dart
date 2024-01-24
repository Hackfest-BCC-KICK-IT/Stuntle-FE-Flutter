import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:stuntle/config/color_theme.dart';
import 'package:stuntle/config/font_theme.dart';
import 'package:stuntle/cubit/pregnancy/pregnancy_cubit.dart';
import 'package:stuntle/pages/homepage/pantau/baby/widgets/button_pemeriksaan.dart';
import 'package:stuntle/pages/widget/app_bar.dart';
import 'package:stuntle/pages/widget/loading_widget.dart';
import 'package:stuntle/pages/widget/outline_custom_button.dart';

class DetailDataKehamilan extends StatefulWidget {
  final List<dynamic>? id;
  const DetailDataKehamilan({
    Key? key,
    this.id,
  }) : super(key: key);

  @override
  State<DetailDataKehamilan> createState() => _DetailDataKehamilanState();
}

class _DetailDataKehamilanState extends State<DetailDataKehamilan> {
  @override
  void initState() {
    context.read<PregnancyCubit>().getDataPemeriksaan(widget.id!);
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
            "Data Kehamilan",
            style: heading1(),
          ),
          Text(
            "Berikut adalah riwayat data dari kehamilan yang Anda periksakan",
            style: bodyMedium(
              sizeFont: 14,
              colorFont: greyColor,
            ),
          ),
          BlocConsumer<PregnancyCubit, PregnancyState>(
            listener: (context, state) {
              if (state is PemeriksaanDataEror) {
                Navigator.pushReplacementNamed(
                  context,
                  "/eror",
                  arguments: state.text,
                );
              }
            },
            builder: (context, state) {
              if (state is PemeriksaanDataLoading) {
                return const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: LoadingWidget(),
                );
              } else if (state is PemeriksaanDataSuccess) {
                return ListView.builder(
                  itemCount: state.data.length,
                  shrinkWrap: true,
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return PemeriksaanButtonKehamilan(
                      text2: state.data[index].statusKehamilan!,
                      index: index,
                      text1: "Status Kehamilan: ",
                      data: state.data[index],
                    );
                  },
                );
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
        ],
      ),
    );
  }
}
