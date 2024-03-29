import 'package:equatable/equatable.dart';

class GroupAttributesItems extends Equatable {
  final String? grpId;
  final String? grpName;
  final String? grpInfo;
  final String? grpLead;
  final String? grpMember;
  final String? grpBlockmember;
  final String? grpIsdeleted;

  const GroupAttributesItems({
    this.grpId,
    this.grpName,
    this.grpInfo,
    this.grpLead,
    this.grpMember,
    this.grpBlockmember,
    this.grpIsdeleted,
  });

  @override
  List<Object?> get props => [
        grpId,
        grpName,
        grpInfo,
        grpLead,
        grpMember,
        grpBlockmember,
        grpIsdeleted,
      ];
}
