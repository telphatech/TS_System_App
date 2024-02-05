import 'package:flutter/material.dart';

import './modules/splash/presentation/views/splash_screen_mobile_view.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home:
        SplashScreenMobileView(), // Running SplashScreenMobileView as the home widget
  ));
}
