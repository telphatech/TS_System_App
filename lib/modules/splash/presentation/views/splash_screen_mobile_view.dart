import 'package:flutter/material.dart';
import 'package:ts_system/modules/login/sign_in/presentation/views/sign_in_mobile_view.dart';

// TODO: Nikita - Work on Sign In Screen

class SplashScreenMobileView extends StatelessWidget {
  const SplashScreenMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    // Using Future.delayed to delay the navigation
    Future.delayed(const Duration(seconds: 3), () {
      // After 3 seconds, navigate to the next screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) =>
                SignInMobileView()), // Replace SignInScreen with  actual screen
      );
    });

    return Scaffold(
      backgroundColor: Colors.pink[800],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.home, //  icon
              size: 80,
              color: Colors.white,
            ),
            SizedBox(height: 20),
            Text(
              'TM System',
              style: TextStyle(
                color: Colors.white,
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
