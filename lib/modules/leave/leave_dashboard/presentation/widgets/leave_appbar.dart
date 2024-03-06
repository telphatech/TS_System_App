import 'package:flutter/material.dart';
import 'package:ts_system/modules/leave/apply_leave/presentation/views/apply_leave_mobile_view.dart';

class LeaveAppBar extends StatelessWidget {
  const LeaveAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.pink[800],
      title: Text(
        'Leave',
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
      ),
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios_new, color: Colors.white),
        onPressed: () {},
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
