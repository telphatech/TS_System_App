import 'package:auto_route/auto_route.dart';
import 'package:ts_system/config/router/app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRouteMobileView.page, initial: true, path: '/'),
        AutoRoute(page: SignInMobileView.page, path: '/sign-in'),
        AutoRoute(page: HomeRouteMobileView.page),
        AutoRoute(page: LeaveDashboardMobileView.page),
        AutoRoute(page: TaskDashboard.page),
      ];
}
