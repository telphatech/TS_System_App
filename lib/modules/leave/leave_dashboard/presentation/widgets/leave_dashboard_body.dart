import 'package:flutter/material.dart';
import 'package:ts_system/modules/leave/apply_leave/presentation/pages/leave_policies.dart';
import 'package:ts_system/modules/leave/leave_dashboard/presentation/views/leave_dashboard_mobile_view.dart';
import 'package:ts_system/utils/components/tt_colors.dart';

class LeaveDashboardBody extends StatelessWidget {
  const LeaveDashboardBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Balance Leaves',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: TTColors.black,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LeavePolicies(),
                    ),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  child: const Text(
                    'Leave Policies',
                    style: TextStyle(
                      fontSize: 18,
                      color: TTColors.primary,
                      decoration: TextDecoration.underline,
                      decorationColor: TTColors.primary,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              BalanceLeaveCard(),
              BalanceLeaveCard(),
              BalanceLeaveCard(),
              BalanceLeaveCard(),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'All Leaves',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: TTColors.black,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.filter_alt),
                onPressed: () {},
                color: TTColors.primary,
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView(
            shrinkWrap: true,
            children: const [
              LeaveCard(
                leaveType: 'Casual Leave',
                icon: Icons.beach_access,
                date: 'Feb 1 - Feb 5, 2024',
                days: 5,
                status: LeaveStatus.Pending,
              ),
              LeaveCard(
                leaveType: 'Sick Leave',
                icon: Icons.sick_outlined,
                date: 'Feb 10 - Feb 12, 2024',
                days: 3,
                status: LeaveStatus.Approved,
              ),
              LeaveCard(
                leaveType: 'Sick Leave',
                icon: Icons.sick_outlined,
                date: 'Mar 1 - Apr 1, 2024',
                days: 32,
                status: LeaveStatus.Cancelled,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
