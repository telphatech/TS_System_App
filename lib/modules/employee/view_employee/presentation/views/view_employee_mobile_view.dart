import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/single_child_widget.dart';
import 'package:ts_system/config/router/app_router.dart';
import 'package:ts_system/core/services/locator.dart';
import 'package:ts_system/utils/common/app_text.dart';
import 'package:ts_system/utils/common/custom_button.dart';
import 'package:ts_system/utils/components/tt_colors.dart';
import 'package:ts_system/utils/components/ui_helpers.dart';

@RoutePage()
class ViewEmployeeMobileView extends StatelessWidget {
  ViewEmployeeMobileView({Key? key});

  // Sample list of employees
  final List<Map<String, dynamic>> employees = [
    {
      "employee_id": "TT18001",
      "name": "John Doe",
      "position": "Software Engineer",
      "role": "admin",
      "email": "john@gmail.com",
      "status": "onjob",
    },
    {
      "employee_id": "TT18002",
      "name": "Jane Smith",
      "position": "HR Manager",
      "role": "manager",
      "email": "john@gmail.com",
      "status": "onjob",
    },
    {
      "employee_id": "TT18003",
      "name": "Alice Johnson",
      "position": "Marketing Coordinator",
      "role": "employee",
      "email": "john@gmail.com",
      "status": "onjob",
    },
    // Add more employees as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            serviceLocator<AppRouter>().pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: TTColors.white,
          ),
        ),
        backgroundColor: TTColors.primary,
        iconTheme: const IconThemeData(color: TTColors.white),
        title: const Text(
          'VIEW EMPLOYEE',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText.body("Employees"),
                  AppText.body("Total Result: 20"),
                ],
              ),
              UIHelpers.verticalSpaceRegular,
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  headingRowHeight: 60, // Adjust as needed
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
                    employees.length,
                    (index) => DataRow(
                      cells: <DataCell>[
                        DataCell(Text(employees[index]["employee_id"])),
                        DataCell(Text(employees[index]["name"])),
                        DataCell(Text(employees[index]["role"])),
                        DataCell(Text(employees[index]["position"])),
                        DataCell(Text(employees[index]["email"])),
                        DataCell(Text(employees[index]["status"])),
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
