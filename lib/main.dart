import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:stuntle/config/color_theme.dart';
import 'package:stuntle/config/routes.dart';
import 'package:stuntle/cubit/articel/articel_cubit.dart';

import 'package:stuntle/cubit/auth/auth_cubit.dart';
import 'package:stuntle/cubit/child/child_cubit.dart';
import 'package:stuntle/cubit/grup/grup_cubit.dart';
import 'package:stuntle/cubit/health/health_cubit.dart';
import 'package:stuntle/cubit/help/help_cubit.dart';
import 'package:stuntle/cubit/message/message_cubit.dart';
import 'package:stuntle/cubit/pregnancy/pregnancy_cubit.dart';
import 'package:stuntle/cubit/recipes/recipes_cubit.dart';
import 'package:stuntle/pages/app_page.dart';
import 'package:stuntle/pages/onboarding/onboarding_page.dart';
import "package:flutter_dotenv/flutter_dotenv.dart";

Future<void> main() async {
  await GetStorage.init();
  await dotenv.load(fileName: ".env");

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthCubit()..isHasLogin(),
          ),
          BlocProvider(
            create: (context) => HealthCubit()..isConnextedFakes(),
          ),
          BlocProvider(
            create: (context) => PregnancyCubit(),
          ),
          BlocProvider(
            create: (context) => ChildCubit()..hasChildData(),
          ),
          BlocProvider(
            create: (context) => ArticelCubit()..readArticelBook(),
          ),
          BlocProvider(
            create: (context) => RecipesCubit()..readRecepiesBook(),
          ),
          BlocProvider(
            create: (context) => HelpCubit(),
          ),
          BlocProvider(
            create: (context) => MessageCubit(),
          ),
          BlocProvider(
            create: (context) => GrupCubit()..getGrup(),
          )
        ],
        child: MaterialApp(
          title: "stuntle",
          theme: ThemeData(
            fontFamily: "Roboto",
            scaffoldBackgroundColor: whiteColor,
          ),
          home: BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state) {
              if (state is Authenticated) {
                return const AppPages();
              }
              return const OnboardingPage();
            },
          ),
          onGenerateRoute: RouteGenerator.generateRoute,
        ));
  }
}
