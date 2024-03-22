import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ts_system/config/router/app_router.dart';
import 'package:ts_system/config/router/app_router.gr.dart';
import 'package:ts_system/core/services/locator.dart';
import 'package:ts_system/modules/employee/employee_panel/presentation/widgets/employee_desktop_widget.dart';
import 'package:ts_system/modules/employee/employee_panel/presentation/widgets/employee_mobile_widget.dart';
import 'package:ts_system/responsive.dart';
import 'package:ts_system/utils/components/ui_helpers.dart';

@RoutePage()
class EmployeePanel extends StatelessWidget {
  EmployeePanel({super.key});

  final List<Map<String, dynamic>> employees = [
    {
      "employee_id": "TT18001",
      "name": "John Doe",
      "role": "admin",
      "email": "john@gmail.com",
      "doj": "22 JAN 2023",
    },
    {
      "employee_id": "TT18002",
      "name": "Jane Smith",
      "role": "manager",
      "email": "john@gmail.com",
      "doj": "22 JAN 2023",
    },
    {
      "employee_id": "TT18003",
      "name": "Alice Johnson",
      "role": "employee",
      "email": "john@gmail.com",
      "doj": "22 JAN 2023",
    },
    // Add more employees as needed
  ];

  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: true,
        onPopInvoked: (didPop) {
          UIHelpers.hideKeyBoard();
          serviceLocator<AppRouter>().popAndPush(const DashboardRoute());
        },
        child: Responsive(
            mobile: EmployeeMobileWidget(employees: employees),
            desktop: EmployeeDesktopWidget(employees: employees)));
  }
}
