import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:ts_system/config/router/app_router.dart';
import 'package:ts_system/core/change_notifiers/common_service.dart';
import 'package:ts_system/core/network/log.dart';
import 'package:ts_system/core/services/locator.dart';
import 'package:ts_system/core/services/shared_preference.dart';
import 'package:ts_system/utils/components/tt_string.dart';
import 'package:ts_system/utils/theme/theme.dart';
import 'package:url_strategy/url_strategy.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  setPathUrlStrategy();
  initializeDependencies();
  await serviceLocator<SharedPreferenceService>().initialise();
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
    Log.info(
        "==> EMP ID: ${serviceLocator<SharedPreferenceService>().empID}\n==> ROLE: ${serviceLocator<SharedPreferenceService>().role}");
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return StreamBuilder<ConnectivityResult>(
        stream: Connectivity().onConnectivityChanged,
        builder: (context, snapshot) {
          return snapshot.data == ConnectivityResult.none
              ? const MaterialApp(
                  debugShowCheckedModeBanner: false,
                  home: Scaffold(
                      body: Center(
                    child: SizedBox(
                      width: double.infinity,
                      child: Text('No Internet Connection'),
                    ),
                  )),
                )
              : ChangeNotifierProvider(
                  create: (context) => CommonService(),
                  child: MaterialApp.router(
                    title: AppUtils.appTitle,
                    debugShowCheckedModeBanner: false,
                    themeMode: ThemeMode.dark,
                    theme: TAppTheme.darkTheme,
                    routerConfig: appRouter.config(),
                  ),
                );
        });
  }
}
