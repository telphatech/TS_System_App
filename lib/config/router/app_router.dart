import 'package:auto_route/auto_route.dart';
import 'package:ts_system/config/router/app_router.gr.dart';
import 'package:ts_system/modules/login/sign_in/presentation/views/sign_in_desktop_view.dart';
import 'package:ts_system/modules/login/sign_in/presentation/views/sign_in_mobile_view.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRouteMobileView.page, initial: true),
        AutoRoute(page: SignInMobileView.page),
        AutoRoute(page: SignInDesktopView.page),
      ];
}
