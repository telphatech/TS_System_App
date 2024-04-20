// To parse this JSON data, do
//
//     final fetchLeaveDetailsModel = fetchLeaveDetailsModelFromJson(jsonString);

import 'dart:convert';

FetchLeaveDetailsModel fetchLeaveDetailsModelFromJson(String str) =>
    FetchLeaveDetailsModel.fromJson(json.decode(str));

String fetchLeaveDetailsModelToJson(FetchLeaveDetailsModel data) =>
    json.encode(data.toJson());

class FetchLeaveDetailsModel {
  final String? leaveId;
  final String? empId;
  final String? leaveType;
  final DateTime? leaveTo;
  final DateTime? leaveFrom;
  final String? leaveReason;
  final String? leaveStatus;

  FetchLeaveDetailsModel({
    this.leaveId,
    this.empId,
    this.leaveType,
    this.leaveTo,
    this.leaveFrom,
    this.leaveReason,
    this.leaveStatus,
  });

  factory FetchLeaveDetailsModel.fromJson(Map<String, dynamic> json) =>
      FetchLeaveDetailsModel(
        leaveId: json["leave_id"],
        empId: json["leave_emp_id"],
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
        "leave_id": leaveId,
        "leave_emp_id": empId,
        "leave_type": leaveType,
        "leave_to":
            "${leaveTo!.year.toString().padLeft(4, '0')}-${leaveTo!.month.toString().padLeft(2, '0')}-${leaveTo!.day.toString().padLeft(2, '0')}",
        "leave_from":
            "${leaveFrom!.year.toString().padLeft(4, '0')}-${leaveFrom!.month.toString().padLeft(2, '0')}-${leaveFrom!.day.toString().padLeft(2, '0')}",
        "leave_reason": leaveReason,
        "leave_status": leaveStatus,
      };
}
