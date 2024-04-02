abstract class CheckInState {}

class CheckInInitial extends CheckInState {}

class CheckInLoading extends CheckInState {}

class CheckInSuccess extends CheckInState {
  final String message;
  CheckInSuccess({required this.message});
}

class CheckInError extends CheckInState {
  String? message;

  CheckInError({
    this.message,
  });
}

class CheckInFailure extends CheckInState {}

class CheckOutLoading extends CheckInState {}

class CheckOutSuccess extends CheckInState {
  final String message;

  CheckOutSuccess({
    required this.message,
  });
}

class CheckOutError extends CheckInState {
  String? message;

  CheckOutError({
    this.message,
  });
}

class CheckOutFailure extends CheckInState {}

class ShiftStatusLoading extends CheckInState {}

class ShiftStatusSuccess extends CheckInState {}

class ShiftStatusError extends CheckInState {}

class ShiftStatusFailure extends CheckInState {}
