import 'package:equatable/equatable.dart';

class ViewLeaveAttributesItems extends Equatable {
  final String? leaveId;
  final String? leaveEmpId;
  final String? leaveType;
  final DateTime? leaveTo;
  final DateTime? leaveFrom;
  final DateTime? leaveAddedDate;
  final String? leaveReason;
  final String? leaveStatus;
  final String? leaveIsDeleted;
  final String? empName;

  const ViewLeaveAttributesItems({
    this.leaveId,
    this.leaveEmpId,
    this.leaveType,
    this.leaveTo,
    this.leaveFrom,
    this.leaveAddedDate,
    this.leaveReason,
    this.leaveStatus,
    this.leaveIsDeleted,
    this.empName,
  });

  @override
  List<Object?> get props => [
        leaveId,
        leaveEmpId,
        leaveType,
        leaveTo,
        leaveFrom,
        leaveAddedDate,
        leaveReason,
        leaveStatus,
        leaveIsDeleted,
        empName,
      ];
}
