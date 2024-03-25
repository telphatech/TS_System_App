import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ts_system/core/change_notifiers/common_service.dart';
import 'package:ts_system/utils/common/app_text.dart';
import 'package:ts_system/utils/common/custom_button.dart';
import 'package:ts_system/utils/components/tt_colors.dart';
import 'package:ts_system/utils/components/ui_helpers.dart';

class AppBarDesktopWidget extends StatelessWidget {
  const AppBarDesktopWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: TTColors.primary,
      iconTheme: const IconThemeData(color: TTColors.white),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: SizedBox(
            width: 100,
            child: CustomElevatedButton(
                onPressed: () {},
                backgroundColor: TTColors.white,
                borderColor: TTColors.white,
                iconColor: TTColors.white,
                child: AppText.body(
                  'Check In',
                  color: TTColors.primary,
                )),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(left: 5),
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(width: 1, color: TTColors.white)),
          child: Row(
            children: [
              const Icon(Icons.person, color: TTColors.white),
              UIHelpers.horizontalSpaceTiny,
              AppText.body(
                  Provider.of<CommonService>(context)
                      .sharedPreferenceService
                      .name,
                  color: TTColors.white),
              PopupMenuButton<String>(
                position: PopupMenuPosition.under,
                elevation: 0,
                tooltip: 'Profile',
                clipBehavior: Clip.antiAliasWithSaveLayer,
                padding: const EdgeInsets.all(0),
                icon: const Icon(Icons.arrow_drop_down, color: TTColors.white),
                onSelected: (value) {
                  if (value == 'dashboard') {
                  } else if (value == 'logout') {}
                },
                itemBuilder: (BuildContext context) => [
                  PopupMenuItem<String>(
                    value: 'dashboard',
                    child: Column(
                      children: [
                        const Row(
                          children: [
                            Icon(Icons.dashboard, color: TTColors.primary),
                            SizedBox(width: 10),
                            Text('Dashboard',
                                style: TextStyle(color: TTColors.black)),
                          ],
                        ),
                        UIHelpers.listDividerWhite,
                      ],
                    ),
                  ),
                  PopupMenuItem<String>(
                    value: 'color',
                    child: Column(
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CircleAvatar(
                              radius: 15,
                              backgroundColor: TTColors.accent,
                            ),
                            CircleAvatar(
                              radius: 15,
                              backgroundColor: TTColors.warning,
                            ),
                            CircleAvatar(
                              radius: 15,
                              backgroundColor: TTColors.success,
                            ),
                          ],
                        ),
                        UIHelpers.listDividerWhite,
                      ],
                    ),
                  ),
                  const PopupMenuItem<String>(
                    value: 'logout',
                    child: Row(
                      children: [
                        Icon(Icons.logout, color: TTColors.primary),
                        SizedBox(width: 10),
                        Text('Logout', style: TextStyle(color: TTColors.black)),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
