String calculateDuration(DateTime? startTime, DateTime? endTime) {
  if (startTime == null || endTime == null) {
    return "";
  }

  // If endTime is before startTime, it's likely the times span across different days
  // Adjust the endTime to the next day
  if (endTime.isBefore(startTime)) {
    endTime = endTime.add(const Duration(days: 1));
  }

  // Extract hours and minutes from the start and end times
  int startHour = startTime.hour;
  int startMinute = startTime.minute;
  int endHour = endTime.hour;
  int endMinute = endTime.minute;

  // Convert 12-hour clock to 24-hour clock
  if (startTime.hour < 12 &&
      endTime.hour < 12 &&
      endTime.hour < startTime.hour) {
    endHour +=
        12; // Add 12 hours to endTime if it's in the morning and before startTime
  }

  // Calculate the duration
  int totalMinutes =
      (endHour * 60 + endMinute) - (startHour * 60 + startMinute);
  int hours = totalMinutes ~/ 60;
  int minutes = totalMinutes % 60;

  return "$hours Hrs $minutes mins";
}
