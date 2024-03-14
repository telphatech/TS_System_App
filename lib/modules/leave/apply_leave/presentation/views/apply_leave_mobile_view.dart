import 'package:flutter/material.dart';
import 'package:ts_system/modules/leave/leave_dashboard/presentation/views/leave_dashboard_mobile_view.dart';
import 'package:ts_system/utils/components/tt_colors.dart';

class ApplyLeaveMobileView extends StatefulWidget {
  const ApplyLeaveMobileView({Key? key}) : super(key: key);

  @override
  _ApplyLeaveMobileViewState createState() => _ApplyLeaveMobileViewState();
}

class _ApplyLeaveMobileViewState extends State<ApplyLeaveMobileView> {
  DateTime? fromDate;
  DateTime? toDate;
  int duration = 1;
  String selectedLeaveType = '';
  TextEditingController reasonController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: TTColors.primary,
      title: Text(
        'Apply Leave',
        style: TextStyle(fontWeight: FontWeight.bold, color: TTColors.white),
      ),
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios, color: TTColors.white),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.note_alt_outlined, color: TTColors.white),
          onPressed: () {},
        ),
      ],
      centerTitle: true,
    );
  }
}
