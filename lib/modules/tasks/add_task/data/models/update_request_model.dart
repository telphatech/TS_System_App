// To parse this JSON data, do
//
//     final updateTaskModel = updateTaskModelFromJson(jsonString);

import 'dart:convert';

UpdateTaskModel updateTaskModelFromJson(String str) =>
    UpdateTaskModel.fromJson(json.decode(str));

String updateTaskModelToJson(UpdateTaskModel data) =>
    json.encode(data.toJson());

class UpdateTaskModel {
  String? tmshId;
  String? tmshTitle;
  String? tmshDescription;

  UpdateTaskModel({
    this.tmshId,
    this.tmshTitle,
    this.tmshDescription,
  });

  factory UpdateTaskModel.fromJson(Map<String, dynamic> json) =>
      UpdateTaskModel(
        tmshId: json["tmsh_id"],
        tmshTitle: json["tmsh_title"],
        tmshDescription: json["tmsh_description"],
      );

  Map<String, dynamic> toJson() => {
        "tmsh_id": tmshId,
        "tmsh_title": tmshTitle,
        "tmsh_description": tmshDescription,
      };
}
