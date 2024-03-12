import 'package:flutter/material.dart';
import 'package:ts_system/utils/components/tt_colors.dart';
import 'package:ts_system/utils/components/tt_typography.dart';

class CheckLogin extends StatelessWidget {
  const CheckLogin({
    super.key,
    required GlobalKey<FormState> formKey,
    required this.uidController,
    required this.passwordController,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;
  final TextEditingController uidController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: SizedBox(
        width: double.infinity,
        height: 50,
        child: ElevatedButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              // ignore: avoid_print
              print('Login Successful.');
              uidController.clear();
              passwordController.clear();
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: TTColors.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Text('SIGN IN', style: TTypography.text20BoldColor),
        ),
      ),
    );
  }
}
