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
<<<<<<< Updated upstream
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
=======
      iconTheme: const IconThemeData(color: TTColors.white),
      title: const Text(
        'LEAVE',
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
      ),
>>>>>>> Stashed changes
      centerTitle: true,
    );
  }
}
