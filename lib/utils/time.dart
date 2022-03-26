class TimeUtils {
  static bool isNight(DateTime date) {
    return (date.hour > 17 && date.hour < 24) ||
        (date.hour > 0 && date.hour < 5);
  }
}
