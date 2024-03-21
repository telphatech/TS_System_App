import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ts_system/config/router/app_router.dart';
import 'package:ts_system/config/router/app_router.gr.dart';
import 'package:ts_system/core/services/locator.dart';
import 'package:ts_system/modules/dashboard/presentation/widgets/menu_drawer.dart';
import 'package:ts_system/utils/common/app_text.dart';
import 'package:ts_system/utils/common/custom_button.dart';
import 'package:ts_system/utils/components/tt_colors.dart';
import 'package:ts_system/utils/components/ui_helpers.dart';

@RoutePage()
class EmployeePanel extends StatelessWidget {
  const EmployeePanel({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: true,
        onPopInvoked: (didPop) {
          UIHelpers.hideKeyBoard();
          serviceLocator<AppRouter>().popAndPush(DashboardMobileView());
        },
        child: Scaffold(
          drawer: const MenuDrawer(),
          appBar: AppBar(
            backgroundColor: TTColors.primary,
            iconTheme: const IconThemeData(color: TTColors.white),
            title: const Text(
              'EMPLOYEE',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UIHelpers.verticalSpaceRegular,
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: AppText.headingTwo("Total Employee: 10"),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: CustomElevatedButton(
                          onPressed: () {
                            serviceLocator<AppRouter>()
                                .push(const AddEmployeeMobileView());
                          },
                          backgroundColor: TTColors.white,
                          borderColor: TTColors.primary,
                          iconColor: TTColors.primary,
                          iconData: Icons.add,
                          child: AppText.body('Add Employees'),
                        ),
                      ),
                      UIHelpers.horizontalSpaceRegular,
                      Expanded(
                        child: CustomElevatedButton(
                          onPressed: () {
                            serviceLocator<AppRouter>()
                                .push(const ViewEmployeeMobileView());
                          },
                          backgroundColor: TTColors.white,
                          borderColor: TTColors.primary,
                          iconColor: TTColors.primary,
                          iconData: Icons.remove_red_eye_rounded,
                          child: AppText.body('View Employees'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
