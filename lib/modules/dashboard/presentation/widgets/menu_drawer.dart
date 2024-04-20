import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ts_system/config/router/app_router.dart';
import 'package:ts_system/config/router/app_router.gr.dart';
import 'package:ts_system/core/change_notifiers/common_service.dart';
import 'package:ts_system/core/services/locator.dart';
import 'package:ts_system/core/services/shared_preference.dart';
import 'package:ts_system/modules/dashboard/presentation/widgets/menu_title.dart';
import 'package:ts_system/responsive.dart';
import 'package:ts_system/utils/common/app_text.dart';
import 'package:ts_system/utils/components/tt_colors.dart';
import 'package:ts_system/utils/components/tt_icons.dart';
import 'package:ts_system/utils/components/tt_typography.dart';
import 'package:ts_system/utils/components/ui_helpers.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sharedPreferenceService = serviceLocator<SharedPreferenceService>();

    return Padding(
      padding: EdgeInsets.only(right: UIHelpers.screenWidth(context) * 0.2),
      child: Drawer(
        width: Responsive.isMobile(context)
            ? UIHelpers.screenWidth(context) * 0.8
            : null,
        shape: Border.all(
          width: 0,
          color: TTColors.white.withOpacity(0.5),
          style: BorderStyle.solid,
        ),
        backgroundColor: TTColors.primary,
        child: Padding(
          padding: EdgeInsets.fromLTRB(
            10.0,
            UIHelpers.screenHeight(context) * 0.05,
            10.0,
            0.0,
          ),
          child: Column(
            children: [
              ListTile(
                title: Text(
                  sharedPreferenceService.name,
                  style: TTypography.normal.copyWith(color: TTColors.white),
                ),
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
                isSelected: Provider.of<CommonService>(context, listen: true)
                        .selectedMenuItem ==
                    0,
                onTap: () {
                  Provider.of<CommonService>(context, listen: false)
                      .setSelectedMenuItem(0);
                  serviceLocator<AppRouter>().popUntil(
                      (route) => route.data?.name == DashboardRoute.name);
                  serviceLocator<AppRouter>().pop();
                },
              ),
              UIHelpers.verticalSpaceTiny,
              if (sharedPreferenceService.role != "employee")
                MenuTitle(
                  index: 1,
                  title: 'Organization',
                  leading: Icons.business_rounded,
                  isSelected: Provider.of<CommonService>(context, listen: true)
                          .selectedMenuItem ==
                      1,
                  onTap: () {
                    Provider.of<CommonService>(context, listen: false)
                        .setSelectedMenuItem(1);
                    serviceLocator<AppRouter>()
                        .popAndPush(const ViewEmployeeRoute());
                  },
                ),
              UIHelpers.verticalSpaceTiny,
              if (sharedPreferenceService.role != "employee")
                MenuTitle(
                  index: 2,
                  title: 'Attendance',
                  leading: Icons.done_all_rounded,
                  isSelected:
                      Provider.of<CommonService>(context).selectedMenuItem == 2,
                  onTap: () {
                    Provider.of<CommonService>(context, listen: false)
                        .setSelectedMenuItem(2);
                  },
                ),
              UIHelpers.verticalSpaceTiny,
              MenuTitle(
                index: 3,
                title: 'Leave',
                leading: Icons.person_remove_outlined,
                isSelected:
                    Provider.of<CommonService>(context).selectedMenuItem == 3,
                onTap: () {
                  Provider.of<CommonService>(context, listen: false)
                      .setSelectedMenuItem(3);
                  serviceLocator<AppRouter>()
                      .popAndPush(const LeaveDashboard());
                },
              ),
              UIHelpers.verticalSpaceTiny,
              MenuTitle(
                index: 4,
                title: 'Timesheet',
                leading: Icons.timelapse_outlined,
                isSelected:
                    Provider.of<CommonService>(context).selectedMenuItem == 4,
                onTap: () {
                  Provider.of<CommonService>(context, listen: false)
                      .setSelectedMenuItem(4);
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
                    width: 1,
                    color: TTColors.white.withOpacity(0.5),
                  ),
                ),
                child: MenuTitle(
                  index: 5,
                  title: 'Logout',
                  isSelected: false,
                  leading: Icons.logout_outlined,
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                              title: const Text('Logout'),
                              content: const Text('Do you want to logout?'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    serviceLocator<AppRouter>().pop();
                                    sharedPreferenceService.clearLoginData();
                                    serviceLocator<AppRouter>()
                                        .replace(const SplashRouteMobileView());
                                  },
                                  child: AppText.body(
                                    'Yes',
                                    color: TTColors.primary,
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    serviceLocator<AppRouter>().pop();
                                  },
                                  child: AppText.body(
                                    'No',
                                    color: TTColors.primary,
                                  ),
                                ),
                              ],
                            ));
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
