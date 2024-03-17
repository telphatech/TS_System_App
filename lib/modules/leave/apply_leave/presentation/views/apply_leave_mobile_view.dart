import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
<<<<<<< Updated upstream
import 'package:ts_system/modules/leave/leave_dashboard/presentation/views/leave_dashboard_mobile_view.dart';
=======
import 'package:ts_system/config/router/app_router.dart';
import 'package:ts_system/core/services/locator.dart';
>>>>>>> Stashed changes
import 'package:ts_system/utils/components/tt_colors.dart';

@RoutePage()
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
<<<<<<< Updated upstream
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
=======
    return Scaffold(
      appBar: AppBar(
        backgroundColor: TTColors.primary,
        title: const Text(
          'Apply Leave',
          style: TextStyle(fontWeight: FontWeight.bold, color: TTColors.white),
>>>>>>> Stashed changes
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: TTColors.white),
          onPressed: () {
            serviceLocator<AppRouter>().pop();
          },
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(),
    );
  }
}
