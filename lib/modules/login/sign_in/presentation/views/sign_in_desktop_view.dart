import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ts_system/modules/login/sign_in/presentation/views/sign_in_mobile_view.dart';
import 'package:ts_system/responsive.dart';
import 'package:ts_system/utils/common/app_input_field.dart';
import 'package:ts_system/utils/common/text_style.dart';
import 'package:ts_system/utils/components/tt_colors.dart';
import 'package:ts_system/utils/components/tt_typography.dart';
import 'package:ts_system/utils/components/ui_helpers.dart';

@RoutePage()
class SignInDesktopView extends StatelessWidget {
  static var page;

  const SignInDesktopView({super.key});

  @override
  Widget build(BuildContext context) {
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
                    style: heading1Style.copyWith(fontWeight: FontWeight.bold),
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
