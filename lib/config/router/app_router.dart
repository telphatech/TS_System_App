import 'package:auto_route/auto_route.dart';
import 'package:ts_system/config/router/app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: SplashRouteMobileView.page,
          initial: true,
          path: '/',
        ),
        AutoRoute(
          page: LoginRoute.page,
          path: '/login',
        ),
        AutoRoute(
          page: TaskDashboard.page,
          path: '/timesheet',
        ),
        AutoRoute(
          page: AddTaskMobileView.page,
          path: '/add-timesheet',
        ),
        AutoRoute(
          page: DashboardRoute.page,
          path: '/dashboard',
        ),
        AutoRoute(
          page: LeaveDashboard.page,
          path: '/leave',
        ),
        AutoRoute(page: LeaveDetailsMobileView.page, path: '/leave-details'),
        AutoRoute(
          page: ApplyLeaveMobileView.page,
          path: '/apply-leave',
        ),
        AutoRoute(
          page: ViewEmployeeRoute.page,
          path: '/employees',
        ),
        AutoRoute(
          page: AddEmployeeMobileView.page,
          path: '/add-employee',
        ),
        AutoRoute(
          page: EmployeeRegistrationRoute.page,
          path: '/register-employee',
        ),
      ];
}
