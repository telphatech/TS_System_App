import 'package:flutter/material.dart';
import 'package:ts_system/config/router/app_router.dart';
import 'package:ts_system/core/services/locator.dart';
import 'package:ts_system/utils/common/app_input_field.dart';
import 'package:ts_system/utils/common/app_text.dart';
import 'package:ts_system/utils/common/custom_button.dart';
import 'package:ts_system/utils/common/custom_dropdown.dart';
import 'package:ts_system/utils/components/tt_colors.dart';
import 'package:ts_system/utils/components/ui_helpers.dart';

class ApplyLeaveDialog extends StatelessWidget {
  const ApplyLeaveDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomSearchDropdown(
              title: 'Leave Type',
              items: ["Sick Leave", "Casual Leave", "Earned Leave"],
              showSearchBox: false,
              isMenu: true,
            ),
            UIHelpers.verticalSpaceSmall,
            const Align(
              alignment: Alignment.topRight,
              child: Text("Balance Leave: 1"),
            ),
            UIHelpers.verticalSpaceSmall,
            AppInputField(
              hint: 'From Date',
              readOnly: true,
              onTap: () {
                showDatePicker(
                    context: context,
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2030));
              },
              trailing: const Icon(
                Icons.calendar_month_rounded,
                color: TTColors.primary,
              ),
            ),
            UIHelpers.verticalSpaceSmall,
            AppInputField(
              onTap: () {
                showDatePicker(
                    context: context,
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2030));
              },
              hint: 'To Date',
              readOnly: true,
              trailing: const Icon(
                Icons.calendar_month_rounded,
                color: TTColors.primary,
              ),
            ),
            UIHelpers.verticalSpaceSmall,
            Align(
                alignment: Alignment.topLeft,
                child: AppText.body("Duration: 0 days")),
            UIHelpers.verticalSpaceSmall,
            const AppInputField(
              hint: 'Reason',
              maxLines: 5,
            ),
            UIHelpers.verticalSpaceMedium,
            SizedBox(
              width: double.infinity,
              child: CustomElevatedButton(
                  onPressed: () {},
                  backgroundColor: TTColors.primary,
                  borderColor: TTColors.primary,
                  iconColor: TTColors.white,
                  child: const Text('Apply Leave')),
            ),
            UIHelpers.verticalSpaceSmall,
            SizedBox(
              width: double.infinity,
              child: CustomElevatedButton(
                  onPressed: () {
                    serviceLocator<AppRouter>().pop();
                  },
                  backgroundColor: TTColors.white,
                  borderColor: TTColors.white,
                  iconColor: TTColors.primary,
                  child: AppText.body(
                    'Cancel Leave',
                    color: TTColors.primary,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
