abstract class EmployeeRegisterState {}

class EmployeeRegisterInitial extends EmployeeRegisterState {}

class EmployeeRegisterLoading extends EmployeeRegisterState {}

class EmployeeRegisterSuccess extends EmployeeRegisterState {
  final String message;
  final String status;
  EmployeeRegisterSuccess(this.message, this.status);
}

class EmployeeRegisterError extends EmployeeRegisterState {
  final String message;
  final String status;
  EmployeeRegisterError(this.message, this.status);
}

class EmployeeRegisterFailure extends EmployeeRegisterState {}
