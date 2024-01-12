import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stuntle/config/color_theme.dart';
import 'package:stuntle/config/font_theme.dart';
import 'package:stuntle/config/route_name.dart';
import 'package:stuntle/cubit/child/child_cubit.dart';
import 'package:stuntle/cubit/health/health_cubit.dart';
import 'package:stuntle/data/model/child_data.dart';
import 'package:stuntle/pages/widget/add_data_anak.dart';
import 'package:stuntle/pages/widget/connected_faskes_widget.dart';
import 'package:stuntle/pages/widget/loading_widget.dart';
import 'package:stuntle/pages/widget/orange_button.dart';
import 'package:stuntle/pages/widget/outline_custom_button.dart';

class DataAnakTab extends StatefulWidget {
  const DataAnakTab({super.key});

  @override
  State<DataAnakTab> createState() => _DataAnakTabState();
}

class _DataAnakTabState extends State<DataAnakTab> {
  @override
  Widget build(BuildContext context) {
    final double screenSize = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: BlocBuilder<HealthCubit, HealthState>(
        builder: (context, state) {
          if (state is HasConnectedFakes) {
            return BlocConsumer<ChildCubit, ChildState>(
              listener: (context, state) {
                if (state is ErorChildData) {
                  Navigator.pushReplacementNamed(context, "/eror",
                      arguments: state.text);
                }
              },
              builder: (context, state) {
                if (state is HasChildData) {
                  return showProfileAnak(
                      screenSize, context, periksaAnakRoute, state.childData);
                } else if (state is AddChildDataSuccess) {
                  context.read<ChildCubit>().hasChildData();
                } else if (state is AddChildDataLoading ||
                    state is LoadingChildData) {
                  return const LoadingWidget();
                }
                return addDataChildUser();
              },
            );
          }
          return const ConnectedFaskesWidget();
        },
      ),
    );
  }

  Widget addDataChildUser() => SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Text(
                "Tambahkan Data Anak",
                style: heading1(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24),
                child: Image.asset("assets/images/hamil2.jpg"),
              ),
              const AddDataAnakWidget(),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      );
}

Widget showProfileAnak(
  double screen,
  BuildContext ctx,
  String route,
  List<Child?> data,
) =>
    Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Text(
              "Profil Anak Saya",
              style: heading1(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 2,
              bottom: 16,
            ),
            child: Text(
              'Berikut adalah profil dari anak-anakmu, jika Anda punya anak lagi, Anda dapat menambahkan datanya dengan menekan tombol oren dibawah',
              style: bodyMedium(sizeFont: 14, colorFont: greyColor),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: CustomOutlineButton(
                    minimumSize: const Size(318, 48),
                    maximumSize: const Size(double.infinity, 48),
                    onTapFunc: () => Navigator.pushNamed(ctx, route),
                    childWidget: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          data[index]!.namaAnak,
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
                  ),
                );
              },
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          SizedBox(
            width: double.infinity,
            child: OrangeButton(
              contentText: 'Tambah Data Anak Lagi',
              minimumSize: const Size(328, 48),
              maximumSize: Size(screen, 48),
              onPressedFunc: () => Navigator.pushNamed(ctx, addDataChild),
            ),
          )
        ],
      ),
    );
