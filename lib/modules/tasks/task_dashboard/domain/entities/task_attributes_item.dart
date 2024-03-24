import 'package:equatable/equatable.dart';

class TaskAttributesItems extends Equatable {
  final String? tmshId;
  final String? tmshTitle;
  final String? tmshDescription;
  final String? tmshMemberId;
  final String? tmshGroupId;
  final DateTime? tmshDate;
  final DateTime? tmshStartTime;
  final DateTime? tmshEndTime;
  final String? tmshtIsDeleted;

  const TaskAttributesItems({
    this.tmshId,
    this.tmshTitle,
    this.tmshDescription,
    this.tmshMemberId,
    this.tmshGroupId,
    this.tmshDate,
    this.tmshStartTime,
    this.tmshEndTime,
    this.tmshtIsDeleted,
  });

  @override
  List<Object?> get props => [
        tmshId,
        tmshTitle,
        tmshDescription,
        tmshMemberId,
        tmshGroupId,
        tmshDate,
        tmshStartTime,
        tmshEndTime,
        tmshtIsDeleted
      ];
}
