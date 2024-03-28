import 'dart:convert';

EmployeeRegisterRequestModel employeeRegisterRequestModelFromJson(String str) =>
    EmployeeRegisterRequestModel.fromJson(json.decode(str));

String employeeRegisterRequestModelToJson(EmployeeRegisterRequestModel data) =>
    json.encode(data.toJson());

class EmployeeRegisterRequestModel {
  String? empId;
  String? empPassword;

  EmployeeRegisterRequestModel({
    this.empId,
    this.empPassword,
  });

  factory EmployeeRegisterRequestModel.fromJson(Map<String, dynamic> json) =>
      EmployeeRegisterRequestModel(
        empId: json["emp_id"],
        empPassword: json["emp_password"],
      );

  Map<String, dynamic> toJson() => {
        "emp_id": empId,
        "emp_password": empPassword,
      };
}
