import 'package:equatable/equatable.dart';

class FetchLeavesAttributesItems extends Equatable {
  final String? leaveId;
  final String? leaveEmpId;
  final String? leaveType;
  final DateTime? leaveTo;
  final DateTime? leaveFrom;
  final String? leaveReason;
  final String? leaveStatus;

  const FetchLeavesAttributesItems({
    this.leaveId,
    this.leaveEmpId,
    this.leaveType,
    this.leaveTo,
    this.leaveFrom,
    this.leaveReason,
    this.leaveStatus,
  });

  @override
  List<Object?> get props => [
        leaveId,
        leaveEmpId,
        leaveType,
        leaveTo,
        leaveFrom,
        leaveReason,
        leaveStatus,
      ];
}
