import 'package:flutter/material.dart';
import 'package:ts_system/modules/home/dashboard/presentation/widgets/appbar_homescreen.dart';
import 'package:ts_system/modules/home/dashboard/presentation/widgets/drawer_homescreen.dart';
import 'package:ts_system/utils/components/tt_colors.dart';

class HomeScreenMobileView extends StatelessWidget {
  const HomeScreenMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size(double.infinity, kToolbarHeight),
          child: AppBarHomeScreen()),
      drawer: Drawer(
        child: Container(
          color: TTColors.primary,
          child: const DrawerHomeScreen(),
        ),
      ),
    );
  }
}
