import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stuntle/config/color_theme.dart';
import 'package:stuntle/config/font_theme.dart';
import 'package:stuntle/config/route_name.dart';
import 'package:stuntle/cubit/auth/auth_cubit.dart';
import 'package:stuntle/cubit/health/health_cubit.dart';
import 'package:stuntle/pages/auth/widget/password_form.dart';
import 'package:stuntle/pages/auth/widget/tap_text.dart';
import 'package:stuntle/pages/auth/widget/text_form.dart';
import 'package:stuntle/pages/widget/loading_widget.dart';
import 'package:stuntle/pages/widget/orange_button.dart';
import 'package:stuntle/pages/widget/outline_custom_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  bool showEror = false;

  @override
  void dispose() {
    _emailTextController.dispose();
    _passwordTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthSucess) {
              context.read<HealthCubit>().isConnextedFakes();
              Navigator.pushReplacementNamed(context, appPagesRoute);
            } else if (state is AuthEror) {
              setState(() {
                showEror = true;
              });
            }
          },
          builder: (context, state) {
            if (state is AuthLoading) {
              return const LoadingWidget();
            }
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 62,
                  horizontal: 16,
                ),
                child: Form(
                  child: Column(
                    children: [
                      // Show Logo Image
                      Image.asset(
                        "assets/images/stuntle_logo.jpg",
                        width: 120,
                        height: 98,
                      ),

                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Selamat Datang",
                        style: heading1(),
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Text(
                        "Masuk ke akun Anda untuk dapat menggunakan layanan kami",
                        style: bodyMedium(
                          colorFont: greyColor,
                          sizeFont: 14,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),

                      //Email Field for user
                      TextForm(
                        textEditingController: _emailTextController,
                        hintText: "Email",
                        subText: "Pastikan alamat emailnya telah terverifikasi",
                      ),

                      //Password Field for user
                      PasswordForm(
                        textEditingController: _passwordTextController,
                        hintText: "Kata Sandi",
                        subText: "Pastikan kata sandi yang dimasukkan benar",
                      ),

                      //Forgot Password Text
                      SizedBox(
                        width: double.infinity,
                        child: TapText(
                          text1: null,
                          text2: "Lupa Kata Sandi?",
                          textAlign: TextAlign.end,
                          padding: 16,
                          onTapFunc: () {
                            Navigator.pushNamed(context, forgotPasswordRoute);
                          },
                        ),
                      ),

                      //Error message for wrong email or password
                      Visibility(
                        visible: showEror,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 16, bottom: 20),
                          child: Text(
                            "Maaf, email atau kata sandi yang Anda masukkan salah",
                            style: bodyMedium(
                              colorFont: erorColor,
                              sizeFont: 12,
                            ),
                          ),
                        ),
                      ),

                      //Login Button
                      OrangeButton(
                        minimumSize: const Size(double.infinity, 48),
                        maximumSize: const Size(double.infinity, 48),
                        contentText: "Masuk",
                        onPressedFunc: () {
                          if (_emailTextController.text.isEmpty &&
                              _passwordTextController.text.isEmpty) {
                            setState(() {
                              showEror = true;
                            });
                          } else {
                            context.read<AuthCubit>().loginServices(
                                _emailTextController.text,
                                _passwordTextController.text);
                          }
                        },
                      ),

                      const TapText(
                        text1: "Atau masuk dengan",
                        text2: null,
                        padding: 20,
                      ),

                      //Sign in with Google
                      CustomOutlineButton(
                        minimumSize: const Size(280, 48),
                        maximumSize: const Size(double.infinity, 48),
                        childWidget: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/images/google.svg",
                              width: 20,
                              height: 20,
                            ),
                            const SizedBox(
                              width: 24,
                            ),
                            Text(
                              "Masuk dengan Google",
                              style: headline(
                                sizeFont: 14,
                                colorFont: lightVioletColor,
                              ),
                            ),
                          ],
                        ),
                      ),

                      //Tap Text
                      TapText(
                        text1: "Belum punya akun?",
                        text2: "Daftar",
                        padding: 28,
                        onTapFunc: () {
                          Navigator.pushNamed(context, registerRoute);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
