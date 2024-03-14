import 'package:flutter/material.dart';
import 'package:ts_system/utils/components/tt_string.dart';
import 'package:ts_system/utils/components/tt_typography.dart';

class AppTitle extends StatelessWidget {
  const AppTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Center(
        widthFactor: BorderSide.strokeAlignCenter,
        child: Text(
          TTStrings.appTitle,
          style: TTypography.h2,
        ),
      ),
    );
  }
}
