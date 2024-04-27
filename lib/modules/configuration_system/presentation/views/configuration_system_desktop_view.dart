import 'package:flutter/material.dart';
import 'package:ts_system/modules/configuration_system/presentation/widgets/view_timesheet_report.dart';
import 'package:ts_system/modules/dashboard/presentation/widgets/menu_drawer.dart';
import 'package:ts_system/modules/employee/view_employee/presentation/widgets/desktop_app_bar.dart';
import 'package:ts_system/utils/common/app_input_field.dart';
import 'package:ts_system/utils/common/custom_dropdown.dart';
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
  String _selectedMenuItem = "Timesheet Reports";
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
        return const Text('Attendance Reports content');
      case "Leave Reports":
        return const Text('Leave Reports content');
      case "Employees Details":
        return Column(
          children: [
            const AppInputField(
              hint: 'Enter Name',
              label: 'Name',
            ),
            UIHelpers.verticalSpaceSmall,
            SizedBox(
              width: double.infinity,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  headingRowColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                      return TTColors.primary.withOpacity(0.8);
                    },
                  ),
                  border: TableBorder.all(width: 1, color: TTColors.primary),
                  columns: const <DataColumn>[
                    DataColumn(
                        label: Text(
                      'Employee ID',
                      style: TextStyle(color: TTColors.white),
                    )),
                    DataColumn(
                        label: Text(
                      'Name',
                      style: TextStyle(color: TTColors.white),
                    )),
                    DataColumn(
                        label: Text(
                      'Role',
                      style: TextStyle(color: TTColors.white),
                    )),
                    DataColumn(
                        label: Text(
                      'Position',
                      style: TextStyle(color: TTColors.white),
                    )),
                    DataColumn(
                        label: Text(
                      'Email',
                      style: TextStyle(color: TTColors.white),
                    )),
                    DataColumn(
                        label: Text(
                      'Status',
                      style: TextStyle(color: TTColors.white),
                    )),
                  ],
                  rows: List<DataRow>.generate(
                    20,
                    (index) => const DataRow(
                      cells: <DataCell>[
                        DataCell(Text("")),
                        DataCell(Text("")),
                        DataCell(Text("")),
                        DataCell(Text("")),
                        DataCell(Text("")),
                        DataCell(Text("")),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      default:
        return Container();
    }
  }
}
