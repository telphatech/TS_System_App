// To parse this JSON data, do
//
//     final fetchLeaveModel = fetchLeaveModelFromJson(jsonString);

import 'dart:convert';

List<FetchLeaveModel> fetchLeaveModelFromJson(String str) =>
    List<FetchLeaveModel>.from(
        json.decode(str).map((x) => FetchLeaveModel.fromJson(x)));

String fetchLeaveModelToJson(List<FetchLeaveModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FetchLeaveModel {
  String? leaveType;
  DateTime? leaveTo;
  DateTime? leaveFrom;
  String? leaveReason;
  String? leaveStatus;

  FetchLeaveModel({
    this.leaveType,
    this.leaveTo,
    this.leaveFrom,
    this.leaveReason,
    this.leaveStatus,
  });

  factory FetchLeaveModel.fromJson(Map<String, dynamic> json) =>
      FetchLeaveModel(
        leaveType: json["leave_type"],
        leaveTo:
            json["leave_to"] == null ? null : DateTime.parse(json["leave_to"]),
        leaveFrom: json["leave_from"] == null
            ? null
            : DateTime.parse(json["leave_from"]),
        leaveReason: json["leave_reason"],
        leaveStatus: json["leave_status"],
      );

  Map<String, dynamic> toJson() => {
        "leave_type": leaveType,
        "leave_to":
            "${leaveTo!.year.toString().padLeft(4, '0')}-${leaveTo!.month.toString().padLeft(2, '0')}-${leaveTo!.day.toString().padLeft(2, '0')}",
        "leave_from":
            "${leaveFrom!.year.toString().padLeft(4, '0')}-${leaveFrom!.month.toString().padLeft(2, '0')}-${leaveFrom!.day.toString().padLeft(2, '0')}",
        "leave_reason": leaveReason,
        "leave_status": leaveStatus,
      };
}
