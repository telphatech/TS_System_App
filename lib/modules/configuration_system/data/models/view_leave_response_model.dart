// To parse this JSON data, do
//
//     final viewLeaveResponseModel = viewLeaveResponseModelFromJson(jsonString);

import 'dart:convert';

List<ViewLeaveResponseModel> viewLeaveResponseModelFromJson(String str) =>
    List<ViewLeaveResponseModel>.from(
        json.decode(str).map((x) => ViewLeaveResponseModel.fromJson(x)));

String viewLeaveResponseModelToJson(List<ViewLeaveResponseModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ViewLeaveResponseModel {
  final String? leaveId;
  final String? leaveEmpId;
  final String? leaveType;
  final DateTime? leaveTo;
  final DateTime? leaveFrom;
  final DateTime? leaveAddedDate;
  final String? leaveReason;
  final String? leaveStatus;
  final String? leaveIsDeleted;
  final String? empName;

  ViewLeaveResponseModel({
    this.leaveId,
    this.leaveEmpId,
    this.leaveType,
    this.leaveTo,
    this.leaveFrom,
    this.leaveAddedDate,
    this.leaveReason,
    this.leaveStatus,
    this.leaveIsDeleted,
    this.empName,
  });

  factory ViewLeaveResponseModel.fromJson(Map<String, dynamic> json) =>
      ViewLeaveResponseModel(
        leaveId: json["leave_id"],
        leaveEmpId: json["leave_emp_id"],
        leaveType: json["leave_type"],
        leaveTo:
            json["leave_to"] == null ? null : DateTime.parse(json["leave_to"]),
        leaveFrom: json["leave_from"] == null
            ? null
            : DateTime.parse(json["leave_from"]),
        leaveAddedDate: json["leave_added_date"] == null
            ? null
            : DateTime.parse(json["leave_added_date"]),
        leaveReason: json["leave_reason"],
        leaveStatus: json["leave_status"],
        leaveIsDeleted: json["leave_is_deleted"],
        empName: json["emp_name"],
      );

  Map<String, dynamic> toJson() => {
        "leave_id": leaveId,
        "leave_emp_id": leaveEmpId,
        "leave_type": leaveType,
        "leave_to":
            "${leaveTo!.year.toString().padLeft(4, '0')}-${leaveTo!.month.toString().padLeft(2, '0')}-${leaveTo!.day.toString().padLeft(2, '0')}",
        "leave_from":
            "${leaveFrom!.year.toString().padLeft(4, '0')}-${leaveFrom!.month.toString().padLeft(2, '0')}-${leaveFrom!.day.toString().padLeft(2, '0')}",
        "leave_added_date": leaveAddedDate?.toIso8601String(),
        "leave_reason": leaveReason,
        "leave_status": leaveStatus,
        "leave_is_deleted": leaveIsDeleted,
        "emp_name": empName,
      };
}
