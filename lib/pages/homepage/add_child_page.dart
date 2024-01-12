import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stuntle/config/font_theme.dart';
import 'package:stuntle/config/route_name.dart';
import 'package:stuntle/cubit/child/child_cubit.dart';
import 'package:stuntle/pages/widget/add_data_anak.dart';
import 'package:stuntle/pages/widget/app_bar.dart';

class AddChildPage extends StatelessWidget {
  const AddChildPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppBar(context, "Tambah Data Anak"),
        body: BlocConsumer<ChildCubit, ChildState>(
          listener: (context, state) {
            if (state is AddChildDataSuccess) {
              Navigator.pushReplacementNamed(context, pantauAnakRoute);
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
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
          },
        ));
  }
}
