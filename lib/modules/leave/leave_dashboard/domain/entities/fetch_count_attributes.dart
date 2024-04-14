import 'package:equatable/equatable.dart';

class FetchCountAttributesItems extends Equatable {
  final String? leaveType;
  final num? available;
  final num? total;

  const FetchCountAttributesItems({
    this.leaveType,
    this.available,
    this.total,
  });

  @override
  List<Object?> get props => [
        leaveType,
        available,
        total,
      ];
}
