import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ts_system/config/router/app_router.dart';
import 'package:ts_system/core/services/locator.dart';
import 'package:ts_system/utils/components/tt_colors.dart';
import 'package:ts_system/utils/components/tt_icons.dart';

@RoutePage()
class ApplyLeaveMobileView extends StatefulWidget {
  static var page;
  @override
  _ApplyLeaveMobileViewState createState() => _ApplyLeaveMobileViewState();
}

class _ApplyLeaveMobileViewState extends State<ApplyLeaveMobileView> {
  String? _selectedLeaveType;
  DateTime? _fromDate;
  DateTime? _toDate;
  String _leaveReason = '';
  Future<void> _selectDate(BuildContext context, bool isFromDate) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate:
          isFromDate ? _fromDate ?? DateTime.now() : _toDate ?? DateTime.now(),
      firstDate: isFromDate ? DateTime.now() : _fromDate ?? DateTime.now(),
      lastDate: DateTime(2025),
    );
    if (picked != null) {
      setState(() {
        if (isFromDate) {
          _fromDate = picked;
        } else {
          _toDate = picked;
        }
      });
    }
  }

  String _calculateDuration() {
    if (_fromDate == null || _toDate == null) {
      return '0 days';
    }
    final difference = _toDate!.difference(_fromDate!).inDays;
    return '$difference days';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: TTColors.primary,
        title: Row(
          children: [
            IconButton(
              icon: Icon(
                TTIcons.arrowback,
                color: TTColors.white,
              ),
              onPressed: () {},
            ),
            Text(
              'Apply Leave',
              style: TextStyle(
                color: TTColors.white,
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Leave Type:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            DropdownButtonFormField<String>(
              value: _selectedLeaveType,
              items: ['Casual Leave', 'Sick Leave', 'Emergency Leave']
                  .map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Row(
                    children: [
                      Text(value),
                      SizedBox(width: 10),
                    ],
                  ),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedLeaveType = newValue;
                });
              },
            ),
            SizedBox(height: 20.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'From Date:',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                ElevatedButton(
                  onPressed: () => _selectDate(context, true),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(_fromDate != null
                          ? _fromDate!.toString().split(" ")[0]
                          : 'Select Date'),
                      Icon(
                        Icons.calendar_today,
                        color: TTColors.primary,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10.0),
                Text(
                  'To Date:',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                ElevatedButton(
                  onPressed: () => _selectDate(context, false),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(_toDate != null
                          ? _toDate!.toString().split(" ")[0]
                          : 'Select Date'),
                      Icon(
                        Icons.calendar_today,
                        color: TTColors.primary,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.0),
                Text(
                  'Duration:',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                Text(
                  _calculateDuration(),
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 20.0),
                Text(
                  'Leave Reason:',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                TextFormField(
                  maxLines: null,
                  onChanged: (value) {
                    setState(() {
                      _leaveReason = value;
                    });
                  },
                  decoration: InputDecoration(
                    hintText: 'Leave Reason',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20.0),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {},
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              TTColors.primary!),
                        ),
                        icon: Icon(
                          Icons.save,
                          color: TTColors.white,
                        ),
                        label: Text(
                          'Save',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      SizedBox(width: 10.0),
                      ElevatedButton.icon(
                        onPressed: () {},
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              TTColors.primary!),
                        ),
                        icon: Icon(
                          Icons.delete,
                          color: TTColors.white,
                        ),
                        label: Text(
                          'Discard',
                          style: TextStyle(color: TTColors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
