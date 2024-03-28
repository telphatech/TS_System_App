import 'dart:convert';

AddTaskRequestModel addTaskRequestModelFromJson(String str) =>
    AddTaskRequestModel.fromJson(json.decode(str));

String addTaskRequestModelToJson(AddTaskRequestModel data) =>
    json.encode(data.toJson());

class AddTaskRequestModel {
  String? tmshTitle;
  String? tmshDescription;
  String? tmshMemberId;
  String? tmshGroupId;
  DateTime? tmshStartTime;
  DateTime? tmshEndTime;

  AddTaskRequestModel({
    this.tmshTitle,
    this.tmshDescription,
    this.tmshMemberId,
    this.tmshGroupId,
    this.tmshStartTime,
    this.tmshEndTime,
  });

  factory AddTaskRequestModel.fromJson(Map<String, dynamic> json) =>
      AddTaskRequestModel(
        tmshTitle: json["tmsh_title"],
        tmshDescription: json["tmsh_description"],
        tmshMemberId: json["tmsh_member_id"],
        tmshGroupId: json["tmsh_group_id"],
        tmshStartTime: json["tmsh_start_time"] == null
            ? null
            : DateTime.parse(json["tmsh_start_time"]),
        tmshEndTime: json["tmsh_end_time"] == null
            ? null
            : DateTime.parse(json["tmsh_end_time"]),
      );

  Map<String, dynamic> toJson() => {
        "tmsh_title": tmshTitle,
        "tmsh_description": tmshDescription,
        "tmsh_member_id": tmshMemberId,
        "tmsh_group_id": tmshGroupId,
        "tmsh_start_time": tmshStartTime?.toIso8601String(),
        "tmsh_end_time": tmshEndTime?.toIso8601String(),
      };
}
