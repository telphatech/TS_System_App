import 'package:auto_route/auto_route.dart';
import 'package:ts_system/config/router/app_router.gr.dart';
import 'package:ts_system/modules/login/sign_in/presentation/views/sign_in_desktop_view.dart';
import 'package:ts_system/modules/login/sign_in/presentation/views/sign_in_mobile_view.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
<<<<<<< Updated upstream
        AutoRoute(page: SplashRouteMobileView.page, initial: true, path: '/'),
        AutoRoute(page: SignInRouteView.page, path: '/sign-in'),
=======
        AutoRoute(
          page: SplashRouteMobileView.page,
        ),
        AutoRoute(page: SignInMobileView.page, path: '/sign-in'),
        AutoRoute(page: DashboardMobileView.page, initial: true, path: '/'),
        AutoRoute(page: LeaveDashboardMobileView.page),
        AutoRoute(page: ApplyLeaveMobileView.page),
        AutoRoute(page: TaskDashboard.page),
        AutoRoute(page: LeavePolicies.page),
        AutoRoute(page: AddTaskMobileView.page),
>>>>>>> Stashed changes
      ];
}
