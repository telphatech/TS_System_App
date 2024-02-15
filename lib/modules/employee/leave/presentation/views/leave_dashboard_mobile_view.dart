import 'package:flutter/material.dart';
import './leave_policies.dart';
import 'package:ts_system/modules/employee/leave/presentation/views/apply_leave_mobile_view.dart';

class LeaveDashboardMobileView extends StatelessWidget {
  const LeaveDashboardMobileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
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
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
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
                          builder: (context) => LeavePolicies(),
                        ),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.all(8.0),
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
                  Text(
                    'All Leaves',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.filter_alt),
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
                  Positioned(
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
              SizedBox(height: 8),
              Padding(
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
              SizedBox(height: 6),
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
      margin: EdgeInsets.all(10),
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
            SizedBox(width: 20),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.calendar_today,
                        color: Colors.grey,
                      ),
                      SizedBox(width: 5),
                      Expanded(
                        child: Text(
                          date,
                          style: TextStyle(color: Colors.grey),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Icon(
                        Icons.access_time,
                        color: Colors.grey,
                      ),
                      SizedBox(width: 5),
                      Expanded(
                        child: Text(
                          '$days days',
                          style: TextStyle(color: Colors.grey),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(width: 20),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              color: statusColor,
              child: Text(
                status.toString().split('.').last,
                textAlign: TextAlign.right,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

enum LeaveStatus { Pending, Approved, Cancelled }
