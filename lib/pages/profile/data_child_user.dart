import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stuntle/config/route_name.dart';
import 'package:stuntle/cubit/child/child_cubit.dart';
import 'package:stuntle/cubit/health/health_cubit.dart';
import 'package:stuntle/pages/homepage/data_anak_tab.dart';
import 'package:stuntle/pages/widget/connected_faskes_widget.dart';
import 'package:stuntle/pages/widget/loading_widget.dart';

class DataChildUser extends StatefulWidget {
  const DataChildUser({super.key});

  @override
  State<DataChildUser> createState() => _DataChildUserState();
}

class _DataChildUserState extends State<DataChildUser> {
  @override
  void initState() {
    context.read<ChildCubit>().hasChildData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double screenSize = MediaQuery.sizeOf(context).width;
    return Scaffold(body: BlocBuilder<HealthCubit, HealthState>(
      builder: (context, state) {
        if (state is HasConnectedFakes) {
          return BlocBuilder<ChildCubit, ChildState>(
            builder: (context, state) {
              if (state is HasChildData) {
                return showProfileAnak(
                  screenSize,
                  context,
                  detailChildUser,
                  state.childData,
                );
              } else if (state is LoadingChildData) {
                return const LoadingWidget();
              }
              return const Center(
                child: Text("Tidak ada Data"),
              );
            },
          );
        }
        return const ConnectedFaskesWidget();
      },
    ));
  }
}
