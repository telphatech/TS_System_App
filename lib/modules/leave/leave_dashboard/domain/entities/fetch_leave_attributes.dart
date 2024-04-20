import 'package:equatable/equatable.dart';

class FetchLeaveAttributesItems extends Equatable {
  final String? leaveId;
  final String? empId;
  final String? leaveType;
  final DateTime? leaveTo;
  final DateTime? leaveFrom;
  final String? leaveReason;
  final String? leaveStatus;

  const FetchLeaveAttributesItems({
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
