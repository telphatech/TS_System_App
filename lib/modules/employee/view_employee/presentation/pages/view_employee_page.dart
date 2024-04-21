import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ts_system/config/router/app_router.dart';
import 'package:ts_system/config/router/app_router.gr.dart';
import 'package:ts_system/core/change_notifiers/common_service.dart';
import 'package:ts_system/core/services/locator.dart';
import 'package:ts_system/modules/employee/view_employee/presentation/views/view_employee_desktop_view.dart';
import 'package:ts_system/modules/employee/view_employee/presentation/views/view_employee_mobile_view.dart';
import 'package:ts_system/responsive.dart';
import 'package:ts_system/utils/components/ui_helpers.dart';

@RoutePage()
class ViewEmployeePage extends StatefulWidget {
  const ViewEmployeePage({super.key});

  @override
  State<ViewEmployeePage> createState() => _ViewEmployeePageState();
}

class _ViewEmployeePageState extends State<ViewEmployeePage> {
  @override
  void initState() {
    Provider.of<CommonService>(context, listen: false).setSelectedMenuItem(
      1,
      notify: false,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: true,
        onPopInvoked: (didPop) async {
          UIHelpers.hideKeyBoard();
          await serviceLocator<AppRouter>().popAndPush(const DashboardRoute());
        },
        child: const Responsive(
            mobile: ViewEmployeeMobileView(),
            desktop: ViewEmployeeDesktopView()));
  }
}
