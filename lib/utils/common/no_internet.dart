import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:ts_system/utils/common/custom_snackbar_service.dart';
import 'package:ts_system/utils/components/tt_colors.dart';

class NoInternetWidget extends StatefulWidget {
  const NoInternetWidget({super.key});

  @override
  NoInternetWidgetState createState() => NoInternetWidgetState();
}

class NoInternetWidgetState extends State<NoInternetWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/no_internet.png',
            color: Colors.red,
            height: 100,
          ),
          const Text(
            "No Internet connection",
            style: TextStyle(fontSize: 22),
          ),
          const Text("Check your connection, then refresh the page."),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(TTColors.primary),
            ),
            onPressed: () async {
              ConnectivityResult result =
                  await Connectivity().checkConnectivity();
              if (result != ConnectivityResult.none) {
                // serviceLocator<AppRouter>()
                //     .popAndPush(const SplashRouteMobileView());
              } else {
                CustomSnackBarService().showWarningSnackBar(context,
                    title: 'No Internet', message: 'Please Try Again..');
              }
            },
            child: const Text(
              "Refresh",
              style: TextStyle(color: TTColors.white),
            ),
          ),
        ],
      ),
    );
  }
}
