import 'package:auto_route/auto_route.dart';
import 'package:ts_system/config/router/app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRouteMobileView.page),
        AutoRoute(page: SignInMobileView.page, path: '/sign-in'),
        AutoRoute(page: TaskDashboard.page),
        AutoRoute(page: DashboardRoute.page, initial: true, path: '/'),
        AutoRoute(page: LeaveDashboard.page),
        AutoRoute(page: ApplyLeaveMobileView.page),
        AutoRoute(page: AddTaskMobileView.page),
        AutoRoute(page: EmployeePanel.page),
        AutoRoute(page: AddEmployeeMobileView.page),
        AutoRoute(page: ViewEmployeeMobileView.page),
      ];
}
