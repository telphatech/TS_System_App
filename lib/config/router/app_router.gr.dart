// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;
import 'package:ts_system/modules/login/sign_in/presentation/views/sign_in_screen_view.dart'
    as _i1;
import 'package:ts_system/modules/splash/presentation/views/splash_screen_mobile_view.dart'
    as _i2;

abstract class $AppRouter extends _i3.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    SignInRouteView.name: (routeData) {
      final args = routeData.argsAs<SignInRouteViewArgs>(
          orElse: () => const SignInRouteViewArgs());
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.SignInScreenView(key: args.key),
      );
    },
    SplashRouteMobileView.name: (routeData) {
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.SplashScreenMobileView(),
      );
    },
  };
}

/// generated route for
/// [_i1.SignInScreenView]
class SignInRouteView extends _i3.PageRouteInfo<SignInRouteViewArgs> {
  SignInRouteView({
    _i4.Key? key,
    List<_i3.PageRouteInfo>? children,
  }) : super(
          SignInRouteView.name,
          args: SignInRouteViewArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'SignInRouteView';

  static const _i3.PageInfo<SignInRouteViewArgs> page =
      _i3.PageInfo<SignInRouteViewArgs>(name);
}

class SignInRouteViewArgs {
  const SignInRouteViewArgs({this.key});

  final _i4.Key? key;

  @override
  String toString() {
    return 'SignInRouteViewArgs{key: $key}';
  }
}

/// generated route for
/// [_i2.SplashScreenMobileView]
class SplashRouteMobileView extends _i3.PageRouteInfo<void> {
  const SplashRouteMobileView({List<_i3.PageRouteInfo>? children})
      : super(
          SplashRouteMobileView.name,
          initialChildren: children,
        );

  static const String name = 'SplashRouteMobileView';

  static const _i3.PageInfo<void> page = _i3.PageInfo<void>(name);
}
