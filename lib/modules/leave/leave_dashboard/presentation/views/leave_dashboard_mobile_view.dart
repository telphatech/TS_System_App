import 'package:flutter/material.dart';
import 'package:ts_system/modules/leave/apply_leave/presentation/pages/leave_policies.dart';
import 'package:ts_system/modules/leave/leave_dashboard/presentation/widgets/leave_appbar.dart';

class LeaveDashboardMobileView extends StatelessWidget {
  const LeaveDashboardMobileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: const PreferredSize(
            preferredSize: Size(double.infinity, kToolbarHeight),
            child: LeaveAppBar()),
        body: Column(
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
                      color: Colors.black,
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
                      child: Text(
                        'Leave Policies',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.pink[800],
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.pink[800],
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
                      color: Colors.black,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.filter_alt),
                    onPressed: () {},
                    color: Colors.pink[800],
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                shrinkWrap: true,
                children: [
                  const LeaveCard(
                    leaveType: 'Casual Leave',
                    icon: Icons.beach_access,
                    date: 'Feb 1 - Feb 5, 2024',
                    days: 5,
                    status: LeaveStatus.Pending,
                  ),
                  const LeaveCard(
                    leaveType: 'Sick Leave',
                    icon: Icons.sick_outlined,
                    date: 'Feb 10 - Feb 12, 2024',
                    days: 3,
                    status: LeaveStatus.Approved,
                  ),
                  const LeaveCard(
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
        ),
      ),
    );
  }
}

class BalanceLeaveCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: SizedBox(
        width: 115,
        child: Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    height: 60,
                    width: 60,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: CircularProgressIndicator(
                        value: 0.8,
                        color: Colors.pink[800],
                        strokeWidth: 4,
                      ),
                    ),
                  ),
                  const Positioned(
                    child: Text(
                      '1/4',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.sick_outlined),
                    SizedBox(width: 6),
                    Expanded(
                      child: Text(
                        'Sick Leave',
                        style: TextStyle(fontSize: 10),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 6),
            ],
          ),
        ),
      ),
    );
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
        statusColor = Colors.yellow[200]!;
        break;
      case LeaveStatus.Approved:
        statusColor = Colors.green[200]!;
        break;
      case LeaveStatus.Cancelled:
        statusColor = Colors.red[200]!;
        break;
    }

    return Card(
      color: Colors.white,
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
                    color: Colors.pink[800],
                  ),
                  Text(
                    leaveType,
                    style: TextStyle(color: Colors.pink[800]),
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
                        color: Colors.grey,
                      ),
                      const SizedBox(width: 5),
                      Expanded(
                        child: Text(
                          date,
                          style: const TextStyle(color: Colors.grey),
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
                        color: Colors.grey,
                      ),
                      const SizedBox(width: 5),
                      Expanded(
                        child: Text(
                          '$days days',
                          style: const TextStyle(color: Colors.grey),
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
