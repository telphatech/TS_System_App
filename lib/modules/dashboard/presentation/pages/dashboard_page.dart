import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:ts_system/core/change_notifiers/common_service.dart';
import 'package:ts_system/modules/dashboard/presentation/views/dashboard_desktop_view.dart';
import 'package:ts_system/modules/dashboard/presentation/views/dashboard_mobile_view.dart';
import 'package:ts_system/responsive.dart';
import 'package:ts_system/utils/components/ui_helpers.dart';

@RoutePage()
class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  void initState() {
    Provider.of<CommonService>(context, listen: false).setSelectedMenuItem(
      0,
      notify: false,
    );
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvoked: (didPop) {
        UIHelpers.hideKeyBoard();
        SystemNavigator.pop();
      },
      child: const Responsive(
        mobile: DashboardMobileView(),
        desktop: DashboardDesktopView(),
      ),
    );
  }
}
