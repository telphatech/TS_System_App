import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ts_system/config/router/app_router.dart';
import 'package:ts_system/config/router/app_router.gr.dart';
import 'package:ts_system/core/services/locator.dart';
import 'package:ts_system/utils/common/app_input_field.dart';
import 'package:ts_system/utils/common/custom_button.dart';
import 'package:ts_system/utils/common/custom_dropdown.dart';
import 'package:ts_system/utils/components/tt_colors.dart';
import 'package:ts_system/utils/components/tt_typography.dart';
import 'package:ts_system/utils/components/ui_helpers.dart';

@RoutePage()
class ApplyLeaveMobileView extends StatefulWidget {
  const ApplyLeaveMobileView({super.key});

  @override
  ApplyLeaveMobileViewState createState() => ApplyLeaveMobileViewState();
}

class ApplyLeaveMobileViewState extends State<ApplyLeaveMobileView> {
  String? _selectedLeaveType;
  DateTime? _fromDate;
  DateTime? _toDate;

  TextEditingController fromDateController = TextEditingController();
  TextEditingController toDateController = TextEditingController();
  TextEditingController reasonController = TextEditingController();
  final GlobalKey<FormState> key = GlobalKey<FormState>();

  Future<void> _selectDate(BuildContext context, bool isFromDate) async {
    final DateTime? picked = await showDatePicker(
      builder: (BuildContext context, Widget? child) => Theme(
        data: ThemeData.light().copyWith(
          primaryColor: TTColors.primary,
          hintColor: TTColors.primary,
          colorScheme: const ColorScheme.light(
            primary: TTColors.primary,
          ),
        ),
        child: child!,
      ),
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
          fromDateController.text = DateFormat('dd-MMM-yyyy').format(picked);
        } else {
          _toDate = picked;
          toDateController.text = DateFormat('dd-MMM-yyyy').format(picked);
        }
      });
    }
  }

  String _calculateDuration() {
    if (_fromDate == null || _toDate == null) {
      return '0 days';
    }

    final difference =
        _toDate!.difference(_fromDate ?? DateTime.now()).inDays + 1;
    return '$difference days';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: TTColors.primary,
        title: Text(
          'Apply Leave',
          style: TTypography.h1.copyWith(color: TTColors.white),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Form(
              key: key,
              child: Column(
                children: [
                  CustomSearchDropdown(
                    items: const ['Casual Leave', 'Sick Leave', 'Earned Leave'],
                    title: 'Leave Type',
                    validator: (value) {
                      if (value == "" || value == "Select" || value == null) {
                        return "* Required";
                      }
                      return null;
                    },
                    style: TTypography.h1.copyWith(color: TTColors.white),
                    selectedValue: _selectedLeaveType,
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedLeaveType = newValue;
                      });
                    },
                    showSearchBox: false,
                    isMenu: true,
                  ),
                  UIHelpers.verticalSpaceRegular,
                  AppInputField(
                    onTap: () async {
                      _selectDate(context, true);
                    },
                    label: 'From Date',
                    readOnly: true,
                    hint: 'Select',
                    controller: fromDateController,
                    trailing: const Icon(
                      Icons.calendar_month_rounded,
                      color: TTColors.primary,
                    ),
                    validator: (value) {
                      if (value == "") {
                        return "* Required";
                      }

                      return null;
                    },
                  ),
                  UIHelpers.verticalSpaceRegular,
                  AppInputField(
                    onTap: () async {
                      _selectDate(context, false);
                    },
                    label: 'To Date',
                    hint: 'Select',
                    controller: toDateController,
                    readOnly: true,
                    trailing: const Icon(
                      Icons.calendar_month_rounded,
                      color: TTColors.primary,
                    ),
                    validator: (value) {
                      if (value == "") {
                        return "* Required";
                      }

                      return null;
                    },
                  ),
                  UIHelpers.verticalSpaceRegular,
                  AppInputField(
                    label: 'Reason',
                    maxLines: 5,
                    controller: reasonController,
                    validator: (value) {
                      if (value == "") {
                        return "* Required";
                      }

                      return null;
                    },
                  ),
                ],
              ),
            ),
            UIHelpers.verticalSpaceSmall,
            Text(
              'Duration: ${_calculateDuration()}',
              style: TTypography.text16Black.copyWith(color: TTColors.primary),
            ),
            UIHelpers.verticalSpaceRegular,
            CustomElevatedButton(
                onPressed: () {
                  if (key.currentState?.validate() == true) {
                  } else {}
                },
                backgroundColor: TTColors.primary,
                borderColor: TTColors.primary,
                iconColor: TTColors.white,
                child: const Text(
                  'Apply Leave',
                  style: TextStyle(color: TTColors.white),
                )),
            UIHelpers.verticalSpaceRegular,
            CustomElevatedButton(
                onPressed: () {
                  serviceLocator<AppRouter>().replace(const LeaveDashboard());
                },
                backgroundColor: TTColors.white,
                borderColor: TTColors.primary,
                iconColor: TTColors.primary,
                child: const Text(
                  'Discard',
                  style: TextStyle(color: TTColors.primary),
                )),
          ],
        ),
      ),
    );
  }
}
