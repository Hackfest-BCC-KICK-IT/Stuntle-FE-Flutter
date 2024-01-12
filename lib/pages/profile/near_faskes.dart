import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stuntle/config/color_theme.dart';
import 'package:stuntle/config/font_theme.dart';
import 'package:stuntle/config/route_name.dart';
import 'package:stuntle/cubit/health/health_cubit.dart';
import 'package:stuntle/data/model/user.dart';
import 'package:stuntle/pages/widget/connected_faskes_widget.dart';
import 'package:stuntle/pages/widget/orange_button.dart';

class NearFaskesPage extends StatelessWidget {
  const NearFaskesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<HealthCubit, HealthState>(
      builder: (context, state) {
        if (state is HasConnectedFakes) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/images/terhubung.jpg"),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 25),
                child: Text(
                  "Akun Anda telah terhubung dengan \n${currUser.namaFaskes}",
                  style: bodyMedium(
                    sizeFont: 16,
                    colorFont: lightVioletColor,
                  ),
                ),
              ),
              OrangeButton(
                contentText: "Kembali",
                minimumSize: const Size(328, 48),
                maximumSize: const Size(double.infinity, 48),
                onPressedFunc: () =>
                    Navigator.pushReplacementNamed(context, appPagesRoute),
              )
            ],
          );
        }
        return const ConnectedFaskesWidget();
      },
    ));
  }
}
