// To parse this JSON data, do
//
//     final viewAttendanceResponseModel = viewAttendanceResponseModelFromJson(jsonString);

import 'dart:convert';

List<ViewAttendanceResponseModel> viewAttendanceResponseModelFromJson(
        String str) =>
    List<ViewAttendanceResponseModel>.from(
        json.decode(str).map((x) => ViewAttendanceResponseModel.fromJson(x)));

String viewAttendanceResponseModelToJson(
        List<ViewAttendanceResponseModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ViewAttendanceResponseModel {
  final String? attId;
  final String? attMemberId;
  final DateTime? attDate;
  final DateTime? attCheckIn;
  final DateTime? attCheckOut;
  final String? attIsApproved;
  final String? attIsDeleted;
  final String? empName;

  ViewAttendanceResponseModel({
    this.attId,
    this.attMemberId,
    this.attDate,
    this.attCheckIn,
    this.attCheckOut,
    this.attIsApproved,
    this.attIsDeleted,
    this.empName,
  });

  factory ViewAttendanceResponseModel.fromJson(Map<String, dynamic> json) =>
      ViewAttendanceResponseModel(
        attId: json["att_id"],
        attMemberId: json["att_member_id"],
        attDate:
            json["att_date"] == null ? null : DateTime.parse(json["att_date"]),
        attCheckIn: json["att_check_in"] == null
            ? null
            : DateTime.parse(json["att_check_in"]),
        attCheckOut: json["att_check_out"] == null
            ? null
            : DateTime.parse(json["att_check_out"]),
        attIsApproved: json["att_is_approved"],
        attIsDeleted: json["att_is_deleted"],
        empName: json["emp_name"],
      );

  Map<String, dynamic> toJson() => {
        "att_id": attId,
        "att_member_id": attMemberId,
        "att_date":
            "${attDate!.year.toString().padLeft(4, '0')}-${attDate!.month.toString().padLeft(2, '0')}-${attDate!.day.toString().padLeft(2, '0')}",
        "att_check_in": attCheckIn?.toIso8601String(),
        "att_check_out": attCheckOut?.toIso8601String(),
        "att_is_approved": attIsApproved,
        "att_is_deleted": attIsDeleted,
        "emp_name": empName,
      };
}
