import 'package:flutter/material.dart';
import 'package:ts_system/utils/components/tt_colors.dart';
import 'package:ts_system/utils/components/tt_icons.dart';
import 'package:ts_system/utils/components/tt_typography.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        style: TTypography.text18Black,
        decoration: InputDecoration(
          filled: true,
          fillColor: TTColors.borderSecondary,
          contentPadding: const EdgeInsets.symmetric(horizontal: 10.0),
          hintText: 'Search',
          hintStyle: const TextStyle(color: TTColors.buttonSecondary),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide.none,
          ),
          prefixIcon:
              const Icon(TTIcons.search, color: TTColors.buttonSecondary),
        ),
      ),
    );
  }
}
