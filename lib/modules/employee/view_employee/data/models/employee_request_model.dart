// To parse this JSON data, do
//
//     final employeeRequestModel = employeeRequestModelFromJson(jsonString);

import 'dart:convert';

EmployeeRequestModel employeeRequestModelFromJson(String str) =>
    EmployeeRequestModel.fromJson(json.decode(str));

String employeeRequestModelToJson(EmployeeRequestModel data) =>
    json.encode(data.toJson());

class EmployeeRequestModel {
  String? empEmpRefId;
  String? empName;
  String? empEmail;
  String? empMobile;
  String? empRole;
  String? empPosition;
  String? empStatus;

  EmployeeRequestModel({
    this.empEmpRefId,
    this.empName,
    this.empEmail,
    this.empMobile,
    this.empRole,
    this.empPosition,
    this.empStatus,
  });

  factory EmployeeRequestModel.fromJson(Map<String, dynamic> json) =>
      EmployeeRequestModel(
        empEmpRefId: json["emp_emp_ref_id"],
        empName: json["emp_name"],
        empEmail: json["emp_email"],
        empMobile: json["emp_mobile"],
        empRole: json["emp_role"],
        empPosition: json["emp_position"],
        empStatus: json["emp_status"],
      );

  Map<String, dynamic> toJson() => {
        "emp_emp_ref_id": empEmpRefId,
        "emp_name": empName,
        "emp_email": empEmail,
        "emp_mobile": empMobile,
        "emp_role": empRole,
        "emp_position": empPosition,
        "emp_status": empStatus,
      };
}
