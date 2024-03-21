// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i9;
import 'package:flutter/material.dart' as _i10;
import 'package:ts_system/modules/home/dashboard/presentation/views/dashboard_mobile_view.dart'
    as _i3;
import 'package:ts_system/modules/leave/apply_leave/presentation/views/apply_leave_mobile_view.dart'
    as _i2;
import 'package:ts_system/modules/leave/leave_dashboard/presentation/pages/leave_policies.dart'
    as _i5;
import 'package:ts_system/modules/leave/leave_dashboard/presentation/views/leave_dashboard_mobile_view.dart'
    as _i4;
import 'package:ts_system/modules/login/sign_in/presentation/views/sign_in_mobile_view.dart'
    as _i6;
import 'package:ts_system/modules/splash/presentation/views/splash_screen_mobile_view.dart'
    as _i7;
import 'package:ts_system/modules/tasks/add_task/presentation/views/add_task_mobile_view.dart'
    as _i1;
import 'package:ts_system/modules/tasks/task_dashboard/presentation/views/task_dashboard_mobile_view.dart'
    as _i8;

abstract class $AppRouter extends _i9.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i9.PageFactory> pagesMap = {
    AddTaskMobileView.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AddTaskMobileView(),
      );
    },
    ApplyLeaveMobileView.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.ApplyLeaveMobileView(),
      );
    },
    DashboardMobileView.name: (routeData) {
      final args = routeData.argsAs<DashboardMobileViewArgs>(
          orElse: () => const DashboardMobileViewArgs());
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.DashboardMobileView(key: args.key),
      );
    },
    LeaveDashboardMobileView.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.LeaveDashboardMobileView(),
      );
    },
    LeavePolicies.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.LeavePolicies(),
      );
    },
    SignInMobileView.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.SignInMobileView(),
      );
    },
    SplashRouteMobileView.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.SplashScreenMobileView(),
      );
    },
    TaskDashboard.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.TaskDashboard(),
      );
    },
  };
}

/// generated route for
/// [_i1.AddTaskMobileView]
class AddTaskMobileView extends _i9.PageRouteInfo<void> {
  const AddTaskMobileView({List<_i9.PageRouteInfo>? children})
      : super(
          AddTaskMobileView.name,
          initialChildren: children,
        );

  static const String name = 'AddTaskMobileView';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i2.ApplyLeaveMobileView]
class ApplyLeaveMobileView extends _i9.PageRouteInfo<void> {
  const ApplyLeaveMobileView({List<_i9.PageRouteInfo>? children})
      : super(
          ApplyLeaveMobileView.name,
          initialChildren: children,
        );

  static const String name = 'ApplyLeaveMobileView';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i3.DashboardMobileView]
class DashboardMobileView extends _i9.PageRouteInfo<DashboardMobileViewArgs> {
  DashboardMobileView({
    _i10.Key? key,
    List<_i9.PageRouteInfo>? children,
  }) : super(
          DashboardMobileView.name,
          args: DashboardMobileViewArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'DashboardMobileView';

  static const _i9.PageInfo<DashboardMobileViewArgs> page =
      _i9.PageInfo<DashboardMobileViewArgs>(name);
}

class DashboardMobileViewArgs {
  const DashboardMobileViewArgs({this.key});

  final _i10.Key? key;

  @override
  String toString() {
    return 'DashboardMobileViewArgs{key: $key}';
  }
}

/// generated route for
/// [_i4.LeaveDashboardMobileView]
class LeaveDashboardMobileView extends _i9.PageRouteInfo<void> {
  const LeaveDashboardMobileView({List<_i9.PageRouteInfo>? children})
      : super(
          LeaveDashboardMobileView.name,
          initialChildren: children,
        );

  static const String name = 'LeaveDashboardMobileView';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i5.LeavePolicies]
class LeavePolicies extends _i9.PageRouteInfo<void> {
  const LeavePolicies({List<_i9.PageRouteInfo>? children})
      : super(
          LeavePolicies.name,
          initialChildren: children,
        );

  static const String name = 'LeavePolicies';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i6.SignInMobileView]
class SignInMobileView extends _i9.PageRouteInfo<void> {
  const SignInMobileView({List<_i9.PageRouteInfo>? children})
      : super(
          SignInMobileView.name,
          initialChildren: children,
        );

  static const String name = 'SignInMobileView';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i7.SplashScreenMobileView]
class SplashRouteMobileView extends _i9.PageRouteInfo<void> {
  const SplashRouteMobileView({List<_i9.PageRouteInfo>? children})
      : super(
          SplashRouteMobileView.name,
          initialChildren: children,
        );

  static const String name = 'SplashRouteMobileView';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i8.TaskDashboard]
class TaskDashboard extends _i9.PageRouteInfo<void> {
  const TaskDashboard({List<_i9.PageRouteInfo>? children})
      : super(
          TaskDashboard.name,
          initialChildren: children,
        );

  static const String name = 'TaskDashboard';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}
