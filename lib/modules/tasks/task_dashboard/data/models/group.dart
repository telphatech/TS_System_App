// To parse this JSON data, do
//
//     final group = groupFromJson(jsonString);

import 'dart:convert';

Group groupFromJson(String str) => Group.fromJson(json.decode(str));

String groupToJson(Group data) => json.encode(data.toJson());

class Group {
  String? grpId;
  String? grpName;

  Group({
    this.grpId,
    this.grpName,
  });

  factory Group.fromJson(Map<String, dynamic> json) => Group(
        grpId: json["grp_id"],
        grpName: json["grp_name"],
      );

  Map<String, dynamic> toJson() => {
        "grp_id": grpId,
        "grp_name": grpName,
      };
}
