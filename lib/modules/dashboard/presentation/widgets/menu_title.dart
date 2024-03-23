import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ts_system/core/change_notifiers/common_service.dart';
import 'package:ts_system/utils/components/tt_colors.dart';
import 'package:ts_system/utils/components/tt_typography.dart';

class MenuTitle extends StatelessWidget {
  final int index;
  final String title;
  final IconData leading;
  final VoidCallback onTap;

  const MenuTitle({
    super.key,
    required this.index,
    required this.title,
    required this.leading,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final int selectedMenuItem =
        Provider.of<CommonService>(context).selectedMenuItem;

    final isSelected = index == selectedMenuItem;

    return ListTile(
      selected: isSelected,
      selectedTileColor: isSelected ? TTColors.white.withOpacity(0.5) : null,
      title: Text(
        title,
        style: TTypography.normal.copyWith(color: TTColors.white),
      ),
      leading: Icon(
        leading,
        color: TTColors.white,
      ),
      onTap: () {
        Provider.of<CommonService>(context, listen: false)
            .setSelectedMenuItem(index);
        onTap();
      },
    );
  }
}
