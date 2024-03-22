import 'package:flutter/material.dart';
import 'package:ts_system/utils/common/app_text.dart';
import 'package:ts_system/utils/components/tt_colors.dart';
import 'package:ts_system/utils/components/ui_helpers.dart';

class ProfileHeaderWidget extends StatelessWidget {
  final String profilePic;
  final String name;
  final String location;
  final String empId;
  final String designation;
  const ProfileHeaderWidget({
    super.key,
    required this.profilePic,
    required this.name,
    required this.location,
    required this.empId,
    required this.designation,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: TTColors.primary),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 80,
            backgroundImage: AssetImage(profilePic),
          ),
          UIHelpers.horizontalSpaceRegular,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText.headline(name),
              UIHelpers.verticalSpaceSmall,
              Row(
                children: [
                  const Icon(
                    Icons.location_city,
                    color: TTColors.primary,
                    size: 18,
                  ),
                  UIHelpers.horizontalSpaceTiny,
                  AppText.body5underline(location),
                ],
              ),
              UIHelpers.verticalSpaceTiny,
              AppText.primaryBodyLabel(designation),
              UIHelpers.verticalSpaceTiny,
              AppText.primaryBodyLabel("Employee ID: $empId"),
            ],
          ),
        ],
      ),
    );
  }
}
