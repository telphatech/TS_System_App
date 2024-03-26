import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ts_system/core/change_notifiers/common_service.dart';
import 'package:ts_system/modules/dashboard/presentation/widgets/menu_drawer.dart';
import 'package:ts_system/modules/dashboard/presentation/widgets/profile_header.dart';
import 'package:ts_system/modules/employee/view_employee/presentation/widgets/desktop_app_bar.dart';
import 'package:ts_system/utils/common/app_text.dart';
import 'package:ts_system/utils/components/tt_colors.dart';
import 'package:ts_system/utils/components/tt_icons.dart';
import 'package:ts_system/utils/components/ui_helpers.dart';

class DashboardDesktopView extends StatelessWidget {
  const DashboardDesktopView({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size(double.infinity, kToolbarHeight),
        child: AppBarDesktopWidget(),
      ),
      drawer: const MenuDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProfileHeaderWidget(
                profilePic: TTIcons.profilePic,
                name: Provider.of<CommonService>(context)
                    .sharedPreferenceService
                    .name,
                designation: "Backend Developer Intern",
                location: "Pune, Maharshtra",
                empId: Provider.of<CommonService>(context)
                    .sharedPreferenceService
                    .empID,
              ),
              UIHelpers.verticalSpaceRegular,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      height: UIHelpers.screenHeight(context) * 0.35,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: TTColors.primary),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText.subheading("Basic Details"),
                          UIHelpers.verticalSpaceSmall,
                          AppText.primaryBodyLabel(
                              "Email ID: ${Provider.of<CommonService>(context).sharedPreferenceService.email}"),
                          UIHelpers.verticalSpaceSmall,
                          AppText.primaryBodyLabel(
                              "Phone Number: ${Provider.of<CommonService>(context).sharedPreferenceService.phone}"),
                          UIHelpers.verticalSpaceSmall,
                          AppText.primaryBodyLabel(
                              "Designation: Software Engineer Trainee"),
                          UIHelpers.verticalSpaceSmall,
                          AppText.primaryBodyLabel(
                              "Group Name: Future Deciders"),
                          UIHelpers.verticalSpaceSmall,
                          AppText.primaryBodyLabel("Leaves: 20 / 100"),
                        ],
                      ),
                    ),
                  ),
                  UIHelpers.horizontalSpaceMedium,
                  Visibility(
                    visible: UIHelpers.screenWidth(context) >= 1017,
                    child: Container(
                      width: UIHelpers.screenWidth(context) * 0.45,
                      height: UIHelpers.screenHeight(context) * 0.35,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: TTColors.primary),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText.subheading("Reporting Manager"),
                          UIHelpers.verticalSpaceSmall,
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const CircleAvatar(
                                radius: 70,
                                backgroundImage: AssetImage(TTIcons.profilePic),
                              ),
                              UIHelpers.horizontalSpaceRegular,
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AppText.body5underline("Vaibhav Wable"),
                                  UIHelpers.verticalSpaceSmall,
                                  AppText.primaryBodyLabel(
                                      "Software Engineer Trainee"),
                                  UIHelpers.verticalSpaceTiny,
                                  AppText.primaryBodyLabel(
                                      "Employee ID: TT18001"),
                                  UIHelpers.verticalSpaceTiny,
                                  AppText.primaryBodyLabel(
                                      "Email ID: support@telphatech.com"),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
