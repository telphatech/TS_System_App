import 'package:flutter/material.dart';
import 'package:ts_system/config/router/app_router.dart';
import 'package:ts_system/config/router/app_router.gr.dart';
import 'package:ts_system/core/services/locator.dart';
import 'package:ts_system/modules/dashboard/presentation/widgets/menu_drawer.dart';
import 'package:ts_system/utils/common/app_text.dart';
import 'package:ts_system/utils/common/custom_button.dart';
import 'package:ts_system/utils/components/tt_colors.dart';
import 'package:ts_system/utils/components/ui_helpers.dart';

class EmployeeMobileWidget extends StatelessWidget {
  const EmployeeMobileWidget({
    super.key,
    required this.employees,
  });

  final List<Map<String, dynamic>> employees;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MenuDrawer(),
      appBar: AppBar(
        backgroundColor: TTColors.primary,
        iconTheme: const IconThemeData(color: TTColors.white),
        title: const Text(
          'EMPLOYEE',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UIHelpers.verticalSpaceRegular,
              CustomElevatedButton(
                onPressed: () {
                  serviceLocator<AppRouter>()
                      .push(const AddEmployeeMobileView());
                },
                backgroundColor: TTColors.white,
                borderColor: TTColors.primary,
                iconColor: TTColors.primary,
                iconData: Icons.add,
                child: AppText.body('Invite Employee'),
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
                      'Role',
                      style: TextStyle(color: TTColors.white),
                    )),
                    DataColumn(
                        label: Text(
                      'Email',
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
                        DataCell(Text(employees[index]["email"])),
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
