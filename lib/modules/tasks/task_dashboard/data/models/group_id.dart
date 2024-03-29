import 'dart:convert';

GroupId groupIdFromJson(String str) => GroupId.fromJson(json.decode(str));

String groupIdToJson(GroupId data) => json.encode(data.toJson());

class GroupId {
  String? grpId;
  String? grpName;

  GroupId({
    this.grpId,
    this.grpName,
  });

  factory GroupId.fromJson(Map<String, dynamic> json) => GroupId(
        grpId: json["grp_id"],
        grpName: json["grp_name"],
      );

  Map<String, dynamic> toJson() => {
        "grp_id": grpId,
        "grp_name": grpName,
      };
}
