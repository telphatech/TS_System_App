import 'package:ts_system/modules/login/sign_in/domain/entities/invitation_attributes.dart';
import 'package:ts_system/modules/login/sign_in/domain/entities/login_attributes.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  LoginAttributesItems? empLoginAttributesItems;
  LoginSuccess(this.empLoginAttributesItems);
}

class LoginError extends LoginState {
  LoginAttributesItems? empLoginAttributesItems;
  LoginError(this.empLoginAttributesItems);
}

class LoginFailure extends LoginState {}

class InvitationCodeLoading extends LoginState {}

class InvitationCodeFailure extends LoginState {}

class InvitationCodeError extends LoginState {
  final String message;
  InvitationCodeError(this.message);
}

class InvitationCodeSuccess extends LoginState {
  InvitationAttributesItems? invitationAttributesItems;
  InvitationCodeSuccess(this.invitationAttributesItems);
}
