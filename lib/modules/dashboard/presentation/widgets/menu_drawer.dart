import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ts_system/config/router/app_router.dart';
import 'package:ts_system/config/router/app_router.gr.dart';
import 'package:ts_system/core/change_notifiers/common_service.dart';
import 'package:ts_system/core/services/locator.dart';
import 'package:ts_system/core/services/shared_preference.dart';
import 'package:ts_system/responsive.dart';
import 'package:ts_system/utils/common/app_text.dart';
import 'package:ts_system/utils/components/tt_colors.dart';
import 'package:ts_system/utils/components/tt_icons.dart';
import 'package:ts_system/utils/components/tt_typography.dart';
import 'package:ts_system/utils/components/ui_helpers.dart';

class MenuDrawer extends StatefulWidget {
  const MenuDrawer({Key? key}) : super(key: key);

  @override
  State<MenuDrawer> createState() => _MenuDrawerState();
}

class _MenuDrawerState extends State<MenuDrawer> {
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
              ListTile(
                selected:
                    Provider.of<CommonService>(context).selectedMenuItem == 0,
                contentPadding: const EdgeInsets.only(left: 8),
                selectedTileColor: const Color.fromRGBO(255, 255, 255, 0.5),
                title: Text(
                  'Dashboard',
                  style: TTypography.normal.copyWith(color: TTColors.white),
                ),
                leading: const Icon(
                  TTIcons.dashboard,
                  color: TTColors.white,
                ),
                onTap: () {
                  Provider.of<CommonService>(context, listen: false)
                      .setSelectedMenuItem(0, notify: false);
                  serviceLocator<AppRouter>().popUntil(
                      (route) => route.data?.name == DashboardRoute.name);
                },
              ),
              UIHelpers.verticalSpaceTiny,
              if (sharedPreferenceService.role == "admin")
                ListTile(
                  selected:
                      Provider.of<CommonService>(context).selectedMenuItem == 1,
                  contentPadding: const EdgeInsets.only(left: 8),
                  selectedTileColor: const Color.fromRGBO(255, 255, 255, 0.5),
                  title: Text(
                    'Organization',
                    style: TTypography.normal.copyWith(color: TTColors.white),
                  ),
                  leading: const Icon(
                    Icons.business_rounded,
                    color: TTColors.white,
                  ),
                  onTap: () {
                    Provider.of<CommonService>(context, listen: false)
                        .setSelectedMenuItem(1, notify: false);
                    serviceLocator<AppRouter>()
                        .popAndPush(const ConfigurationSystemRoute());
                  },
                ),
              UIHelpers.verticalSpaceTiny,
              ListTile(
                selected:
                    Provider.of<CommonService>(context).selectedMenuItem == 2,
                contentPadding: const EdgeInsets.only(left: 8),
                selectedTileColor: const Color.fromRGBO(255, 255, 255, 0.5),
                title: Text(
                  'Leave',
                  style: TTypography.normal.copyWith(color: TTColors.white),
                ),
                leading: const Icon(
                  Icons.person_remove_rounded,
                  color: TTColors.white,
                ),
                onTap: () {
                  Provider.of<CommonService>(context, listen: false)
                      .setSelectedMenuItem(2, notify: false);
                  serviceLocator<AppRouter>()
                      .popAndPush(const LeaveDashboard());
                },
              ),
              UIHelpers.verticalSpaceTiny,
              ListTile(
                selected:
                    Provider.of<CommonService>(context).selectedMenuItem == 3,
                contentPadding: const EdgeInsets.only(left: 8),
                selectedTileColor: const Color.fromRGBO(255, 255, 255, 0.5),
                title: Text(
                  'Timesheet',
                  style: TTypography.normal.copyWith(color: TTColors.white),
                ),
                leading: const Icon(
                  Icons.timelapse_outlined,
                  color: TTColors.white,
                ),
                onTap: () {
                  Provider.of<CommonService>(context, listen: false)
                      .setSelectedMenuItem(3, notify: false);
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
                child: ListTile(
                  contentPadding: const EdgeInsets.only(left: 8),
                  selectedTileColor: const Color.fromRGBO(255, 255, 255, 0.5),
                  title: Text(
                    'Logout',
                    style: TTypography.normal.copyWith(color: TTColors.white),
                  ),
                  leading: const Icon(
                    Icons.logout_outlined,
                    color: TTColors.white,
                  ),
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                              title: const Text('Logout'),
                              content: const Text('Do you want to logout?'),
                              actions: [
                                TextButton(
                                  onPressed: () async {
                                    await deleteAndLogout();
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

  Future<void> deleteAndLogout() async {
    await serviceLocator<SharedPreferenceService>().clearLoginData();
    serviceLocator<AppRouter>().replace(const SplashRouteMobileView());
  }
}
