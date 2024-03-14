// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:ts_system/modules/home/dashboard/presentation/views/home_screen_mobile_view.dart'
    as _i1;
import 'package:ts_system/modules/leave/leave_dashboard/presentation/views/leave_dashboard_mobile_view.dart'
    as _i2;
import 'package:ts_system/modules/login/sign_in/presentation/views/sign_in_mobile_view.dart'
    as _i3;
import 'package:ts_system/modules/splash/presentation/views/splash_screen_mobile_view.dart'
    as _i4;
import 'package:ts_system/modules/tasks/task_dashboard/presentation/views/task_dashboard_mobile_view.dart'
    as _i5;

abstract class $AppRouter extends _i6.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    HomeRouteMobileView.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.HomeScreenMobileView(),
      );
    },
    LeaveDashboardMobileView.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.LeaveDashboardMobileView(),
      );
    },
    SignInMobileView.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.SignInMobileView(),
      );
    },
    SplashRouteMobileView.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.SplashScreenMobileView(),
      );
    },
    TaskDashboard.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.TaskDashboard(),
      );
    },
  };
}

/// generated route for
/// [_i1.HomeScreenMobileView]
class HomeRouteMobileView extends _i6.PageRouteInfo<void> {
  const HomeRouteMobileView({List<_i6.PageRouteInfo>? children})
      : super(
          HomeRouteMobileView.name,
          initialChildren: children,
        );

  static const String name = 'HomeRouteMobileView';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i2.LeaveDashboardMobileView]
class LeaveDashboardMobileView extends _i6.PageRouteInfo<void> {
  const LeaveDashboardMobileView({List<_i6.PageRouteInfo>? children})
      : super(
          LeaveDashboardMobileView.name,
          initialChildren: children,
        );

  static const String name = 'LeaveDashboardMobileView';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i3.SignInMobileView]
class SignInMobileView extends _i6.PageRouteInfo<void> {
  const SignInMobileView({List<_i6.PageRouteInfo>? children})
      : super(
          SignInMobileView.name,
          initialChildren: children,
        );

  static const String name = 'SignInMobileView';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i4.SplashScreenMobileView]
class SplashRouteMobileView extends _i6.PageRouteInfo<void> {
  const SplashRouteMobileView({List<_i6.PageRouteInfo>? children})
      : super(
          SplashRouteMobileView.name,
          initialChildren: children,
        );

  static const String name = 'SplashRouteMobileView';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i5.TaskDashboard]
class TaskDashboard extends _i6.PageRouteInfo<void> {
  const TaskDashboard({List<_i6.PageRouteInfo>? children})
      : super(
          TaskDashboard.name,
          initialChildren: children,
        );

  static const String name = 'TaskDashboard';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}
