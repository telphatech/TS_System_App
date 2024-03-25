import 'dart:convert';

List<Task> taskFromJson(String str) =>
    List<Task>.from(json.decode(str).map((x) => Task.fromJson(x)));

String taskToJson(List<Task> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Task {
  String? tmshId;
  String? tmshTitle;
  String? tmshDescription;
  String? tmshMemberId;
  String? tmshGroupId;
  DateTime? tmshDate;
  DateTime? tmshStartTime;
  DateTime? tmshEndTime;
  String? tmshtIsDeleted;

  Task({
    this.tmshId,
    this.tmshTitle,
    this.tmshDescription,
    this.tmshMemberId,
    this.tmshGroupId,
    this.tmshDate,
    this.tmshStartTime,
    this.tmshEndTime,
    this.tmshtIsDeleted,
  });

  factory Task.fromJson(Map<String, dynamic> json) => Task(
        tmshId: json["tmsh_id"],
        tmshTitle: json["tmsh_title"],
        tmshDescription: json["tmsh_description"],
        tmshMemberId: json["tmsh_member_id"],
        tmshGroupId: json["tmsh_group_id"],
        tmshDate: json["tmsh_date"] == null
            ? null
            : DateTime.parse(json["tmsh_date"]),
        tmshStartTime: json["tmsh_start_time"] == null
            ? null
            : DateTime.parse(json["tmsh_start_time"]),
        tmshEndTime: json["tmsh_end_time"] == null
            ? null
            : DateTime.parse(json["tmsh_end_time"]),
        tmshtIsDeleted: json["tmsht_is_deleted"],
      );

  Map<String, dynamic> toJson() => {
        "tmsh_id": tmshId,
        "tmsh_title": tmshTitle,
        "tmsh_description": tmshDescription,
        "tmsh_member_id": tmshMemberId,
        "tmsh_group_id": tmshGroupId,
        "tmsh_date": tmshDate?.toIso8601String(),
        "tmsh_start_time": tmshStartTime?.toIso8601String(),
        "tmsh_end_time": tmshEndTime?.toIso8601String(),
        "tmsht_is_deleted": tmshtIsDeleted,
      };
}
