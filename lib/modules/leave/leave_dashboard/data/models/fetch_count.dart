import 'dart:convert';

List<FetchCountModel> fetchCountModelFromJson(String str) =>
    List<FetchCountModel>.from(
        json.decode(str).map((x) => FetchCountModel.fromJson(x)));

String fetchCountModelToJson(List<FetchCountModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class FetchCountModel {
  String? leaveType;
  num? available;
  num? total;

  FetchCountModel({
    this.leaveType,
    this.available,
    this.total,
  });

  factory FetchCountModel.fromJson(Map<String, dynamic> json) =>
      FetchCountModel(
        leaveType: json["leave_type"],
        available: json["available"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "leave_type": leaveType,
        "available": available,
        "total": total,
      };
}
