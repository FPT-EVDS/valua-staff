class TimeUtils {
  static bool isNight(DateTime date) {
    return (date.hour > 17 && date.hour < 24) ||
        (date.hour > 0 && date.hour < 5);
  }

  static bool isOverlap(DateTime startTime1, DateTime endTime1,
      DateTime startTime2, DateTime endTime2) {
    return startTime1.compareTo(endTime2) <= 0 &&
        startTime2.compareTo(endTime1) <= 0;
  }
}
