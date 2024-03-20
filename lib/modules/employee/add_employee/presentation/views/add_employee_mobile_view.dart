//TODO: Pranjal Mam
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ts_system/config/router/app_router.dart';
import 'package:ts_system/core/services/locator.dart';
import 'package:ts_system/utils/components/tt_colors.dart';

@RoutePage()
class AddEmployeeMobileView extends StatelessWidget {
  const AddEmployeeMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            serviceLocator<AppRouter>().pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: TTColors.white,
          ),
        ),
        backgroundColor: TTColors.primary,
        iconTheme: const IconThemeData(color: TTColors.white),
        title: const Text(
          'ADD EMPLOYEE',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: const SingleChildScrollView(),
    );
  }
}
