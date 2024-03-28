import 'package:auto_route/auto_route.dart';
import 'package:ts_system/config/router/app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRouteMobileView.page, initial: true),
        AutoRoute(page: LoginRoute.page, path: '/login'),
        AutoRoute(page: TaskDashboard.page, path: '/timesheet'),
        AutoRoute(page: DashboardRoute.page, path: '/'),
        AutoRoute(page: LeaveDashboard.page, path: '/leave'),
        AutoRoute(page: ApplyLeaveMobileView.page, path: '/apply-leave'),
        AutoRoute(page: AddTaskMobileView.page),
        AutoRoute(page: ViewEmployeeRoute.page, path: '/employees'),
        AutoRoute(page: AddEmployeeMobileView.page),
        AutoRoute(page: EmployeeRegistrationRoute.page),
      ];
}
