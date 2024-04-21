import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:ts_system/config/router/app_router.dart';
import 'package:ts_system/core/change_notifiers/common_service.dart';
import 'package:ts_system/core/network/log.dart';
import 'package:ts_system/core/services/locator.dart';
import 'package:ts_system/core/services/shared_preference.dart';
import 'package:ts_system/utils/common_widgets/no_internet.dart';
import 'package:ts_system/utils/components/tt_string.dart';
import 'package:ts_system/utils/theme/theme.dart';
import 'package:url_strategy/url_strategy.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  setPathUrlStrategy();
  initializeDependencies();
  await serviceLocator<SharedPreferenceService>().initialize();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final appRouter = serviceLocator<AppRouter>();
  final sharedPreferenceService = serviceLocator<SharedPreferenceService>();
  late StreamSubscription<ConnectivityResult> connectivitySubscription;
  bool hasConnection = true;

  @override
  void initState() {
    super.initState();
    connectivitySubscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      setState(() {
        hasConnection = result != ConnectivityResult.none;
      });
    });
  }

  @override
  void dispose() {
    connectivitySubscription.cancel();
    super.dispose();
  }

  Future<void> refreshConnectivity() async {
    final result = await Connectivity().checkConnectivity();
    setState(() {
      hasConnection = result != ConnectivityResult.none;
    });
  }

  @override
  Widget build(BuildContext context) {
    Log.info(
        "==> EMP ID: ${sharedPreferenceService.empID}\n==> ROLE: ${sharedPreferenceService.role}");
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return hasConnection
        ? ChangeNotifierProvider(
            create: (context) => CommonService(),
            child: MaterialApp.router(
              title: AppUtils.appTitle,
              debugShowCheckedModeBanner: false,
              themeMode: ThemeMode.dark,
              theme: TAppTheme.darkTheme,
              routerConfig: appRouter.config(),
            ),
          )
        : MaterialApp(
            debugShowCheckedModeBanner: false,
            home: NoInternet(onTap: refreshConnectivity));
  }
}
