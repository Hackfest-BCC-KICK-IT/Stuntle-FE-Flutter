import 'package:flutter/material.dart';
import 'package:stuntle/config/color_theme.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: orangeColor,
      ),
    );
  }
}
