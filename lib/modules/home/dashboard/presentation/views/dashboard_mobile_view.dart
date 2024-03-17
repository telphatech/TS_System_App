import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:ts_system/modules/home/dashboard/presentation/widgets/count_container.dart';
import 'package:ts_system/modules/home/dashboard/presentation/widgets/home_app_bar.dart';
import 'package:ts_system/modules/home/dashboard/presentation/widgets/menu_drawer.dart';
import 'package:ts_system/utils/common/app_text.dart';
import 'package:ts_system/utils/common/custom_button.dart';
import 'package:ts_system/utils/components/tt_colors.dart';
import 'package:ts_system/utils/components/ui_helpers.dart';

@RoutePage()
class DashboardMobileView extends StatelessWidget {
  String welcomeMsg = "";
  bool isSelected = false;
  DashboardMobileView({super.key});

  @override
  Widget build(BuildContext context) {
    var hours = DateTime.now().hour;
    if (hours < 12) {
      welcomeMsg = 'Good Morning';
    } else if (hours < 17) {
      welcomeMsg = 'Good Afternoon';
    } else {
      welcomeMsg = 'Good Evening';
    }
    return PopScope(
      canPop: true,
      onPopInvoked: (didPop) {
        UIHelpers.hideKeyBoard();
        SystemNavigator.pop();
      },
      child: Scaffold(
        appBar: const PreferredSize(
            preferredSize: Size(double.infinity, kToolbarHeight),
            child: HomeAppBar()),
        drawer: const MenuDrawer(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 14, right: 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UIHelpers.verticalSpaceSmall,
                ListTile(
                  leading: const CircleAvatar(
                    radius: 30,
                    backgroundColor: TTColors.white,
                    backgroundImage: NetworkImage(
                      "https://w7.pngwing.com/pngs/81/570/png-transparent-profile-logo-computer-icons-user-user-blue-heroes-logo-thumbnail.png",
                    ),
                  ),
                  title: AppText.body5(
                    welcomeMsg,
                  ),
                  subtitle: AppText.bodyBold2(
                    "John Williams",
                    isSingleLined: true,
                  ),
                ),
                UIHelpers.verticalSpaceSmall,
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: AppText.bodyBold2(
                    "Let's start with the work",
                  ),
                ),
                UIHelpers.verticalSpaceSmall,
                Visibility(
                  visible: true,
                  child: SizedBox(
                      width: double.infinity,
                      child: CustomElevatedButton(
                          backgroundColor: TTColors.primary,
                          borderColor: TTColors.primary,
                          iconColor: TTColors.white,
                          iconData: Icons.login_outlined,
                          onPressed: () {},
                          child: const Text('Check In'))),
                ),
                Visibility(
                  visible: isSelected,
                  child: SizedBox(
                      width: double.infinity,
                      child: CustomElevatedButton(
                          backgroundColor: TTColors.primary,
                          borderColor: TTColors.primary,
                          iconColor: TTColors.white,
                          iconData: Icons.logout_rounded,
                          onPressed: () {},
                          child: const Text('Check Out'))),
                ),
                UIHelpers.verticalSpaceMedium,
                CountContainer(
                  title: 'Leave Used',
                  month: DateTime.now(),
                  count: '2',
                  total: '50',
                ),
                UIHelpers.verticalSpaceSmall,
                CountContainer(
                  title: 'Total Employee',
                  month: DateTime.now(),
                  count: '10',
                  total: '50',
                ),
                UIHelpers.verticalSpaceSmall,
                CountContainer(
                  title: 'On Leave',
                  month: DateTime.now(),
                  count: '1',
                  total: '50',
                ),
                UIHelpers.verticalSpaceSmall,
                CountContainer(
                  title: 'On Leave',
                  month: DateTime.now(),
                  count: '1',
                  total: '50',
                ),
                UIHelpers.verticalSpaceSmall,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
