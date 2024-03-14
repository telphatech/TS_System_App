import 'package:flutter/material.dart';
import 'package:ts_system/utils/components/tt_colors.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Align(
        alignment: Alignment.centerRight,
        child: GestureDetector(
          onTap: () {},
          child: const Text(
            'Forget Password?',
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: TextStyle(
              fontSize: 18,
              color: TTColors.primary,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ),
    );
  }
}
