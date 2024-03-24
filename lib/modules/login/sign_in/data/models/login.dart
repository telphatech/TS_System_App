// To parse this JSON data, do
//
//     final empLogin = empLoginFromJson(jsonString);

import 'dart:convert';

Login empLoginFromJson(String str) => Login.fromJson(json.decode(str));

String empLoginToJson(Login data) => json.encode(data.toJson());

class Login {
  String? message;
  String? status;
  EmpInfo? empInfo;
  String? token;

  Login({
    this.message,
    this.status,
    this.empInfo,
    this.token,
  });

  factory Login.fromJson(Map<String, dynamic> json) => Login(
        message: json["message"],
        status: json["status"],
        empInfo: json["emp_info"] == null
            ? null
            : EmpInfo.fromJson(json["emp_info"]),
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "status": status,
        "emp_info": empInfo?.toJson(),
        "token": token,
      };
}

class EmpInfo {
  String? empId;
  String? empEmpRefId;
  String? empName;
  String? empEmail;
  String? empPassword;
  String? empRole;
  String? empPosition;
  String? empStatus;
  dynamic empToken;
  dynamic empTokenAddTime;
  String? empIsdeleted;

  EmpInfo({
    this.empId,
    this.empEmpRefId,
    this.empName,
    this.empEmail,
    this.empPassword,
    this.empRole,
    this.empPosition,
    this.empStatus,
    this.empToken,
    this.empTokenAddTime,
    this.empIsdeleted,
  });

  factory EmpInfo.fromJson(Map<String, dynamic> json) => EmpInfo(
        empId: json["emp_id"],
        empEmpRefId: json["emp_emp_ref_id"],
        empName: json["emp_name"],
        empEmail: json["emp_email"],
        empPassword: json["emp_password"],
        empRole: json["emp_role"],
        empPosition: json["emp_position"],
        empStatus: json["emp_status"],
        empToken: json["emp_token"],
        empTokenAddTime: json["emp_token_add_time"],
        empIsdeleted: json["emp_isdeleted"],
      );

  Map<String, dynamic> toJson() => {
        "emp_id": empId,
        "emp_emp_ref_id": empEmpRefId,
        "emp_name": empName,
        "emp_email": empEmail,
        "emp_password": empPassword,
        "emp_role": empRole,
        "emp_position": empPosition,
        "emp_status": empStatus,
        "emp_token": empToken,
        "emp_token_add_time": empTokenAddTime,
        "emp_isdeleted": empIsdeleted,
      };
}
