import 'package:flutter/material.dart';
import 'package:ts_system/modules/splash/presentation/views/splash_screen_mobile_view.dart';
import 'package:ts_system/utils/components/tt_string.dart';
import 'package:ts_system/utils/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: TTStrings.appTitle,
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      theme: TAppTheme.darkTheme,
      home: const SplashScreenMobileView(),
    );
  }
}
