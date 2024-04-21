import 'package:equatable/equatable.dart';

class FetchLeaveByMemberIdAttributesItems extends Equatable {
  final String? leaveId;
  final String? empId;
  final String? leaveType;
  final DateTime? leaveTo;
  final DateTime? leaveFrom;
  final String? leaveReason;
  final String? leaveStatus;

  const FetchLeaveByMemberIdAttributesItems({
    this.leaveId,
    this.empId,
    this.leaveType,
    this.leaveTo,
    this.leaveFrom,
    this.leaveReason,
    this.leaveStatus,
  });

  @override
  List<Object?> get props => [
        leaveId,
        empId,
        leaveType,
        leaveTo,
        leaveFrom,
        leaveReason,
        leaveStatus,
      ];
}
