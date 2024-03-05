import 'package:flutter/material.dart';
import 'package:ts_system/utils/components/tt_colors.dart';

class CustomSnackBarService {
  void showInfoSnackBar(BuildContext context,
      {String? message, String? title}) {
    final snackBar = SnackBar(
      backgroundColor: TTColors.darkContainer,
      behavior: SnackBarBehavior.floating,
      dismissDirection: DismissDirection.down,
      showCloseIcon: true,
      closeIconColor: TTColors.warning,
      duration: const Duration(seconds: 3),
      content: ListTile(
        title: Text(message ?? ''),
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void showWarningSnackBar(BuildContext context,
      {String? message, String? title}) {
    final snackBar = SnackBar(
      backgroundColor: const Color(0xFFFFF3CD),
      behavior: SnackBarBehavior.floating,
      dismissDirection: DismissDirection.down,
      duration: const Duration(seconds: 3),
      showCloseIcon: true,
      closeIconColor: TTColors.warning,
      content: ListTile(
        title: Text(message ?? ''),
      ),
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
        content: ListTile(
          title: Text(message ?? ""),
        ));

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void showErrorSnackBar(BuildContext context,
      {String? message, String? title}) {
    final snackBar = SnackBar(
      backgroundColor: const Color(0xFFF8D7DA),
      behavior: SnackBarBehavior.floating,
      dismissDirection: DismissDirection.endToStart,
      duration: const Duration(seconds: 3),
      showCloseIcon: true,
      closeIconColor: TTColors.danger,
      content: ListTile(
        title: Text(message ?? ''),
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
