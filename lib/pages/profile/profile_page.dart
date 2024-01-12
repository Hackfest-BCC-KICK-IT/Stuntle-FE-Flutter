import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stuntle/config/color_theme.dart';
import 'package:stuntle/config/font_theme.dart';
import 'package:stuntle/config/route_name.dart';
import 'package:stuntle/cubit/auth/auth_cubit.dart';

import 'package:stuntle/data/constants/profile_cons.dart';
import 'package:stuntle/data/model/user.dart';
import 'package:stuntle/pages/widget/loading_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    context.read<AuthCubit>().isHasLogin();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenSize = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is Unathenticated) {
            Navigator.pushReplacementNamed(context, loginRoute);
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return const LoadingWidget();
          }
          return SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: screenSize,
                  height: screenSize * 0.4,
                  color: const Color(0xffFFCD8C),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30, bottom: 28),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            currUser.data.namaIbu,
                            style: heading1(sizeFont: 20),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          Text(
                            currUser.data.email,
                            style:
                                bodyMedium(sizeFont: 14, colorFont: greyColor),
                          )
                        ]),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 40,
                        ),
                        child: Text(
                          "Pengaturan Saya",
                          style: headline(
                            sizeFont: 22,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 500,
                        child: ListView.builder(
                          itemCount: profileService.length,
                          itemBuilder: (context, index) => GestureDetector(
                            onTap: () => {
                              if (profileService[index].route == loginRoute)
                                {
                                  context.read<AuthCubit>().logoutServices(),
                                }
                              else if (profileService[index].route !=
                                  aboutUsRoute)
                                {
                                  Navigator.pushNamed(
                                      context, profileService[index].route)
                                }
                            },
                            child: Container(
                                width: screenSize,
                                padding: const EdgeInsets.all(8),
                                margin: const EdgeInsets.only(bottom: 12),
                                height: 60,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: whiteColor,
                                  border: Border.all(
                                    color: borderGreyColor,
                                    width: 1,
                                  ),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Color.fromRGBO(0, 0, 0, 0.15),
                                      offset: Offset(0, 1),
                                      blurRadius: 8,
                                      spreadRadius: 0,
                                    ),
                                  ],
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(profileService[index].icon),
                                        const SizedBox(
                                          width: 12,
                                        ),
                                        Text(
                                          profileService[index].text,
                                          style: headline(sizeFont: 14),
                                        )
                                      ],
                                    ),
                                    const Icon(Icons.arrow_forward_ios_sharp)
                                  ],
                                )),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
