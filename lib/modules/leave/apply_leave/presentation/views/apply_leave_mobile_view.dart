import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ts_system/config/router/app_router.dart';
import 'package:ts_system/core/services/locator.dart';
import 'package:ts_system/utils/common/custom_button.dart';
import 'package:ts_system/utils/common/custom_dropdown.dart';
import 'package:ts_system/utils/components/tt_colors.dart';
import 'package:ts_system/utils/components/tt_icons.dart';
import 'package:ts_system/utils/components/tt_typography.dart';

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
              style: TTypography.h1.copyWith(color: TTColors.white),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomSearchDropdown(
              items: ['Casual Leave', 'Sick Leave', 'Emergency Leave'],
              title: 'Leave Type',
              style: TTypography.h1.copyWith(color: TTColors.white),
              selectedValue: _selectedLeaveType,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedLeaveType = newValue;
                });
              },
              showSearchBox: false,
            ),
            SizedBox(height: 20.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'From Date:',
                  style:
                      TTypography.text16Black.copyWith(color: TTColors.primary),
                ),
                ElevatedButton(
                  onPressed: () => _selectDate(context, true),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                          _fromDate != null
                              ? _fromDate!.toString().split(" ")[0]
                              : 'Select Date',
                          style: TTypography.text16Color),
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
                  style:
                      TTypography.text16Black.copyWith(color: TTColors.primary),
                ),
                ElevatedButton(
                  onPressed: () => _selectDate(context, false),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                          _toDate != null
                              ? _toDate!.toString().split(" ")[0]
                              : 'Select Date',
                          style: TTypography.text16Color),
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
                  style:
                      TTypography.text16Black.copyWith(color: TTColors.primary),
                ),
                Text(
                  _calculateDuration(),
                  style: TTypography.text16Color,
                ),
                SizedBox(height: 20.0),
                Text(
                  'Leave Reason:',
                  style:
                      TTypography.text16Black.copyWith(color: TTColors.primary),
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
                    hintStyle: TTypography.text16Color,
                  ),
                ),
                SizedBox(height: 20.0),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          // Your save button action
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              TTColors.primary!),
                        ),
                        child: Text(
                          'Save',
                          style: TTypography.text16Color
                              .copyWith(color: TTColors.white),
                        ),
                      ),
                      SizedBox(width: 10.0),
                      ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              TTColors.primary!),
                        ),
                        child: Text(
                          'Discard',
                          style: TTypography.text16Color
                              .copyWith(color: TTColors.white),
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
