import 'package:equatable/equatable.dart';

class GroupAttributesItems extends Equatable {
  final String? grpId;
  final String? grpName;

  const GroupAttributesItems({
    this.grpId,
    this.grpName,
  });

  @override
  List<Object?> get props => [
        grpId,
        grpName,
      ];
}
