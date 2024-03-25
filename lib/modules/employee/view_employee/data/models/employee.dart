import 'dart:convert';

List<Employee> employeeFromJson(String str) =>
    List<Employee>.from(json.decode(str).map((x) => Employee.fromJson(x)));

String employeeToJson(List<Employee> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Employee {
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
  dynamic empInvitationCode;
  dynamic empInvitationAddedTime;
  dynamic empInvitationUseDate;
  String? empIsdeleted;

  Employee({
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
    this.empInvitationCode,
    this.empInvitationAddedTime,
    this.empInvitationUseDate,
    this.empIsdeleted,
  });

  factory Employee.fromJson(Map<String, dynamic> json) => Employee(
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
        empInvitationCode: json["emp_invitation_code"],
        empInvitationAddedTime: json["emp_invitation_added_time"],
        empInvitationUseDate: json["emp_invitation_use_date"],
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
        "emp_invitation_code": empInvitationCode,
        "emp_invitation_added_time": empInvitationAddedTime,
        "emp_invitation_use_date": empInvitationUseDate,
        "emp_isdeleted": empIsdeleted,
      };
}
