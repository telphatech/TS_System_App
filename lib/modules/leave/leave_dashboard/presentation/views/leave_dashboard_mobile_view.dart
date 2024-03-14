import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ts_system/modules/home/dashboard/presentation/widgets/drawer_homescreen.dart';
import 'package:ts_system/modules/leave/leave_dashboard/presentation/widgets/leave_appbar.dart';
import 'package:ts_system/modules/leave/leave_dashboard/presentation/widgets/leave_dashboard_body.dart';
import 'package:ts_system/modules/leave/leave_dashboard/presentation/widgets/leave_dashboard_padding.dart';
import 'package:ts_system/utils/components/tt_colors.dart';

@RoutePage()
class LeaveDashboardMobileView extends StatelessWidget {
  const LeaveDashboardMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        drawer: DrawerHomeScreen(),
        appBar: PreferredSize(
            preferredSize: Size(double.infinity, kToolbarHeight),
            child: LeaveAppBar()),
        body: LeaveDashboardBody(),
      ),
    );
  }
}

class BalanceLeaveCard extends StatelessWidget {
  const BalanceLeaveCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const LeaveDashboardPadding();
  }
}

class LeaveCard extends StatelessWidget {
  final String leaveType;
  final IconData icon;
  final String date;
  final int days;
  final LeaveStatus status;

  const LeaveCard({
    required this.leaveType,
    required this.icon,
    required this.date,
    required this.days,
    required this.status,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color statusColor;
    switch (status) {
      case LeaveStatus.Pending:
        statusColor = TTColors.secondary;
        break;
      case LeaveStatus.Approved:
        statusColor = TTColors.success;
        break;
      case LeaveStatus.Cancelled:
        statusColor = TTColors.danger;
        break;
    }

    return Card(
      color: TTColors.white,
      margin: const EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    icon,
                    color: TTColors.primary,
                  ),
                  Text(
                    leaveType,
                    style: const TextStyle(color: TTColors.primary),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.calendar_today,
                        color: TTColors.grey,
                      ),
                      const SizedBox(width: 5),
                      Expanded(
                        child: Text(
                          date,
                          style: const TextStyle(color: TTColors.grey),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      const Icon(
                        Icons.access_time,
                        color: TTColors.grey,
                      ),
                      const SizedBox(width: 5),
                      Expanded(
                        child: Text(
                          '$days days',
                          style: const TextStyle(color: TTColors.grey),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: 20),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              color: statusColor,
              child: Text(
                status.toString().split('.').last,
                textAlign: TextAlign.right,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

enum LeaveStatus { Pending, Approved, Cancelled }
