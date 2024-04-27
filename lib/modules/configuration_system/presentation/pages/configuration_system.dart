import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ts_system/config/router/app_router.dart';
import 'package:ts_system/config/router/app_router.gr.dart';
import 'package:ts_system/core/services/locator.dart';
import 'package:ts_system/modules/configuration_system/presentation/views/configuration_system_desktop_view.dart';
import 'package:ts_system/modules/configuration_system/presentation/views/configuration_system_mobile_view.dart';
import 'package:ts_system/responsive.dart';
import 'package:ts_system/utils/components/ui_helpers.dart';

@RoutePage()
class ConfigurationSystemPage extends StatelessWidget {
  const ConfigurationSystemPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: true,
        onPopInvoked: (didPop) async {
          UIHelpers.hideKeyBoard();
          await serviceLocator<AppRouter>().popAndPush(const DashboardRoute());
        },
        child: const Responsive(
            mobile: ConfigurationSystemMobileView(),
            desktop: ConfigurationSystemDesktopView()));
  }
}
