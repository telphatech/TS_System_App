String calculateDuration(DateTime? startTime, DateTime? endTime) {
  if (startTime == null || endTime == null) {
    return "";
  }

  if (endTime.isBefore(startTime)) {
    endTime = endTime.add(const Duration(days: 1));
  }

  int startHour = startTime.hour;
  int startMinute = startTime.minute;
  int endHour = endTime.hour;
  int endMinute = endTime.minute;

  if (startTime.hour < 12 &&
      endTime.hour < 12 &&
      endTime.hour < startTime.hour) {
    endHour += 12;
  }

  int totalMinutes =
      (endHour * 60 + endMinute) - (startHour * 60 + startMinute);
  int hours = totalMinutes ~/ 60;
  int minutes = totalMinutes % 60;

  return "$hours Hrs $minutes mins";
}
