import 'package:equatable/equatable.dart';

class ViewEmployeeAttributesItems extends Equatable {
  final String? empEmpRefId;
  final String? empName;
  final String? empEmail;
  final String? empPassword;
  final String? empRole;
  final String? empPosition;
  final String? empStatus;

  const ViewEmployeeAttributesItems({
    this.empEmpRefId,
    this.empName,
    this.empEmail,
    this.empPassword,
    this.empRole,
    this.empPosition,
    this.empStatus,
  });

  @override
  List<Object?> get props => [
        empEmpRefId,
        empName,
        empEmail,
        empPassword,
        empRole,
        empPosition,
        empStatus,
      ];
}
