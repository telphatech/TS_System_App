import 'package:flutter/material.dart';
import 'package:ts_system/utils/components/tt_colors.dart';

class ApplyLeaveMobileView extends StatefulWidget {
  const ApplyLeaveMobileView({super.key});

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
      title: const Text(
        'Apply Leave',
        style: TextStyle(fontWeight: FontWeight.bold, color: TTColors.white),
      ),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios, color: TTColors.white),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.note_alt_outlined, color: TTColors.white),
          onPressed: () {},
        ),
      ],
      centerTitle: true,
    );
  }
}
