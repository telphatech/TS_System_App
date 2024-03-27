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
    Key? key,
    required this.index,
    required this.title,
    required this.leading,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CommonService>(
      builder: (context, commonService, child) {
        final isSelected = index == commonService.selectedMenuItem;
        return ListTile(
          selected: isSelected,
          contentPadding: const EdgeInsets.only(left: 8),
          selectedTileColor:
              isSelected ? Color.fromRGBO(255, 255, 255, 0.5) : null,
          title: Text(
            title,
            style: TTypography.normal.copyWith(color: TTColors.white),
          ),
          leading: Icon(
            leading,
            color: TTColors.white,
          ),
          onTap: () {
            if (isSelected) {
              commonService.setSelectedMenuItem(0); // Deselect the item
            } else {
              commonService.setSelectedMenuItem(index);
            }
            onTap();
          },
        );
      },
    );
  }
}
