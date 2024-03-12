import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ts_system/modules/login/sign_in/presentation/widgets/app_title.dart';
import 'package:ts_system/modules/login/sign_in/presentation/widgets/check_login_details.dart';
import 'package:ts_system/modules/login/sign_in/presentation/widgets/employee_uid.dart';
import 'package:ts_system/modules/login/sign_in/presentation/widgets/forget_password.dart';
import 'package:ts_system/utils/common/app_input_validations.dart';
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
                  const ForgetPassword(),
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
  }
}
