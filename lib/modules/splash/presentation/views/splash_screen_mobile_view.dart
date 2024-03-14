import 'package:flutter/material.dart';
import 'package:ts_system/config/router/app_router.dart';
import 'package:ts_system/config/router/app_router.gr.dart';
import 'package:ts_system/core/services/locator.dart';
import 'package:ts_system/modules/login/sign_in/presentation/views/sign_in_desktop_view.dart';
import 'package:ts_system/modules/login/sign_in/presentation/views/sign_in_mobile_view.dart';
import 'package:ts_system/responsive.dart';
import 'package:ts_system/utils/common/text_style.dart';
import 'package:ts_system/utils/components/tt_colors.dart';
import 'package:ts_system/utils/components/tt_icons.dart';
import 'package:ts_system/utils/components/tt_string.dart';
import 'package:ts_system/utils/components/ui_helpers.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class SplashScreenMobileView extends StatelessWidget {
  const SplashScreenMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      if (Responsive.isMobile(context)) {
        serviceLocator<AppRouter>()
            .popAndPush(const SignInMobileView() as PageRouteInfo);
      } else {
        serviceLocator<AppRouter>()
            .popAndPush(const SignInDesktopView() as PageRouteInfo);
      }
    });
    return Scaffold(
      backgroundColor: TTColors.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Icon(TTIcons.logo, size: 80, color: TTColors.white),
            UIHelpers.verticalSpaceMedium,
            Text(TTStrings.appName,
                style: heading1Style.copyWith(color: TTColors.white)),
          ],
        ),
      ),
    );
  }
}
