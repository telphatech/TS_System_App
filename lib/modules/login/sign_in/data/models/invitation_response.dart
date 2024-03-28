// To parse this JSON data, do
//
//     final invitationResponse = invitationResponseFromJson(jsonString);

import 'dart:convert';

InvitationResponse invitationResponseFromJson(String str) =>
    InvitationResponse.fromJson(json.decode(str));

String invitationResponseToJson(InvitationResponse data) =>
    json.encode(data.toJson());

class InvitationResponse {
  String? message;
  EmpInfo? empInfo;
  String? status;

  InvitationResponse({
    this.message,
    this.empInfo,
    this.status,
  });

  factory InvitationResponse.fromJson(Map<String, dynamic> json) =>
      InvitationResponse(
        message: json["message"],
        empInfo: json["emp_info"] == null
            ? null
            : EmpInfo.fromJson(json["emp_info"]),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "emp_info": empInfo?.toJson(),
        "status": status,
      };
}

class EmpInfo {
  String? empId;
  String? empEmpRefId;
  String? empName;
  String? empEmail;
  String? empMobile;
  String? empPassword;
  String? empRole;
  String? empPosition;
  String? empStatus;
  dynamic empToken;
  dynamic empTokenAddTime;
  String? empInvitationCode;
  DateTime? empInvitationAddedTime;
  dynamic empInvitationUseDate;
  String? empIsdeleted;

  EmpInfo({
    this.empId,
    this.empEmpRefId,
    this.empName,
    this.empEmail,
    this.empMobile,
    this.empPassword,
    this.empRole,
    this.empPosition,
    this.empStatus,
    this.empToken,
    this.empTokenAddTime,
    this.empInvitationCode,
    this.empInvitationAddedTime,
    this.empInvitationUseDate,
    this.empIsdeleted,
  });

  factory EmpInfo.fromJson(Map<String, dynamic> json) => EmpInfo(
        empId: json["emp_id"],
        empEmpRefId: json["emp_emp_ref_id"],
        empName: json["emp_name"],
        empEmail: json["emp_email"],
        empMobile: json["emp_mobile"],
        empPassword: json["emp_password"],
        empRole: json["emp_role"],
        empPosition: json["emp_position"],
        empStatus: json["emp_status"],
        empToken: json["emp_token"],
        empTokenAddTime: json["emp_token_add_time"],
        empInvitationCode: json["emp_invitation_code"],
        empInvitationAddedTime: json["emp_invitation_added_time"] == null
            ? null
            : DateTime.parse(json["emp_invitation_added_time"]),
        empInvitationUseDate: json["emp_invitation_use_date"],
        empIsdeleted: json["emp_isdeleted"],
      );

  Map<String, dynamic> toJson() => {
        "emp_id": empId,
        "emp_emp_ref_id": empEmpRefId,
        "emp_name": empName,
        "emp_email": empEmail,
        "emp_mobile": empMobile,
        "emp_password": empPassword,
        "emp_role": empRole,
        "emp_position": empPosition,
        "emp_status": empStatus,
        "emp_token": empToken,
        "emp_token_add_time": empTokenAddTime,
        "emp_invitation_code": empInvitationCode,
        "emp_invitation_added_time": empInvitationAddedTime?.toIso8601String(),
        "emp_invitation_use_date": empInvitationUseDate,
        "emp_isdeleted": empIsdeleted,
      };
}
