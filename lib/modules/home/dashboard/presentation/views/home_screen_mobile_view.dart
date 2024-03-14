import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ts_system/modules/home/dashboard/presentation/widgets/appbar_homescreen.dart';
import 'package:ts_system/modules/home/dashboard/presentation/widgets/drawer_homescreen.dart';
import 'package:ts_system/utils/common/custom_button.dart';
import 'package:ts_system/utils/components/tt_colors.dart';
import 'package:ts_system/utils/components/tt_icons.dart';
import 'package:ts_system/utils/components/tt_string.dart';
import 'package:ts_system/utils/components/tt_typography.dart';
import 'package:ts_system/utils/components/ui_helpers.dart';

@RoutePage()
class HomeScreenMobileView extends StatelessWidget {
  const HomeScreenMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(double.infinity, kToolbarHeight),
          child: AppBarHomeScreen()),
      drawer: DrawerHomeScreen(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 14, right: 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UIHelpers.verticalSpaceMedium,
              ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    TTIcons.logo,
                    fit: BoxFit.cover,
                  ),
                ),
                title: Text(TTStrings.name),
                subtitle: Text(TTStrings.email),
              ),
              UIHelpers.verticalSpaceMedium,
              SizedBox(
                  width: double.infinity,
                  child: CustomElevatedButton(
                      backgroundColor: TTColors.primary,
                      borderColor: TTColors.primary,
                      iconColor: TTColors.white,
                      iconData: Icons.login_outlined,
                      onPressed: () {},
                      child: Text('Check In'))),
              UIHelpers.verticalSpaceMedium,
              ListView.separated(
                physics: BouncingScrollPhysics(),
                itemCount: 10,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ListTile(
                    tileColor: TTColors.primary,
                    title: Text(
                      'Total Leaves',
                      style: TTypography.text14Color,
                    ),
                    trailing: Text('1 / 60', style: TTypography.text14Color),
                  );
                },
                separatorBuilder: (context, index) {
                  return UIHelpers.verticalSpaceSmall;
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
