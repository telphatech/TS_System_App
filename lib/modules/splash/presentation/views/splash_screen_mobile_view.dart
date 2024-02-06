import 'package:flutter/material.dart';
import 'package:ts_system/modules/login/sign_in/presentation/views/sign_in_mobile_view.dart';

class SplashScreenMobileView extends StatelessWidget {
  const SplashScreenMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const SignInMobileView()),
      );
    });

    return Scaffold(
      backgroundColor: Colors.pink[800],
      body: const Center(
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
