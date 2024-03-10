import 'package:flutter/material.dart';
import 'package:ts_system/config/router/app_router.dart';
import 'package:ts_system/core/services/locator.dart';
import 'package:ts_system/utils/components/tt_string.dart';
import 'package:ts_system/utils/theme/theme.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  setPathUrlStrategy();
  initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final appRouter = serviceLocator<AppRouter>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: TTStrings.appTitle,
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      theme: TAppTheme.darkTheme,
      routerConfig: appRouter.config(),
    );
  }
}
