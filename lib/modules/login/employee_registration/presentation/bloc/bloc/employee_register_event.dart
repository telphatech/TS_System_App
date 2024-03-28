import 'package:ts_system/modules/login/sign_in/domain/entities/invitation_attributes.dart';

abstract class EmployeeRegisterEvent {}

class EmployeeRegisterInitialEvent extends EmployeeRegisterEvent {}

class EmployeeRegisterChangePasswordEvent extends EmployeeRegisterEvent {}

class EmployeeRegisterChangeConfirmPasswordEvent
    extends EmployeeRegisterEvent {}

class StoreValuesEvent extends EmployeeRegisterEvent {
  InvitationAttributesItems? invitationAttributesItems;
  StoreValuesEvent({required this.invitationAttributesItems});
}
