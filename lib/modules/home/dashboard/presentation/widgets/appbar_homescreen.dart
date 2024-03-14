import 'package:flutter/material.dart';
import 'package:ts_system/utils/components/tt_colors.dart';
import 'package:ts_system/utils/components/tt_string.dart';

class AppBarHomeScreen extends StatelessWidget {
  const AppBarHomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: TTColors.primary,
      title: const Text(
        TTStrings.appName,
        style: TextStyle(
          color: TTColors.white,
        ),
      ),
    );
  }
}
