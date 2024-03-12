import 'package:flutter/material.dart';
import 'package:ts_system/modules/login/sign_in/presentation/views/sign_in_mobile_view.dart';
import 'package:ts_system/utils/components/tt_colors.dart';
import 'package:ts_system/utils/components/tt_icons.dart';
import 'package:ts_system/utils/components/tt_image.dart';
import 'package:ts_system/utils/components/tt_string.dart';
import 'package:ts_system/utils/components/tt_typography.dart';
import 'package:ts_system/utils/components/ui_helpers.dart';

class DrawerHomeScreen extends StatelessWidget {
  const DrawerHomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        UserAccountsDrawerHeader(
          accountName: Row(
            children: [
              const CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage(TTImages.profilepic),
              ),
              UIHelpers.horizontalSpaceTiny,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    TTStrings.name,
                    style: TTypography.text20BoldColor,
                  ),
                  Text(
                    TTStrings.email,
                    style: TTypography.text14Color,
                  ),
                ],
              ),
            ],
          ),
          accountEmail: const Text(""),
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(color: TTColors.grey, width: 0.1),
            ),
          ),
        ),
        UIHelpers.verticalSpaceTiny,
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
        UIHelpers.verticalSpaceTiny,
        ListTile(
          leading: const Icon(TTIcons.checkbox, color: TTColors.white),
          title: Text(
            'Manage Employees',
            style: TTypography.text16Color,
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SignInMobileView()),
            );
          },
        ),
        UIHelpers.verticalSpaceTiny,
        ListTile(
          leading: const Icon(TTIcons.toggle, color: TTColors.white),
          title: Text(
            'Manage Attendances',
            style: TTypography.text16Color,
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SignInMobileView()),
            );
          },
        ),
        UIHelpers.verticalSpaceTiny,
        ListTile(
          leading: const Icon(TTIcons.calender, color: TTColors.white),
          title: Text(
            'Manage Leaves',
            style: TTypography.text16Color,
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SignInMobileView()),
            );
          },
        ),
        UIHelpers.verticalSpaceTiny,
        ListTile(
          leading: const Icon(TTIcons.setting, color: TTColors.white),
          title: Text(
            'Settings',
            style: TTypography.text16Color,
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SignInMobileView()),
            );
          },
        ),
        UIHelpers.verticalSpaceTiny,
        ListTile(
          leading: const Icon(TTIcons.help, color: TTColors.white),
          title: Text(
            'Help & Support',
            style: TTypography.text16Color,
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SignInMobileView()),
            );
          },
        ),
        const SizedBox(height: 100),
        Align(
          alignment: Alignment.bottomCenter,
          child: Column(
            children: [
              UIHelpers.listDividerWhite,
              ListTile(
                leading: const Icon(TTIcons.logout, color: TTColors.white),
                title: Text(
                  'Logout',
                  style: TTypography.text16Color,
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SignInMobileView()),
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
