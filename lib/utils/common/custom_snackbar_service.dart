import 'package:flutter/material.dart';
import 'package:ts_system/utils/components/tt_colors.dart';

class CustomSnackBarService {
  void showInfoSnackBar(BuildContext context,
      {String? message, String? title}) {
    final snackBar = SnackBar(
      backgroundColor: TTColors.warning,
      behavior: SnackBarBehavior.floating,
      dismissDirection: DismissDirection.down,
      showCloseIcon: true,
      closeIconColor: TTColors.white,
      duration: const Duration(seconds: 3),
      content: Text(message ?? ''),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void showWarningSnackBar(BuildContext context,
      {String? message, String? title}) {
    final snackBar = SnackBar(
      backgroundColor: TTColors.warning,
      behavior: SnackBarBehavior.floating,
      dismissDirection: DismissDirection.down,
      duration: const Duration(seconds: 3),
      showCloseIcon: true,
      closeIconColor: TTColors.white,
      content: Text(message ?? ''),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void showSuccessSnackBar(BuildContext context,
      {String? message, String? title}) {
    final snackBar = SnackBar(
      backgroundColor: TTColors.success,
      behavior: SnackBarBehavior.floating,
      dismissDirection: DismissDirection.endToStart,
      showCloseIcon: true,
      closeIconColor: TTColors.white,
      duration: const Duration(seconds: 3),
      content: Text(message ?? ""),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void showErrorSnackBar(BuildContext context,
      {String? message, String? title}) {
    final snackBar = SnackBar(
      backgroundColor: TTColors.danger,
      behavior: SnackBarBehavior.floating,
      dismissDirection: DismissDirection.endToStart,
      duration: const Duration(seconds: 3),
      showCloseIcon: true,
      closeIconColor: TTColors.white,
      content: Text(message ?? ''),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
