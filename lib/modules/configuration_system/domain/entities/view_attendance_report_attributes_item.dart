import 'package:equatable/equatable.dart';

class ViewAttendanceReportAttributesItems extends Equatable {
  final String? attId;
  final String? attMemberId;
  final DateTime? attDate;
  final DateTime? attCheckIn;
  final DateTime? attCheckOut;
  final String? attIsApproved;
  final String? attIsDeleted;
  final String? empName;

  const ViewAttendanceReportAttributesItems({
    this.attId,
    this.attMemberId,
    this.attDate,
    this.attCheckIn,
    this.attCheckOut,
    this.attIsApproved,
    this.attIsDeleted,
    this.empName,
  });

  @override
  List<Object?> get props => [
        attId,
        attMemberId,
        attDate,
        attCheckIn,
        attCheckOut,
        attIsApproved,
        attIsDeleted,
        empName,
      ];
}
