import 'package:flutter/material.dart';
import 'package:ts_system/utils/components/tt_colors.dart';

class LeaveAppBar extends StatelessWidget {
  const LeaveAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: TTColors.primary,
      iconTheme: const IconThemeData(color: TTColors.white),
      title: const Text(
        'LEAVE',
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
      ),
      centerTitle: true,
    );
  }
}
