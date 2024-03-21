import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ts_system/config/router/app_router.dart';
import 'package:ts_system/core/services/locator.dart';
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
      appBar: AppBar(
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
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
      ),
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
                  hint: 'Enter Email',
                ),
                UIHelpers.verticalSpaceMedium,
                AppInputField(
                  label: 'Password',
                  password: true,
                  hint: 'Enter Password',
                  trailing: IconButton(
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                    icon: Icon(
                      _obscureText ? TTIcons.visibilityOff : TTIcons.visibility,
                      color: TTColors.primary,
                    ),
                  ),
                ),
                UIHelpers.verticalSpaceMedium,
                const CustomSearchDropdown(
                  items: ['employee', 'admin', 'manager'],
                  showSearchBox: false,
                  isMenu: true,
                  hintText: 'Select Role',
                ),
                UIHelpers.verticalSpaceMedium,
                const AppInputField(
                  label: 'Position',
                  hint: 'Enter Position',
                ),
                UIHelpers.verticalSpaceMedium,
                const CustomSearchDropdown(
                  items: ['onjob', 'resigned'],
                  showSearchBox: false,
                  isMenu: true,
                  hintText: 'Select Status',
                ),
                UIHelpers.verticalSpaceLarge,
                SizedBox(
                  width: double.infinity,
                  child: CustomElevatedButton(
                      onPressed: () {},
                      backgroundColor: TTColors.primary,
                      borderColor: TTColors.primary,
                      iconData: TTIcons.check,
                      iconColor: TTColors.white,
                      child: const Text('Save')),
                ),
                UIHelpers.verticalSpaceMedium,
                SizedBox(
                  width: double.infinity,
                  child: CustomElevatedButton(
                      onPressed: () {
                        serviceLocator<AppRouter>().pop();
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
