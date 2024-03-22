import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ts_system/config/router/app_router.dart';
import 'package:ts_system/config/router/app_router.gr.dart';
import 'package:ts_system/core/services/locator.dart';
import 'package:ts_system/modules/leave/leave_dashboard/presentation/views/leave_dashboard_desktop_view.dart';
import 'package:ts_system/modules/leave/leave_dashboard/presentation/views/leave_dashboard_mobile_view.dart';
import 'package:ts_system/responsive.dart';
import 'package:ts_system/utils/components/ui_helpers.dart';

@RoutePage()
class LeaveDashboard extends StatelessWidget {
  const LeaveDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvoked: (didPop) {
        UIHelpers.hideKeyBoard();
        serviceLocator<AppRouter>().popAndPush(const DashboardRoute());
      },
      child: const Responsive(
          mobile: LeaveDashboardMobileView(),
          desktop: LeaveDashboardDesktopView()),
    );
  }
}
