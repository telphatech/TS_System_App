abstract class LoginEvent {}

class LoginInitialEvent extends LoginEvent {
  final String refId;
  final String password;

  LoginInitialEvent({required this.refId, required this.password});
}

class PassToggleEvent extends LoginEvent {}

class InvitationCodeEvent extends LoginEvent {
  final String? code;
  InvitationCodeEvent(this.code);
}
