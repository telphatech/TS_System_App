import 'package:equatable/equatable.dart';

class LoginAttributesItems extends Equatable {
  final String? message;
  final String? status;
  final EmpInfoAttributesItems? empInfo;
  final String? token;

  const LoginAttributesItems({
    this.message,
    this.status,
    this.empInfo,
    this.token,
  });

  @override
  List<Object?> get props => [
        message,
        status,
        empInfo,
        token,
      ];
}

class EmpInfoAttributesItems extends Equatable {
  final String? empId;
  final String? empEmpRefId;
  final String? empName;
  final String? empEmail;
  final String? empPassword;
  final String? empRole;
  final String? empPosition;
  final String? empStatus;
  final dynamic empToken;
  final dynamic empTokenAddTime;
  final String? empIsdeleted;

  const EmpInfoAttributesItems({
    this.empId,
    this.empEmpRefId,
    this.empName,
    this.empEmail,
    this.empPassword,
    this.empRole,
    this.empPosition,
    this.empStatus,
    this.empToken,
    this.empTokenAddTime,
    this.empIsdeleted,
  });

  @override
  List<Object?> get props => [
        empId,
        empEmpRefId,
        empName,
        empEmail,
        empPassword,
        empRole,
        empPosition,
        empStatus,
        empToken,
        empTokenAddTime,
        empIsdeleted,
      ];
}
