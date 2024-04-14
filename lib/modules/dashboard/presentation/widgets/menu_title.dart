import 'package:flutter/material.dart';
import 'package:ts_system/utils/components/tt_colors.dart';
import 'package:ts_system/utils/components/tt_typography.dart';

class MenuTitle extends StatelessWidget {
  final int index;
  final String title;
  final IconData leading;
  final VoidCallback onTap;
  final bool isSelected;

  const MenuTitle({
    Key? key,
    required this.index,
    required this.title,
    required this.leading,
    required this.onTap,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      selected: isSelected,
      contentPadding: const EdgeInsets.only(left: 8),
      selectedTileColor:
          isSelected ? const Color.fromRGBO(255, 255, 255, 0.5) : null,
      title: Text(
        title,
        style: TTypography.normal.copyWith(color: TTColors.white),
      ),
      leading: Icon(
        leading,
        color: TTColors.white,
      ),
      onTap: onTap,
    );
  }
}
