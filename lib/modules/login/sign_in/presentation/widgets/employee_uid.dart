import 'package:flutter/material.dart';
import 'package:ts_system/utils/common/app_input_validations.dart';
import 'package:ts_system/utils/components/tt_colors.dart';
import 'package:ts_system/utils/components/tt_typography.dart';

class EmployeeUIDTextField extends StatelessWidget {
  const EmployeeUIDTextField({
    super.key,
    required this.uidController,
  });

  final TextEditingController uidController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextFormField(
        controller: uidController,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: const BorderSide(
              color: TTColors.primary,
              width: 2.0,
            ),
          ),
          labelText: 'Employee UID',
          hintStyle: TTypography.text20Bold,
          prefixIcon: const Icon(
            Icons.mail,
            color: TTColors.primary,
          ),
        ),
        validator: (value) => Validations.validateEmail(value),
      ),
    );
  }
}
