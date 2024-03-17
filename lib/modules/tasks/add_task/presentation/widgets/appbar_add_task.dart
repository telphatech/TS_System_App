import 'package:flutter/material.dart';
import 'package:ts_system/config/router/app_router.dart';
import 'package:ts_system/core/services/locator.dart';
import 'package:ts_system/utils/components/tt_colors.dart';
import 'package:ts_system/utils/components/tt_icons.dart';
import 'package:ts_system/utils/components/tt_typography.dart';

class AddTaskAppbar extends StatelessWidget {
  const AddTaskAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: TTColors.primary,
      leading: IconButton(
        icon: const Icon(TTIcons.arrowback, color: TTColors.white),
        onPressed: () {
          serviceLocator<AppRouter>().pop();
        },
      ),
      title: Text('Add Task',
          style: TTypography.normal.copyWith(
              fontWeight: FontWeight.w700,
              color: TTColors.white,
              fontSize: 20)),
      centerTitle: true,
    );
  }
}
