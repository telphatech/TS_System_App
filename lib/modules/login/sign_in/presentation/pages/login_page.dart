import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ts_system/modules/login/sign_in/presentation/views/login_desktop_view.dart';
import 'package:ts_system/modules/login/sign_in/presentation/views/login_mobile_view.dart';
import 'package:ts_system/responsive.dart';
import 'package:ts_system/utils/components/ui_helpers.dart';

@RoutePage()
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvoked: (didPop) {
        UIHelpers.hideKeyBoard();
        SystemNavigator.pop();
      },
      child: const Responsive(
        mobile: LoginMobileView(),
        desktop: LoginDesktopView(),
      ),
    );
  }
}
