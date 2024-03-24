import 'package:ts_system/modules/login/sign_in/domain/entities/login_attributes.dart';

abstract class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginSuccess extends LoginState {
  LoginAttributesItems? empLoginAttributesItems;
  LoginSuccess(this.empLoginAttributesItems);
}

final class LoginError extends LoginState {
  LoginAttributesItems? empLoginAttributesItems;
  LoginError(this.empLoginAttributesItems);
}

final class LoginFailure extends LoginState {}
