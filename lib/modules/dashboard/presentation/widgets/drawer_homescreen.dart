import 'package:flutter/material.dart';
import 'package:ts_system/config/router/app_router.dart';
import 'package:ts_system/config/router/app_router.gr.dart';
import 'package:ts_system/core/services/locator.dart';
import 'package:ts_system/utils/components/tt_colors.dart';
import 'package:ts_system/utils/components/tt_icons.dart';
import 'package:ts_system/utils/components/tt_string.dart';
import 'package:ts_system/utils/components/tt_typography.dart';

class DrawerHomeScreen extends StatelessWidget {
  const DrawerHomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: Border.all(
          width: 1,
          color: TTColors.white.withOpacity(0.5),
          strokeAlign: BorderSide.strokeAlignOutside),
      backgroundColor: TTColors.primary,
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Column(
          children: [
            const UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: TTColors.primary),
                accountName: Text(TTStrings.name),
                currentAccountPicture: CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(TTIcons.logo),
                ),
                accountEmail: Text(TTStrings.email)),
            ListTile(
              leading: const Icon(TTIcons.dashboard, color: TTColors.white),
              title: Text(
                'Dashboard',
                style: TTypography.text16Color,
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.person, color: TTColors.white),
              title: Text(
                'Employee',
                style: TTypography.text16Color,
              ),
              onTap: () {
                serviceLocator<AppRouter>().pop();
              },
            ),
            ListTile(
              leading: const Icon(Icons.verified_user_rounded,
                  color: TTColors.white),
              title: Text(
                'Attendance',
                style: TTypography.text16Color,
              ),
              onTap: () {
                serviceLocator<AppRouter>().pop();
              },
            ),
            ListTile(
              leading: const Icon(Icons.groups, color: TTColors.white),
              title: Text(
                'Groups',
                style: TTypography.text16Color,
              ),
              onTap: () {
                serviceLocator<AppRouter>().pop();
              },
            ),
            ListTile(
              leading:
                  const Icon(Icons.minimize_rounded, color: TTColors.white),
              title: Text(
                'Leave',
                style: TTypography.text16Color,
              ),
              onTap: () {
                serviceLocator<AppRouter>().pop();
                serviceLocator<AppRouter>().push(LeaveDashboardMobileView());
              },
            ),
            ListTile(
              leading: const Icon(Icons.verified_user, color: TTColors.white),
              title: Text(
                'Timesheet',
                style: TTypography.text16Color,
              ),
              onTap: () {
                serviceLocator<AppRouter>().pop();
                serviceLocator<AppRouter>().push(TaskDashboard());
              },
            ),
            const Spacer(),
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                  color: TTColors.white.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(
                      width: 1, color: TTColors.white.withOpacity(0.5))),
              child: ListTile(
                leading: const Icon(TTIcons.logout, color: TTColors.white),
                title: Text(
                  'Logout',
                  style: TTypography.text16Color,
                ),
                onTap: () {
                  serviceLocator<AppRouter>().pop();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
