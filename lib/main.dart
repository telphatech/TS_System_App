import 'package:flutter/material.dart';

import './modules/splash/presentation/views/splash_screen_mobile_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreenMobileView(),
    );
  }
}
