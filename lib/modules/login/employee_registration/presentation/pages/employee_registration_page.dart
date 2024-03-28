import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ts_system/modules/login/employee_registration/presentation/views/employee_registration_desktop_view.dart';
import 'package:ts_system/modules/login/employee_registration/presentation/views/employee_registration_mobile_view.dart';
import 'package:ts_system/modules/login/sign_in/domain/entities/invitation_attributes.dart';
import 'package:ts_system/responsive.dart';

@RoutePage()
class EmployeeRegistrationPage extends StatelessWidget {
  final InvitationAttributesItems? invitationAttributesItems;
  const EmployeeRegistrationPage(
      {super.key, required this.invitationAttributesItems});

  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: EmployeeRegistrationMobileView(
        invitationAttributesItems: invitationAttributesItems,
      ),
      desktop: const EmployeeRegistrationDesktopView(),
    );
  }
}
