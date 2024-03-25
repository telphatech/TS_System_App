import 'package:flutter/material.dart';
import 'package:ts_system/config/router/app_router.dart';
import 'package:ts_system/config/router/app_router.gr.dart';
import 'package:ts_system/core/services/locator.dart';
import 'package:ts_system/core/services/shared_preference.dart';
import 'package:ts_system/modules/dashboard/presentation/widgets/menu_title.dart';
import 'package:ts_system/responsive.dart';
import 'package:ts_system/utils/components/tt_colors.dart';
import 'package:ts_system/utils/components/tt_icons.dart';
import 'package:ts_system/utils/components/tt_typography.dart';
import 'package:ts_system/utils/components/ui_helpers.dart';

class MenuDrawer extends StatefulWidget {
  const MenuDrawer({super.key});

  @override
  State<MenuDrawer> createState() => _MenuDrawerState();
}

class _MenuDrawerState extends State<MenuDrawer> {
  final sharedPreferenceService = serviceLocator<SharedPreferenceService>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: UIHelpers.screenWidth(context) * 0.2),
      child: Drawer(
        width: Responsive.isMobile(context)
            ? UIHelpers.screenWidth(context) * 0.8
            : null,
        shape: Border.all(
            width: 1,
            color: TTColors.white.withOpacity(0.5),
            strokeAlign: BorderSide.strokeAlignOutside),
        backgroundColor: TTColors.primary,
        child: Padding(
          padding: EdgeInsets.fromLTRB(
              10.0, UIHelpers.screenHeight(context) * 0.05, 10.0, 0.0),
          child: Column(
            children: [
              ListTile(
                title: Text(sharedPreferenceService.name,
                    style: TTypography.normal.copyWith(color: TTColors.white)),
                leading: const CircleAvatar(
                  radius: 30,
                  backgroundColor: TTColors.white,
                  backgroundImage: AssetImage(TTIcons.profilePic),
                ),
                subtitle: Text(
                  sharedPreferenceService.email,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style:
                      TTypography.text14Color.copyWith(color: TTColors.white),
                ),
              ),
              UIHelpers.listDividerWhite,
              MenuTitle(
                index: 0,
                title: 'Dashboard',
                leading: TTIcons.dashboard,
                onTap: () {
                  serviceLocator<AppRouter>()
                      .popAndPush(const DashboardRoute());
                },
              ),
              sharedPreferenceService.role == "employee"
                  ? UIHelpers.horizontalSpaceTiny
                  : MenuTitle(
                      index: 1,
                      title: 'Employees',
                      leading: Icons.person,
                      onTap: () {
                        serviceLocator<AppRouter>()
                            .popAndPush(const ViewEmployeeRoute());
                      },
                    ),
              sharedPreferenceService.role == "employee"
                  ? UIHelpers.horizontalSpaceTiny
                  : MenuTitle(
                      index: 2,
                      title: 'Attendance',
                      leading: Icons.verified_user_rounded,
                      onTap: () {},
                    ),
              sharedPreferenceService.role == "employee"
                  ? UIHelpers.horizontalSpaceTiny
                  : MenuTitle(
                      index: 3,
                      title: 'Groups',
                      leading: Icons.groups,
                      onTap: () {},
                    ),
              MenuTitle(
                index: 4,
                title: 'Leave',
                leading: Icons.person_remove_outlined,
                onTap: () {
                  serviceLocator<AppRouter>()
                      .popAndPush(const LeaveDashboard());
                },
              ),
              MenuTitle(
                index: 5,
                title: 'Timesheet',
                leading: Icons.timelapse_outlined,
                onTap: () {
                  serviceLocator<AppRouter>().popAndPush(const TaskDashboard());
                },
              ),
              const Spacer(),
              Container(
                margin: const EdgeInsets.only(left: 10, bottom: 10),
                decoration: BoxDecoration(
                    color: TTColors.white.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(
                        width: 1, color: TTColors.white.withOpacity(0.5))),
                child: MenuTitle(
                  index: 6,
                  title: 'Logout',
                  leading: Icons.logout_outlined,
                  onTap: () {
                    sharedPreferenceService.clearLoginData();
                    sharedPreferenceService.isLoggedIn = false;
                    serviceLocator<AppRouter>().replace(const LoginRoute());
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
