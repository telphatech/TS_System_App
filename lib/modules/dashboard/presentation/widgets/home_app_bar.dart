import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ts_system/core/change_notifiers/common_service.dart';
import 'package:ts_system/utils/components/tt_colors.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: TTColors.primary,
      centerTitle: true,
      title: Text(
        Provider.of<CommonService>(context).sharedPreferenceService.name,
        style: TextStyle(
          color: TTColors.white,
        ),
      ),
    );
  }
}
