import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ts_system/config/router/app_router.dart';
import 'package:ts_system/config/router/app_router.gr.dart';
import 'package:ts_system/core/services/locator.dart';
import 'package:ts_system/modules/employee/view_employee/presentation/views/view_employee_desktop_view.dart';
import 'package:ts_system/modules/employee/view_employee/presentation/views/view_employee_mobile_view.dart';
import 'package:ts_system/responsive.dart';
import 'package:ts_system/utils/components/ui_helpers.dart';

@RoutePage()
class ViewEmployeePage extends StatelessWidget {
  const ViewEmployeePage({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: true,
        onPopInvoked: (didPop) {
          UIHelpers.hideKeyBoard();
          serviceLocator<AppRouter>().popAndPush(const DashboardRoute());
        },
        child: const Responsive(
            mobile: ViewEmployeeMobileView(),
            desktop: ViewEmployeeDesktopView()));
  }
}
