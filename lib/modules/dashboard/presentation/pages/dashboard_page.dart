import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ts_system/modules/dashboard/presentation/views/dashboard_desktop_view.dart';
import 'package:ts_system/modules/dashboard/presentation/views/dashboard_mobile_view.dart';
import 'package:ts_system/responsive.dart';
import 'package:ts_system/utils/components/ui_helpers.dart';

@RoutePage()
class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvoked: (didPop) {
        UIHelpers.hideKeyBoard();
        SystemNavigator.pop();
      },
      child: Responsive(
          mobile: DashboardMobileView(), desktop: const DashboardDesktopView()),
    );
  }
}
