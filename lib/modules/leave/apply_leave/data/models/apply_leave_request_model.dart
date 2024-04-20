// To parse this JSON data, do
//
//     final applyLeaveModel = applyLeaveModelFromJson(jsonString);

import 'dart:convert';

ApplyLeaveRequestModel applyLeaveRequestModelFromJson(String str) =>
    ApplyLeaveRequestModel.fromJson(json.decode(str));

String applyLeaveRequestModelToJson(ApplyLeaveRequestModel data) =>
    json.encode(data.toJson());

class ApplyLeaveRequestModel {
  String? leaveEmpId;
  String? leaveType;
  String? leaveTo;
  String? leaveFrom;
  String? leaveReason;

  ApplyLeaveRequestModel({
    this.leaveEmpId,
    this.leaveType,
    this.leaveTo,
    this.leaveFrom,
    this.leaveReason,
  });

  factory ApplyLeaveRequestModel.fromJson(Map<String, dynamic> json) =>
      ApplyLeaveRequestModel(
        leaveEmpId: json["leave_emp_id"],
        leaveType: json["leave_type"],
        leaveTo: json["leave_to"],
        leaveFrom: json["leave_from"],
        leaveReason: json["leave_reason"],
      );

  Map<String, dynamic> toJson() => {
        "leave_emp_id": leaveEmpId,
        "leave_type": leaveType,
        "leave_to": leaveTo,
        "leave_from": leaveFrom,
        "leave_reason": leaveReason,
      };
}
