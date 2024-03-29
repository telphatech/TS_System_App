// To parse this JSON data, do
//
//     final groupModel = groupModelFromJson(jsonString);

import 'dart:convert';

List<GroupModel> groupModelFromJson(String str) =>
    List<GroupModel>.from(json.decode(str).map((x) => GroupModel.fromJson(x)));

String groupModelToJson(List<GroupModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GroupModel {
  String? grpId;
  String? grpName;
  String? grpInfo;
  String? grpLead;
  String? grpMember;
  String? grpBlockmember;
  String? grpIsdeleted;

  GroupModel({
    this.grpId,
    this.grpName,
    this.grpInfo,
    this.grpLead,
    this.grpMember,
    this.grpBlockmember,
    this.grpIsdeleted,
  });

  factory GroupModel.fromJson(Map<String, dynamic> json) => GroupModel(
        grpId: json["grp_id"],
        grpName: json["grp_name"],
        grpInfo: json["grp_info"],
        grpLead: json["grp_lead"],
        grpMember: json["grp_member"],
        grpBlockmember: json["grp_blockmember"],
        grpIsdeleted: json["grp_isdeleted"],
      );

  Map<String, dynamic> toJson() => {
        "grp_id": grpId,
        "grp_name": grpName,
        "grp_info": grpInfo,
        "grp_lead": grpLead,
        "grp_member": grpMember,
        "grp_blockmember": grpBlockmember,
        "grp_isdeleted": grpIsdeleted,
      };
}
