// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i12;
import 'package:flutter/cupertino.dart' as _i13;
import 'package:ts_system/modules/dashboard/presentation/pages/dashboard_page.dart'
    as _i4;
import 'package:ts_system/modules/employee/add_employee/presentation/views/add_employee_mobile_view.dart'
    as _i1;
import 'package:ts_system/modules/employee/employee_panel/presentation/views/employee_panel_mobile_view.dart'
    as _i5;
import 'package:ts_system/modules/employee/view_employee/presentation/views/view_employee_mobile_view.dart'
    as _i11;
import 'package:ts_system/modules/leave/apply_leave/presentation/views/apply_leave_mobile_view.dart'
    as _i3;
import 'package:ts_system/modules/leave/leave_dashboard/presentation/pages/leave_dashboard.dart'
    as _i6;
import 'package:ts_system/modules/login/sign_in/presentation/pages/login_page.dart'
    as _i7;
import 'package:ts_system/modules/login/sign_in/presentation/views/sign_in_mobile_view.dart'
    as _i8;
import 'package:ts_system/modules/splash/presentation/views/splash_screen_mobile_view.dart'
    as _i9;
import 'package:ts_system/modules/tasks/add_task/presentation/views/add_task_mobile_view.dart'
    as _i2;
import 'package:ts_system/modules/tasks/task_dashboard/presentation/views/task_dashboard_mobile_view.dart'
    as _i10;

abstract class $AppRouter extends _i12.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i12.PageFactory> pagesMap = {
    AddEmployeeMobileView.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AddEmployeeMobileView(),
      );
    },
    AddTaskMobileView.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.AddTaskMobileView(),
      );
    },
    ApplyLeaveMobileView.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.ApplyLeaveMobileView(),
      );
    },
    DashboardRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.DashboardPage(),
      );
    },
    EmployeePanel.name: (routeData) {
      final args = routeData.argsAs<EmployeePanelArgs>(
          orElse: () => const EmployeePanelArgs());
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.EmployeePanel(key: args.key),
      );
    },
    LeaveDashboard.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.LeaveDashboard(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.LoginPage(),
      );
    },
    SignInMobileView.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.SignInMobileView(),
      );
    },
    SplashRouteMobileView.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.SplashScreenMobileView(),
      );
    },
    TaskDashboard.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.TaskDashboard(),
      );
    },
    ViewEmployeeMobileView.name: (routeData) {
      final args = routeData.argsAs<ViewEmployeeMobileViewArgs>(
          orElse: () => const ViewEmployeeMobileViewArgs());
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i11.ViewEmployeeMobileView(key: args.key),
      );
    },
  };
}

/// generated route for
/// [_i1.AddEmployeeMobileView]
class AddEmployeeMobileView extends _i12.PageRouteInfo<void> {
  const AddEmployeeMobileView({List<_i12.PageRouteInfo>? children})
      : super(
          AddEmployeeMobileView.name,
          initialChildren: children,
        );

  static const String name = 'AddEmployeeMobileView';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i2.AddTaskMobileView]
class AddTaskMobileView extends _i12.PageRouteInfo<void> {
  const AddTaskMobileView({List<_i12.PageRouteInfo>? children})
      : super(
          AddTaskMobileView.name,
          initialChildren: children,
        );

  static const String name = 'AddTaskMobileView';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i3.ApplyLeaveMobileView]
class ApplyLeaveMobileView extends _i12.PageRouteInfo<void> {
  const ApplyLeaveMobileView({List<_i12.PageRouteInfo>? children})
      : super(
          ApplyLeaveMobileView.name,
          initialChildren: children,
        );

  static const String name = 'ApplyLeaveMobileView';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i4.DashboardPage]
class DashboardRoute extends _i12.PageRouteInfo<void> {
  const DashboardRoute({List<_i12.PageRouteInfo>? children})
      : super(
          DashboardRoute.name,
          initialChildren: children,
        );

  static const String name = 'DashboardRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i5.EmployeePanel]
class EmployeePanel extends _i12.PageRouteInfo<EmployeePanelArgs> {
  EmployeePanel({
    _i13.Key? key,
    List<_i12.PageRouteInfo>? children,
  }) : super(
          EmployeePanel.name,
          args: EmployeePanelArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'EmployeePanel';

  static const _i12.PageInfo<EmployeePanelArgs> page =
      _i12.PageInfo<EmployeePanelArgs>(name);
}

class EmployeePanelArgs {
  const EmployeePanelArgs({this.key});

  final _i13.Key? key;

  @override
  String toString() {
    return 'EmployeePanelArgs{key: $key}';
  }
}

/// generated route for
/// [_i6.LeaveDashboard]
class LeaveDashboard extends _i12.PageRouteInfo<void> {
  const LeaveDashboard({List<_i12.PageRouteInfo>? children})
      : super(
          LeaveDashboard.name,
          initialChildren: children,
        );

  static const String name = 'LeaveDashboard';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i7.LoginPage]
class LoginRoute extends _i12.PageRouteInfo<void> {
  const LoginRoute({List<_i12.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i8.SignInMobileView]
class SignInMobileView extends _i12.PageRouteInfo<void> {
  const SignInMobileView({List<_i12.PageRouteInfo>? children})
      : super(
          SignInMobileView.name,
          initialChildren: children,
        );

  static const String name = 'SignInMobileView';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i9.SplashScreenMobileView]
class SplashRouteMobileView extends _i12.PageRouteInfo<void> {
  const SplashRouteMobileView({List<_i12.PageRouteInfo>? children})
      : super(
          SplashRouteMobileView.name,
          initialChildren: children,
        );

  static const String name = 'SplashRouteMobileView';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i10.TaskDashboard]
class TaskDashboard extends _i12.PageRouteInfo<void> {
  const TaskDashboard({List<_i12.PageRouteInfo>? children})
      : super(
          TaskDashboard.name,
          initialChildren: children,
        );

  static const String name = 'TaskDashboard';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i11.ViewEmployeeMobileView]
class ViewEmployeeMobileView
    extends _i12.PageRouteInfo<ViewEmployeeMobileViewArgs> {
  ViewEmployeeMobileView({
    _i13.Key? key,
    List<_i12.PageRouteInfo>? children,
  }) : super(
          ViewEmployeeMobileView.name,
          args: ViewEmployeeMobileViewArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'ViewEmployeeMobileView';

  static const _i12.PageInfo<ViewEmployeeMobileViewArgs> page =
      _i12.PageInfo<ViewEmployeeMobileViewArgs>(name);
}

class ViewEmployeeMobileViewArgs {
  const ViewEmployeeMobileViewArgs({this.key});

  final _i13.Key? key;

  @override
  String toString() {
    return 'ViewEmployeeMobileViewArgs{key: $key}';
  }
}
