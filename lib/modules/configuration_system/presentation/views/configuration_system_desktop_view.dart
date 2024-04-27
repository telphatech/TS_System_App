import 'package:flutter/material.dart';
import 'package:ts_system/modules/configuration_system/presentation/widgets/view_attendance_report.dart';
import 'package:ts_system/modules/configuration_system/presentation/widgets/view_employee_report.dart';
import 'package:ts_system/modules/configuration_system/presentation/widgets/view_leave_report.dart';
import 'package:ts_system/modules/configuration_system/presentation/widgets/view_timesheet_report.dart';
import 'package:ts_system/modules/dashboard/presentation/widgets/menu_drawer.dart';
import 'package:ts_system/modules/employee/view_employee/presentation/widgets/desktop_app_bar.dart';
import 'package:ts_system/utils/common/app_input_field.dart';
import 'package:ts_system/utils/common/custom_dropdown.dart';
import 'package:ts_system/utils/common_widgets/loading_widget.dart';
import 'package:ts_system/utils/components/tt_colors.dart';
import 'package:ts_system/utils/components/ui_helpers.dart';

class ConfigurationSystemDesktopView extends StatefulWidget {
  const ConfigurationSystemDesktopView({super.key});

  @override
  State<ConfigurationSystemDesktopView> createState() =>
      _ConfigurationSystemDesktopViewState();
}

class _ConfigurationSystemDesktopViewState
    extends State<ConfigurationSystemDesktopView> {
  String _selectedMenuItem = "Employees Details";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size(double.infinity, kToolbarHeight),
        child: AppBarDesktopWidget(),
      ),
      drawer: const MenuDrawer(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            CustomSearchDropdown(
              items: const [
                "Timesheet Reports",
                "Attendance Reports",
                "Leave Reports",
                "Employees Details"
              ],
              isMenu: true,
              showSearchBox: false,
              selectedValue: _selectedMenuItem,
              onChanged: (value) {
                setState(() {
                  _selectedMenuItem = value!;
                });
              },
            ),
            UIHelpers.verticalSpaceSmall,
            _buildContent(_selectedMenuItem),
          ],
        ),
      ),
    );
  }

  Widget _buildContent(String menuItem) {
    switch (menuItem) {
      case "Timesheet Reports":
        return const ViewTimesheetReport();
      case "Attendance Reports":
        return const ViewAttendanceReport();
      case "Leave Reports":
        return const ViewLeaveReport();
      case "Employees Details":
        return const ViewEmployeeReport();
      default:
        return const LoadingWidget(
          width: double.infinity,
          height: 500,
        );
    }
  }
}
