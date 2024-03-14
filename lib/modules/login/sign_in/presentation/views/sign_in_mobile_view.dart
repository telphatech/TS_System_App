import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ts_system/config/router/app_router.dart';
import 'package:ts_system/config/router/app_router.gr.dart';
import 'package:ts_system/core/services/locator.dart';
import 'package:ts_system/utils/common/app_input_field.dart';
import 'package:ts_system/utils/common/custom_button.dart';
import 'package:ts_system/utils/common/custom_snackbar_service.dart';
import 'package:ts_system/utils/components/tt_colors.dart';
import 'package:ts_system/utils/components/tt_typography.dart';
import 'package:ts_system/utils/components/ui_helpers.dart';

@RoutePage()
class SignInMobileView extends StatefulWidget {
  const SignInMobileView({super.key});

  @override
  State<SignInMobileView> createState() => _SignInMobileViewState();
}

class _SignInMobileViewState extends State<SignInMobileView> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController uidController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool rememberMe = false;
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 24, right: 24),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 67),
                    child: Text(
                      'TM System',
                      style: TTypography.text20PrimaryColor.copyWith(
                        fontWeight: FontWeight.w700,
                        fontSize: 48,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Text(
                    'Sign In',
                    style: TTypography.text20BlackColor.copyWith(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                UIHelpers.verticalSpaceTiny,
                Text(
                  'Add or select your details to continue',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TTypography.text16Grey,
                ),
                UIHelpers.verticalSpaceLarge,
                AppInputField(
                  leading: const Icon(
                    Icons.person,
                    color: TTColors.primary,
                  ),
                  controller: uidController,
                  label: 'Employee ID',
                  hint: 'Enter your Employee ID',
                  validator: (value) {
                    if (value?.startsWith('TM') != true) {
                      return 'Please enter valid Telphatech ID';
                    } else {
                      return null;
                    }
                  },
                ),
                UIHelpers.verticalSpaceMedium,
                AppInputField(
                  label: 'Password',
                  hint: 'Enter your Password',
                  controller: passwordController,
                  leading: const Icon(
                    Icons.lock_open_rounded,
                    color: TTColors.primary,
                  ),
                  trailing: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.remove_red_eye_outlined,
                      color: TTColors.primary,
                    ),
                  ),
                ),
                UIHelpers.verticalSpaceMedium,
                CheckboxMenuButton(
                    value: rememberMe,
                    onChanged: (value) {
                      setState(() {
                        rememberMe = value ?? false;
                      });
                    },
                    child: Text(
                      'Keep me logged In',
                      style: TTypography.text16Black,
                    )),
                UIHelpers.verticalSpaceMedium,
                CustomElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        print("success");
                        uidController.clear();
                        passwordController.clear();
                        serviceLocator<AppRouter>()
                            .replace(HomeRouteMobileView());
                      } else {
                        CustomSnackBarService().showErrorSnackBar(context,
                            message: 'Please enter all fields');
                      }
                    },
                    backgroundColor: TTColors.primary,
                    borderColor: TTColors.primary,
                    child: const Text('Sign In'),
                    iconColor: TTColors.white)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
