abstract class InviteEmployeeState {}

class InviteEmployeeInitial extends InviteEmployeeState {}

class InviteEmployeeLoading extends InviteEmployeeState {}

class InviteEmployeeSuccess extends InviteEmployeeState {
  final String message;
  final String status;
  InviteEmployeeSuccess({required this.message, required this.status});
}

class InviteEmployeeError extends InviteEmployeeState {
  final String message;
  final String status;
  InviteEmployeeError({required this.message, required this.status});
}

class InviteEmployeeFailure extends InviteEmployeeState {}
