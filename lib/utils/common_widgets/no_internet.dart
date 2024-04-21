import 'package:flutter/material.dart';
import 'package:ts_system/utils/common/custom_button.dart';
import 'package:ts_system/utils/components/tt_colors.dart';
import 'package:ts_system/utils/components/ui_helpers.dart';

class NoInternet extends StatefulWidget {
  final void Function() onTap;
  const NoInternet({super.key, required this.onTap});

  @override
  State<NoInternet> createState() => _NoInternetState();
}

class _NoInternetState extends State<NoInternet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/logo.png',
                //color: Colors.red,
                height: 100,
              ),
              UIHelpers.verticalSpaceRegular,
              const Text(
                "No Internet connection",
                style: TextStyle(fontSize: 22),
              ),
              UIHelpers.verticalSpaceTiny,
              const Text("Check your connection, then refresh the page."),
              UIHelpers.verticalSpaceRegular,
              SizedBox(
                width: double.infinity,
                child: CustomElevatedButton(
                  backgroundColor: TTColors.primary,
                  borderColor: TTColors.primary,
                  iconColor: TTColors.white,
                  onPressed: () {
                    widget.onTap();
                  },
                  child: const Text(
                    'Refresh',
                    style: TextStyle(color: TTColors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
