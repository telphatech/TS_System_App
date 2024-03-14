import 'package:flutter/material.dart';
import 'package:ts_system/modules/leave/apply_leave/presentation/views/apply_leave_mobile_view.dart';
import 'package:ts_system/utils/components/tt_colors.dart';

class LeaveAppBar extends StatelessWidget {
  const LeaveAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: TTColors.primary,
      iconTheme: IconThemeData(color: TTColors.white),
      title: Text(
        'Leave',
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.add, color: Colors.white),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ApplyLeaveMobileView(),
              ),
            );
          },
        ),
      ],
      centerTitle: true,
    );
  }
}
