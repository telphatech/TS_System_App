import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ts_system/modules/login/sign_in/presentation/widgets/app_title.dart';
import 'package:ts_system/modules/login/sign_in/presentation/widgets/check_login_details.dart';
import 'package:ts_system/modules/login/sign_in/presentation/widgets/employee_uid.dart';
import 'package:ts_system/modules/login/sign_in/presentation/widgets/forget_password.dart';
import 'package:ts_system/responsive.dart';
import 'package:ts_system/utils/common/app_input_field.dart';
import 'package:ts_system/utils/common/app_input_validations.dart';
import 'package:ts_system/utils/common/text_style.dart';
import 'package:ts_system/utils/components/tt_colors.dart';
import 'package:ts_system/utils/components/tt_icons.dart';
import 'package:ts_system/utils/components/tt_typography.dart';
import 'package:ts_system/utils/components/ui_helpers.dart';

@RoutePage()
class SignInScreenView extends StatefulWidget {
  SignInScreenView({super.key});

  @override
  State<SignInScreenView> createState() => _SignInScreenViewState();
}

class _SignInScreenViewState extends State<SignInScreenView> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController uidController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  bool rememberMe = false;

  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    if (Responsive.isMobile(context)) {
      return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 67),
              const AppTitle(),
              Padding(
                padding: const EdgeInsets.only(top: 50, left: 25),
                child: Text('Sign In', style: TTypography.text30Black),
              ),
              UIHelpers.verticalSpaceTiny,
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: Expanded(
                  child: Text(
                    'Add or select your details to continue',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TTypography.text16Grey,
                  ),
                ),
              ),
              UIHelpers.verticalSpaceLarge,
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    EmployeeUIDTextField(uidController: uidController),
                    UIHelpers.verticalSpaceLarge,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: TextFormField(
                        controller: passwordController,
                        obscureText: _obscureText,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: const BorderSide(
                              color: TTColors.primary,
                              width: 2.0,
                            ),
                          ),
                          labelText: 'Password',
                          hintStyle: TTypography.text20Bold,
                          prefixIcon: const Icon(
                            Icons.lock,
                            color: TTColors.primary,
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscureText
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                            color: TTColors.primary,
                            onPressed: () {
                              setState(() {
                                _obscureText = !_obscureText;
                              });
                            },
                          ),
                        ),
                        validator: (value) =>
                            Validations.passwordValidation(value),
                      ),
                    ),
                  ],
                ),
              ),
              UIHelpers.verticalSpaceMedium,
              Padding(
                padding: const EdgeInsets.only(left: 18, right: 18),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: CheckboxListTile(
                        title: const Text('Remember Me'),
                        activeColor: TTColors.primary,
                        value: rememberMe,
                        controlAffinity: ListTileControlAffinity.leading,
                        onChanged: (value) {
                          setState(() {
                            rememberMe = value!;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              UIHelpers.verticalSpaceMedium,
              CheckLogin(
                  formKey: _formKey,
                  uidController: uidController,
                  passwordController: passwordController),
            ],
          ),
        ),
      );
    } else {
      return Scaffold(
        backgroundColor: TTColors.white,
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                decoration: const BoxDecoration(color: TTColors.white),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/logo.png',
                    ),
                    UIHelpers.verticalSpaceSmall,
                    Text(
                      "TM SYSTEM",
                      style:
                          heading1Style.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const Text("Empowering Employee Growth"),
                  ],
                ),
              ),
            ),
            Container(width: 2, height: double.infinity, color: TTColors.grey),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(left: 24, top: 14),
                decoration: const BoxDecoration(color: TTColors.white),
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("SIGN IN", style: heading1Style),
                    Text(
                      "Please login to continue to your account.",
                      style: TTypography.normal.copyWith(color: TTColors.grey),
                    ),
                    UIHelpers.verticalSpaceMedium,
                    const Padding(
                      padding: EdgeInsets.only(right: 24),
                      child: AppInputField(
                        hint: 'Enter your employee ID',
                        label: 'Employee ID',
                        leading: Icon(
                          Icons.person,
                          color: TTColors.primary,
                        ),
                      ),
                    ),
                    UIHelpers.verticalSpaceSmall,
                    const Padding(
                      padding: EdgeInsets.only(right: 24),
                      child: AppInputField(
                        hint: 'Enter your Password',
                        leading: Icon(
                          Icons.lock,
                          color: TTColors.primary,
                        ),
                        password: true,
                        label: 'Password',
                        trailing: Icon(
                          Icons.remove_red_eye_rounded,
                          color: TTColors.primary,
                        ),
                      ),
                    ),
                    UIHelpers.verticalSpaceSmall,
                    CheckboxListTile(
                      title: const Text('Keep me logged in'),
                      activeColor: TTColors.primary,
                      value: false,
                      controlAffinity: ListTileControlAffinity.leading,
                      contentPadding: const EdgeInsets.all(0),
                      checkColor: TTColors.primary,
                      onChanged: (value) {},
                    ),
                    UIHelpers.verticalSpaceSmall,
                    Padding(
                      padding: const EdgeInsets.only(right: 24),
                      child: SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                              onPressed: () {}, child: const Text('SIGN IN'))),
                    ),
                    UIHelpers.verticalSpaceMedium,
                    Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 24),
                        child: Text(
                          'Powered By Telphatech LLP',
                          style: TTypography.text20Bold
                              .copyWith(color: TTColors.primary),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }
  }
}
