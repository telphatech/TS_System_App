import 'package:flutter/material.dart';
import 'package:ts_system/modules/employee/leave/presentation/views/leave_dashboard_mobile_view.dart';
import 'package:ts_system/utils/components/tt_colors.dart';

class ApplyLeaveAppBar extends StatelessWidget {
  ApplyLeaveAppBar({
    super.key,
  });
  DateTime? fromDate;
  DateTime? toDate;
  int duration = 1;
  String selectedLeaveType = '';
  TextEditingController reasonController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(double.infinity, kToolbarHeight),
          child: ApplyLeaveAppBar()),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 20),
              Text(
                'Leave Type',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: TTColors.black,
                ),
              ),
              SizedBox(height: 10),
              Card(
                color: TTColors.white,
                elevation: 2,
                child: ListTile(
                  title: Text(
                    selectedLeaveType,
                    style: TextStyle(
                      color: selectedLeaveType == 'Earned Leave'
                          ? TTColors.primary
                          : TTColors.black,
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: selectedLeaveType == 'Earned Leave'
                          ? TTColors.primary!
                          : Colors.grey.withOpacity(0.5),
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4.0),
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            selectedLeaveType = 'Earned Leave';
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: selectedLeaveType == 'Earned Leave'
                              ? TTColors.white
                              : TTColors.primary,
                          backgroundColor: selectedLeaveType == 'Earned Leave'
                              ? TTColors.primary
                              : TTColors.white,
                          padding: EdgeInsets.all(16),
                          side: BorderSide(
                            color: selectedLeaveType == 'Earned Leave'
                                ? TTColors.primary!
                                : Colors.grey.withOpacity(0.5),
                          ),
                        ),
                        child: Text('Earned Leave'),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4.0),
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            selectedLeaveType = 'Sick Leave';
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: selectedLeaveType == 'Sick Leave'
                              ? TTColors.white
                              : TTColors.primary,
                          backgroundColor: selectedLeaveType == 'Sick Leave'
                              ? TTColors.primary
                              : TTColors.white,
                          padding: EdgeInsets.all(16),
                          side: BorderSide(
                            color: selectedLeaveType == 'Sick Leave'
                                ? TTColors.primary!
                                : Colors.grey.withOpacity(0.5),
                          ),
                        ),
                        child: Text('Sick Leave'),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4.0),
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            selectedLeaveType = 'Casual Leave';
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: selectedLeaveType == 'Casual Leave'
                              ? TTColors.white
                              : TTColors.primary,
                          backgroundColor: selectedLeaveType == 'Casual Leave'
                              ? TTColors.primary
                              : TTColors.white,
                          padding: EdgeInsets.all(16),
                          side: BorderSide(
                            color: selectedLeaveType == 'Casual Leave'
                                ? TTColors.primary!
                                : Colors.grey.withOpacity(0.5),
                          ),
                        ),
                        child: Text('Casual Leave'),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Text(
                'From',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: TTColors.black,
                ),
              ),
              SizedBox(height: 10),
              Card(
                color: TTColors.white,
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          fromDate != null
                              ? '${fromDate!.day}/${fromDate!.month}/${fromDate!.year}'
                              : 'Select date',
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          final DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: fromDate ??
                                DateTime.now().add(Duration(days: 1)),
                            firstDate: DateTime.now().add(Duration(days: 1)),
                            lastDate: DateTime(DateTime.now().year + 1),
                          );
                          if (pickedDate != null && pickedDate != fromDate) {
                            setState(() {
                              fromDate = pickedDate;
                              _calculateDuration();

                              if (toDate == null ||
                                  fromDate!.isAfter(toDate!)) {
                                toDate = fromDate!.add(Duration(days: 1));
                              }
                            });
                          }
                        },
                        child: Icon(
                          Icons.calendar_today,
                          color: TTColors.primary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'To',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: TTColors.black,
                ),
              ),
              SizedBox(height: 10),
              Card(
                color: TTColors.white,
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          toDate != null
                              ? '${toDate!.day}/${toDate!.month}/${toDate!.year}'
                              : 'Select date',
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          final DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: toDate ??
                                (fromDate ?? DateTime.now())
                                    .add(Duration(days: 1)),
                            firstDate: fromDate ??
                                DateTime.now().add(Duration(days: 1)),
                            lastDate: DateTime(DateTime.now().year + 1),
                          );
                          if (pickedDate != null && pickedDate != toDate) {
                            setState(() {
                              toDate = pickedDate;
                              _calculateDuration();
                            });
                          }
                        },
                        child: Icon(
                          Icons.calendar_today,
                          color: TTColors.primary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Duration : $duration Days',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: TTColors.black,
                ),
              ),
              SizedBox(height: 10),
              SizedBox(height: 20),
              Text(
                'Leave Reason',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: TTColors.black,
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: TextField(
                  controller: reasonController,
                  maxLines: 3,
                  decoration: InputDecoration(
                    hintText: 'Leave reason',
                    border: OutlineInputBorder(),
                    contentPadding:
                        EdgeInsets.only(left: 16.0, top: 8.0, bottom: 8.0),
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: TTColors.primary,
                ),
                child: Text(
                  'Apply Leave',
                  style: TextStyle(color: TTColors.white),
                ),
              ),
              SizedBox(height: 10),
              OutlinedButton(
                onPressed: () {
                  setState(() {
                    fromDate = null;
                    toDate = null;
                    duration = 1;
                    selectedLeaveType = '';
                  });
                  reasonController.clear();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => LeaveDashboardMobileView()),
                  );
                },
                style: OutlinedButton.styleFrom(
                  side: BorderSide(
                    color: TTColors.primary!,
                  ),
                ),
                child: Text(
                  'Cancel',
                  style: TextStyle(
                    color: TTColors.primary,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _calculateDuration() {
    if (fromDate != null && toDate != null) {
      final difference = toDate!.difference(fromDate!).inDays;
      setState(() {
        duration = difference + 1;
      });
    }
  }

  void setState(Null Function() param0) {}
}
