String calculateDuration(DateTime? startTime, DateTime? endTime) {
  if (startTime == null || endTime == null) {
    return "";
  }

  Duration difference = endTime.difference(startTime);

  int hours = difference.inHours;
  int minutes = difference.inMinutes.remainder(60);

  return "$hours Hrs $minutes mins";
}
