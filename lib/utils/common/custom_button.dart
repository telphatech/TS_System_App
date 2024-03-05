import 'package:flutter/material.dart';
import 'package:ts_system/utils/components/ui_helpers.dart';

class CustomElevatedButton extends StatelessWidget {
  final void Function() onPressed;
  final Color backgroundColor;
  final Color borderColor;
  final Widget child;
  final IconData? iconData;
  final Color iconColor;

  const CustomElevatedButton(
      {super.key,
      required this.onPressed,
      required this.backgroundColor,
      required this.borderColor,
      required this.child,
      this.iconData,
      required this.iconColor});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: iconData == null
          ? Container()
          : Icon(
              iconData,
              color: iconColor,
            ),
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        side: BorderSide(color: borderColor),
        fixedSize: Size(UIHelpers.screenHeight(context) * 0.9, 50),
      ),
      label: child,
    );
  }
}
