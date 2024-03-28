import 'package:equatable/equatable.dart';

class InvitationAttributesItems extends Equatable {
  final String? message;
  final EmpInfoCodeAttributesItems? empInfo;
  final String? status;

  const InvitationAttributesItems({
    this.message,
    this.status,
    this.empInfo,
  });

  @override
  List<Object?> get props => [
        message,
        status,
        empInfo,
      ];
}

class EmpInfoCodeAttributesItems extends Equatable {
  final String? empId;
  final String? empEmpRefId;
  final String? empName;
  final String? empEmail;
  final String? empMobile;
  final String? empPassword;
  final String? empRole;
  final String? empPosition;
  final String? empStatus;
  final String? empInvitationCode;

  const EmpInfoCodeAttributesItems({
    this.empId,
    this.empEmpRefId,
    this.empName,
    this.empEmail,
    this.empMobile,
    this.empPassword,
    this.empRole,
    this.empPosition,
    this.empStatus,
    this.empInvitationCode,
  });

  @override
  List<Object?> get props => [
        empId,
        empEmpRefId,
        empName,
        empEmail,
        empMobile,
        empPassword,
        empRole,
        empPosition,
        empStatus,
        empInvitationCode,
      ];
}
