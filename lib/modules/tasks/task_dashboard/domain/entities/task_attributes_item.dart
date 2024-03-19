import 'package:equatable/equatable.dart';

class TaskAttributesItems extends Equatable {
  final String? tmshId;
  final String? tmshTitle;
  final String? tmshDescription;
  final String? tmshMembrId;
  final String? tmshGroupId;
  final String? tmshDate;
  final String? tmshStartTime;
  final String? tmshEndTime;
  final String? tmshtIsDeleted;

  const TaskAttributesItems({
    this.tmshId,
    this.tmshTitle,
    this.tmshDescription,
    this.tmshMembrId,
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
        tmshMembrId,
        tmshGroupId,
        tmshDate,
        tmshStartTime,
        tmshEndTime,
        tmshtIsDeleted
      ];
}
