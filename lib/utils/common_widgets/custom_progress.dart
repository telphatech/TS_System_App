import 'package:flutter/material.dart';
import 'package:ts_system/utils/components/tt_colors.dart';
import 'package:ts_system/utils/components/tt_image.dart';

class CustomProgress extends StatelessWidget {
  const CustomProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 25,
          child: Image.asset(TTImages.logo),
        ),
        const SizedBox(
          width: 50,
          height: 50,
          child: CircularProgressIndicator(
            color: TTColors.primaryBackground,
            value: 1,
          ),
        ),
        const SizedBox(
          width: 50,
          height: 50,
          child: CircularProgressIndicator(
            color: TTColors.primary,
          ),
        )
      ],
    );
  }
}
