import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stuntle/config/color_theme.dart';
import 'package:stuntle/config/font_theme.dart';
import 'package:stuntle/config/route_name.dart';
import 'package:stuntle/cubit/health/health_cubit.dart';
import 'package:stuntle/cubit/pregnancy/pregnancy_cubit.dart';
import 'package:stuntle/pages/auth/widget/text_form.dart';
import 'package:stuntle/pages/widget/connected_faskes_widget.dart';
import 'package:stuntle/pages/widget/custom_date_picker.dart';
import 'package:stuntle/pages/widget/loading_widget.dart';
import 'package:stuntle/pages/widget/orange_button.dart';
import 'package:stuntle/pages/widget/outline_custom_button.dart';

class PantauKehamilanTab extends StatefulWidget {
  const PantauKehamilanTab({Key? key}) : super(key: key);

  @override
  State<PantauKehamilanTab> createState() => _PantauKehamilanTabState();
}

class _PantauKehamilanTabState extends State<PantauKehamilanTab> {
  final TextEditingController _nameTextController = TextEditingController();
  String? _selectedHaidDate;

  void _handleHaidDateSelected(String? date) {
    setState(() {
      _selectedHaidDate = date;
    });
  }

  @override
  void dispose() {
    super.dispose();
    _nameTextController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HealthCubit, HealthState>(
      builder: (context, state) {
        if (state is HasConnectedFakes) {
          return BlocConsumer<PregnancyCubit, PregnancyState>(
            listener: (context, state) {
              if (state is AddPregnancyDataEror) {
                Navigator.pushReplacementNamed(context, "/eror",
                    arguments: state.text);
              }
            },
            builder: (context, state) {
              if (state is LoadingPregnancyData) {
                return const LoadingWidget();
              } else if (state is HasPregnancyData) {
                return showDataKehamilan(
                    context,
                    state.prenangcyData.namaCalonBayi,
                    state.prenangcyData.tanggalPertamaHaid.toString(),
                    periksaHamilRoute);
              } else if (state is AddPregnancyDataSuccess) {
                return showDataKehamilan(
                    context,
                    state.dataPrenangcy.namaCalonBayi,
                    state.dataPrenangcy.tanggalPertamaHaid.toString(),
                    periksaHamilRoute);
              }

              return addDataKehamilan(_nameTextController);
            },
          );
        }
        return const ConnectedFaskesWidget();
      },
    );
  }

  Widget addDataKehamilan(TextEditingController textEditingController) =>
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 14),
              child: Text(
                "Tambahkan Data Kehamilan",
                style: heading1(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: Image.asset("assets/images/hamil.jpg"),
            ),
            TextForm(
              textEditingController: textEditingController,
              hintText: 'Nama Calon Bayi',
              subText: 'Masukkan nama calon bayi Anda',
            ),
            CustomDatePicker(
              subTitlel: 'Pilih tanggal hari pertama dari haid terakhir Anda',
              title: 'Hari Pertama Haid Terakhir',
              onDateSelected: _handleHaidDateSelected,
            ),
            SizedBox(
              width: double.infinity,
              child: OrangeButton(
                contentText: "Simpan",
                minimumSize: const Size(328, 48),
                maximumSize: const Size(double.infinity, 48),
                onPressedFunc: () {
                  if (textEditingController.text.isNotEmpty &&
                      _selectedHaidDate != null) {
                    context.read<PregnancyCubit>().addPrenagcyData(
                        textEditingController.text,
                        _selectedHaidDate.toString());
                  }
                },
              ),
            ),
            const SizedBox(
              height: 15,
            ),
          ],
        ),
      );
}

Widget showDataKehamilan(
  BuildContext ctx,
  String? name,
  String date,
  String route,
) =>
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 34),
            child: Text(
              "Profil Kehamilan Saya",
              style: heading1(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 2,
              bottom: 16,
            ),
            child: Text(
              'Berikut adalah profil dari calon bayimu',
              style: bodyMedium(sizeFont: 14, colorFont: greyColor),
            ),
          ),
          CustomOutlineButton(
            minimumSize: const Size(318, 48),
            maximumSize: const Size(double.infinity, 48),
            onTapFunc: () => Navigator.pushNamed(ctx, route, arguments: name),
            childWidget: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "$name",
                  style: headline(
                    sizeFont: 14,
                    colorFont: violetColor,
                  ),
                ),
                const Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: greyColor,
                  size: 20,
                )
              ],
            ),
          )
        ],
      ),
    );
