import 'package:flutter/material.dart';

class ApplyLeaveMobileView extends StatefulWidget {
  const ApplyLeaveMobileView({Key? key}) : super(key: key);

  @override
  _ApplyLeaveMobileViewState createState() => _ApplyLeaveMobileViewState();
}

class _ApplyLeaveMobileViewState extends State<ApplyLeaveMobileView> {
  late DateTime fromDate;
  late DateTime toDate;
  late int duration;
  String selectedLeaveType = '';

  @override
  void initState() {
    super.initState();
    fromDate = DateTime.now();
    toDate = DateTime.now();
    duration = 1;
  }

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
          padding: const EdgeInsets.all(16.0),
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
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          selectedLeaveType = 'Earned Leave';
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(20),
                        primary: selectedLeaveType == 'Earned Leave'
                            ? Colors.pink[800]
                            : Colors.white,
                        onPrimary: selectedLeaveType == 'Earned Leave'
                            ? Colors.white
                            : Colors.pink[800],
                        side: BorderSide(
                          color: selectedLeaveType == 'Earned Leave'
                              ? Colors.pink[800]!
                              : Colors.grey.withOpacity(0.5),
                        ),
                      ),
                      child: Text('Earned Leave'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          selectedLeaveType = 'Sick Leave';
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(20),
                        primary: selectedLeaveType == 'Sick Leave'
                            ? Colors.pink[800]
                            : Colors.white,
                        onPrimary: selectedLeaveType == 'Sick Leave'
                            ? Colors.white
                            : Colors.pink[800],
                        side: BorderSide(
                          color: selectedLeaveType == 'Sick Leave'
                              ? Colors.pink[800]!
                              : Colors.grey.withOpacity(0.5),
                        ),
                      ),
                      child: Text('Sick Leave'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          selectedLeaveType = 'Casual Leave';
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(20),
                        primary: selectedLeaveType == 'Casual Leave'
                            ? Colors.pink[800]
                            : Colors.white,
                        onPrimary: selectedLeaveType == 'Casual Leave'
                            ? Colors.white
                            : Colors.pink[800],
                        side: BorderSide(
                          color: selectedLeaveType == 'Casual Leave'
                              ? Colors.pink[800]!
                              : Colors.grey.withOpacity(0.5),
                        ),
                      ),
                      child: Text('Casual Leave'),
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
                child: ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 16),
                  trailing: Icon(
                    Icons.calendar_today,
                    color: Colors.pink[800],
                  ),
                  subtitle: Text(
                    '${fromDate.day}/${fromDate.month}/${fromDate.year}',
                  ),
                  onTap: () async {
                    final DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: fromDate,
                      firstDate: DateTime.now(),
                      lastDate: DateTime(DateTime.now().year + 1),
                    );
                    if (pickedDate != null && pickedDate != fromDate) {
                      setState(() {
                        fromDate = pickedDate;
                        _calculateDuration();
                      });
                    }
                  },
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
                child: ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 16),
                  trailing: Icon(
                    Icons.calendar_today,
                    color: Colors.pink[800],
                  ),
                  subtitle: Text(
                    '${toDate.day}/${toDate.month}/${toDate.year}',
                  ),
                  onTap: () async {
                    final DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: toDate,
                      firstDate: fromDate,
                      lastDate: DateTime(DateTime.now().year + 1),
                    );
                    if (pickedDate != null && pickedDate != toDate) {
                      setState(() {
                        toDate = pickedDate;
                        _calculateDuration();
                      });
                    }
                  },
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
              Card(
                color: Colors.white,
                elevation: 2,
                child: ListTile(
                  title: Text('', style: TextStyle(color: Colors.black)),
                  subtitle: TextField(
                    maxLines: 3,
                    decoration: InputDecoration(
                      hintText: 'Leave reason',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.all(8),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  primary: Colors.pink[800],
                ),
                child: Text(
                  'Apply Leave',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(height: 10),
              OutlinedButton(
                onPressed: () {},
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
    final difference = toDate.difference(fromDate).inDays;
    setState(() {
      duration = difference + 1;
    });
  }
}
