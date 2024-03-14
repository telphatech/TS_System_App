import 'package:flutter/material.dart';
import 'package:ts_system/modules/employee/leave/presentation/views/leave_dashboard_mobile_view.dart';

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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[800],
        title: Text(
          'Apply Leave',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.note_alt_outlined, color: Colors.white),
            onPressed: () {},
          ),
        ],
        centerTitle: true,
      ),
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
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10),
              Card(
                color: Colors.white,
                elevation: 2,
                child: ListTile(
                  title: Text(
                    selectedLeaveType,
                    style: TextStyle(
                      color: selectedLeaveType == 'Earned Leave'
                          ? Colors.pink[800]
                          : Colors.black,
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: selectedLeaveType == 'Earned Leave'
                          ? Colors.pink[800]!
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
                              ? Colors.white
                              : Colors.pink[800],
                          backgroundColor: selectedLeaveType == 'Earned Leave'
                              ? Colors.pink[800]
                              : Colors.white,
                          padding: EdgeInsets.all(16),
                          side: BorderSide(
                            color: selectedLeaveType == 'Earned Leave'
                                ? Colors.pink[800]!
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
                              ? Colors.white
                              : Colors.pink[800],
                          backgroundColor: selectedLeaveType == 'Sick Leave'
                              ? Colors.pink[800]
                              : Colors.white,
                          padding: EdgeInsets.all(16),
                          side: BorderSide(
                            color: selectedLeaveType == 'Sick Leave'
                                ? Colors.pink[800]!
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
                              ? Colors.white
                              : Colors.pink[800],
                          backgroundColor: selectedLeaveType == 'Casual Leave'
                              ? Colors.pink[800]
                              : Colors.white,
                          padding: EdgeInsets.all(16),
                          side: BorderSide(
                            color: selectedLeaveType == 'Casual Leave'
                                ? Colors.pink[800]!
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
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10),
              Card(
                color: Colors.white,
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
                          color: Colors.pink[800],
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
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10),
              Card(
                color: Colors.white,
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
                          color: Colors.pink[800],
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
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10),
              SizedBox(height: 20),
              Text(
                'Leave Reason',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
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
                  backgroundColor: Colors.pink[800],
                ),
                child: Text(
                  'Apply Leave',
                  style: TextStyle(color: Colors.white),
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
                    color: Colors.pink[800]!,
                  ),
                ),
                child: Text(
                  'Cancel',
                  style: TextStyle(
                    color: Colors.pink[800],
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
}
