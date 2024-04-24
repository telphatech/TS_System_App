// To parse this JSON data, do
//
//     final holidays = holidaysFromJson(jsonString);

import 'dart:convert';

List<Holidays> holidaysFromJson(String str) =>
    List<Holidays>.from(json.decode(str).map((x) => Holidays.fromJson(x)));

String holidaysToJson(List<Holidays> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Holidays {
  String? holidayId;
  String? holidayOccasion;
  DateTime? holidayDate;
  String? holidayIsdeleted;

  Holidays({
    this.holidayId,
    this.holidayOccasion,
    this.holidayDate,
    this.holidayIsdeleted,
  });

  factory Holidays.fromJson(Map<String, dynamic> json) => Holidays(
        holidayId: json["holiday_id"],
        holidayOccasion: json["holiday_occasion"],
        holidayDate: json["holiday_date"] == null
            ? null
            : DateTime.parse(json["holiday_date"]),
        holidayIsdeleted: json["holiday_isdeleted"],
      );

  Map<String, dynamic> toJson() => {
        "holiday_id": holidayId,
        "holiday_occasion": holidayOccasion,
        "holiday_date":
            "${holidayDate!.year.toString().padLeft(4, '0')}-${holidayDate!.month.toString().padLeft(2, '0')}-${holidayDate!.day.toString().padLeft(2, '0')}",
        "holiday_isdeleted": holidayIsdeleted,
      };
}
