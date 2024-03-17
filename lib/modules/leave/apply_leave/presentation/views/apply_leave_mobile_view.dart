import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ts_system/config/router/app_router.dart';
import 'package:ts_system/core/services/locator.dart';
import 'package:ts_system/utils/components/tt_colors.dart';

@RoutePage()
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: TTColors.primary,
        title: const Text(
          'Apply Leave',
          style: TextStyle(fontWeight: FontWeight.bold, color: TTColors.white),
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
