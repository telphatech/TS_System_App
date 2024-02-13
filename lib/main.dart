import 'package:flutter/material.dart';
import 'package:ts_system/modules/employee/leave/presentation/views/leave_dashboard_mobile_view.dart';
import 'package:ts_system/modules/splash/presentation/views/splash_screen_mobile_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TM System',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const SplashScreenMobileView(),
      // home: const ApplyLeaveMobileView(),
      home: const LeaveDashboardMobileView(),
    );
  }
}
