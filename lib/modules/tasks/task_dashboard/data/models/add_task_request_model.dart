import 'dart:convert';

AddTaskRequestModel taskFromJson(String str) =>
    AddTaskRequestModel.fromJson(json.decode(str));

String taskToJson(AddTaskRequestModel data) => json.encode(data.toJson());

class AddTaskRequestModel {
  String? tmshTitle;
  String? tmshDescription;
  String? tmshMembrId;
  String? tmshGroupId;
  String? tmshStartTime;
  String? tmshEndTime;

  AddTaskRequestModel({
    this.tmshTitle,
    this.tmshDescription,
    this.tmshMembrId,
    this.tmshGroupId,
    this.tmshStartTime,
    this.tmshEndTime,
  });

  factory AddTaskRequestModel.fromJson(Map<String, dynamic> json) =>
      AddTaskRequestModel(
        tmshTitle: json["tmsh_title"],
        tmshDescription: json["tmsh_description"],
        tmshMembrId: json["tmsh_membr_id"],
        tmshGroupId: json["tmsh_group_id"],
        tmshStartTime: json["tmsh_start_time"],
        tmshEndTime: json["tmsh_end_time"],
      );

  Map<String, dynamic> toJson() => {
        "tmsh_title": tmshTitle,
        "tmsh_description": tmshDescription,
        "tmsh_membr_id": tmshMembrId,
        "tmsh_group_id": tmshGroupId,
        "tmsh_start_time": tmshStartTime,
        "tmsh_end_time": tmshEndTime,
      };
}
