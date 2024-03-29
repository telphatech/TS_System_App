import 'package:equatable/equatable.dart';

class GroupIdAttributesItems extends Equatable {
  final String? grpId;
  final String? grpName;

  const GroupIdAttributesItems({
    this.grpId,
    this.grpName,
  });

  @override
  List<Object?> get props => [
        grpId,
        grpName,
      ];
}
