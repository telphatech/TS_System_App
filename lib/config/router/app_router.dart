import 'package:auto_route/auto_route.dart';
import 'package:ts_system/config/router/app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRouteMobileView.page, initial: true),
        AutoRoute(page: LoginRoute.page),
        AutoRoute(page: TaskDashboard.page),
        AutoRoute(page: AddTaskMobileView.page),
        AutoRoute(page: DashboardRoute.page),
        AutoRoute(page: LeaveDashboard.page),
        AutoRoute(page: LeaveDetailsMobileView.page),
        AutoRoute(page: ApplyLeaveMobileView.page),
        AutoRoute(page: ConfigurationSystemRoute.page),
        AutoRoute(page: ViewEmployeeRoute.page),
        AutoRoute(page: AddEmployeeMobileView.page),
        AutoRoute(page: EmployeeRegistrationRoute.page),
      ];
}
