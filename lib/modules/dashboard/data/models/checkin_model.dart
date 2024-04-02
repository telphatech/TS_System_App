import 'dart:convert';

CheckInModel checkInModelFromJson(String str) =>
    CheckInModel.fromJson(json.decode(str));

String checkInModelToJson(CheckInModel data) => json.encode(data.toJson());

class CheckInModel {
  String? attMemberId;
  DateTime? attDate;

  CheckInModel({
    this.attMemberId,
    this.attDate,
  });

  factory CheckInModel.fromJson(Map<String, dynamic> json) => CheckInModel(
        attMemberId: json["att_member_id"],
        attDate:
            json["att_date"] == null ? null : DateTime.parse(json["att_date"]),
      );

  Map<String, dynamic> toJson() => {
        "att_member_id": attMemberId,
        "att_date":
            "${attDate!.year.toString().padLeft(4, '0')}-${attDate!.month.toString().padLeft(2, '0')}-${attDate!.day.toString().padLeft(2, '0')}",
      };
}
