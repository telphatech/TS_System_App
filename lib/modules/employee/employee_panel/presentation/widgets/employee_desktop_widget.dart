import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ts_system/config/router/app_router.dart';
import 'package:ts_system/config/router/app_router.gr.dart';
import 'package:ts_system/core/change_notifiers/common_service.dart';
import 'package:ts_system/core/services/locator.dart';
import 'package:ts_system/modules/dashboard/presentation/widgets/menu_drawer.dart';
import 'package:ts_system/utils/common/app_input_field.dart';
import 'package:ts_system/utils/common/app_text.dart';
import 'package:ts_system/utils/common/custom_button.dart';
import 'package:ts_system/utils/components/tt_colors.dart';
import 'package:ts_system/utils/components/ui_helpers.dart';

class EmployeeDesktopWidget extends StatelessWidget {
  const EmployeeDesktopWidget({
    super.key,
    required this.employees,
  });

  final List<Map<String, dynamic>> employees;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MenuDrawer(),
      appBar: const PreferredSize(
          preferredSize: Size(double.infinity, kToolbarHeight),
          child: AppBarDesktopWidget()),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UIHelpers.verticalSpaceRegular,
              Row(
                children: [
                  AppText.body("Employee List"),
                  UIHelpers.horizontalSpaceSmallRegular,
                  AppText.body("| 109 Employees"),
                  UIHelpers.horizontalSpaceSmallRegular,
                  const Expanded(
                    child: AppInputField(
                      color: TTColors.white,
                      hint: 'Search Employee',
                      trailing: Icon(
                        Icons.search,
                        color: TTColors.primary,
                      ),
                    ),
                  ),
                  UIHelpers.horizontalSpaceSmallRegular,
                  SizedBox(
                    width: 200,
                    child: CustomElevatedButton(
                      onPressed: () {
                        serviceLocator<AppRouter>()
                            .push(const AddEmployeeMobileView());
                      },
                      backgroundColor: TTColors.primary,
                      borderColor: TTColors.white,
                      iconColor: TTColors.white,
                      iconData: Icons.add,
                      child: AppText.body(
                        'Invite Employee',
                        color: TTColors.white,
                      ),
                    ),
                  ),
                ],
              ),
              UIHelpers.verticalSpaceRegular,
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  headingRowColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                      return TTColors.primary
                          .withOpacity(0.8); // Adjust opacity as needed
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
                      'Email',
                      style: TextStyle(color: TTColors.white),
                    )),
                    DataColumn(
                        label: Text(
                      'Role',
                      style: TextStyle(color: TTColors.white),
                    )),
                    DataColumn(
                        label: Text(
                      'Date of Joining',
                      style: TextStyle(color: TTColors.white),
                    )),
                  ],
                  rows: List<DataRow>.generate(
                    employees.length,
                    (index) => DataRow(
                      cells: <DataCell>[
                        DataCell(
                            placeholder: true,
                            Text(employees[index]["employee_id"])),
                        DataCell(Text(employees[index]["name"])),
                        DataCell(Text(employees[index]["email"])),
                        DataCell(Text(employees[index]["role"])),
                        DataCell(Text(employees[index]["doj"])),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AppBarDesktopWidget extends StatelessWidget {
  const AppBarDesktopWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: TTColors.primary,
      iconTheme: const IconThemeData(color: TTColors.white),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: SizedBox(
            width: 100,
            child: CustomElevatedButton(
                onPressed: () {},
                backgroundColor: TTColors.white,
                borderColor: TTColors.white,
                iconColor: TTColors.white,
                child: AppText.body(
                  'Check In',
                  color: TTColors.primary,
                )),
          ),
        ),
        //UIHelpers.horizontalSpaceSmall,
        Container(
          padding: const EdgeInsets.only(left: 5),
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(width: 1, color: TTColors.white)),
          child: Row(
            children: [
              const Icon(Icons.person, color: TTColors.white),
              UIHelpers.horizontalSpaceTiny,
              AppText.body(
                  Provider.of<CommonService>(context)
                      .sharedPreferenceService
                      .name,
                  color: TTColors.white),
              PopupMenuButton<String>(
                position: PopupMenuPosition.under,
                elevation: 0,
                tooltip: 'Profile',
                clipBehavior: Clip.antiAliasWithSaveLayer,
                padding: const EdgeInsets.all(0),
                icon: const Icon(Icons.arrow_drop_down, color: TTColors.white),
                onSelected: (value) {
                  if (value == 'dashboard') {
                    // Handle dashboard action
                  } else if (value == 'logout') {
                    // Handle logout action
                  }
                },
                itemBuilder: (BuildContext context) => [
                  PopupMenuItem<String>(
                    value: 'dashboard',
                    child: Column(
                      children: [
                        const Row(
                          children: [
                            Icon(Icons.dashboard,
                                color: TTColors.primary), // Example icon
                            SizedBox(width: 10),
                            Text('Dashboard',
                                style: TextStyle(color: TTColors.black)),
                          ],
                        ),
                        UIHelpers.listDividerWhite,
                      ],
                    ),
                  ),
                  PopupMenuItem<String>(
                    value: 'color',
                    child: Column(
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CircleAvatar(
                              radius: 15,
                              backgroundColor: TTColors.accent,
                            ),
                            CircleAvatar(
                              radius: 15,
                              backgroundColor: TTColors.warning,
                            ),
                            CircleAvatar(
                              radius: 15,
                              backgroundColor: TTColors.success,
                            ),
                          ],
                        ),
                        UIHelpers.listDividerWhite,
                      ],
                    ),
                  ),
                  const PopupMenuItem<String>(
                    value: 'logout',
                    child: Row(
                      children: [
                        Icon(Icons.logout,
                            color: TTColors.primary), // Example icon
                        SizedBox(width: 10),
                        Text('Logout', style: TextStyle(color: TTColors.black)),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
