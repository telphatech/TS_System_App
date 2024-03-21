import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ts_system/config/router/app_router.dart';
import 'package:ts_system/config/router/app_router.gr.dart';
import 'package:ts_system/core/services/locator.dart';
import 'package:ts_system/modules/dashboard/presentation/widgets/menu_drawer.dart';
import 'package:ts_system/modules/employee/employee_panel/presentation/widgets/employee_desktop_widget.dart';
import 'package:ts_system/responsive.dart';
import 'package:ts_system/utils/common/app_input_field.dart';
import 'package:ts_system/utils/common/custom_button.dart';
import 'package:ts_system/utils/common/custom_dropdown.dart';
import 'package:ts_system/utils/components/tt_icons.dart';
import 'package:ts_system/utils/components/ui_helpers.dart';
import 'package:ts_system/utils/components/tt_colors.dart';

@RoutePage()
class AddEmployeeMobileView extends StatefulWidget {
  const AddEmployeeMobileView({super.key});

  @override
  State<AddEmployeeMobileView> createState() => _AddEmployeeMobileViewState();
}

class _AddEmployeeMobileViewState extends State<AddEmployeeMobileView> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Responsive.isMobile(context) ? null : const MenuDrawer(),
      appBar: Responsive.isMobile(context)
          ? AppBar(
              leading: IconButton(
                onPressed: () {
                  serviceLocator<AppRouter>().pop();
                },
                icon: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: TTColors.white,
                ),
              ),
              backgroundColor: TTColors.primary,
              iconTheme: const IconThemeData(color: TTColors.white),
              title: const Text(
                'ADD EMPLOYEE',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
              ),
              centerTitle: true,
            )
          : const PreferredSize(
              preferredSize: Size(double.infinity, kToolbarHeight),
              child: AppBarDesktopWidget()),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 25, 10, 0),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AppInputField(
                  label: 'Employee ID',
                  hint: 'Enter Employee ID',
                ),
                UIHelpers.verticalSpaceMedium,
                const AppInputField(
                  label: 'Name',
                  hint: 'Enter Name',
                ),
                UIHelpers.verticalSpaceMedium,
                const AppInputField(
                  label: 'Email',
                  hint: 'Enter Email Address',
                ),
                UIHelpers.verticalSpaceMedium,
                const AppInputField(
                  label: 'Mobile',
                  hint: 'Enter Mobile Number',
                ),
                UIHelpers.verticalSpaceMedium,
                const CustomSearchDropdown(
                  title: 'Role',
                  items: ['employee', 'admin', 'manager'],
                  showSearchBox: false,
                  isMenu: true,
                  hintText: 'Select Role',
                ),
                UIHelpers.verticalSpaceLarge,
                SizedBox(
                  width: double.infinity,
                  child: CustomElevatedButton(
                      onPressed: () {},
                      backgroundColor: TTColors.primary,
                      borderColor: TTColors.primary,
                      iconData: TTIcons.add,
                      iconColor: TTColors.white,
                      child: const Text('Invite Employee')),
                ),
                UIHelpers.verticalSpaceMedium,
                SizedBox(
                  width: double.infinity,
                  child: CustomElevatedButton(
                      onPressed: () {
                        serviceLocator<AppRouter>().replace(EmployeePanel());
                      },
                      backgroundColor: TTColors.white,
                      borderColor: TTColors.primary,
                      iconData: TTIcons.delete,
                      iconColor: TTColors.primary,
                      child: const Text(
                        'Discard',
                        style: TextStyle(color: TTColors.primary),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
