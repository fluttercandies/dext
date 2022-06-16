extension DateTimeDext on DateTime {
  /// Converts [DateTime] to yyyy-MM-dd format.
  String simpleDate() {
    final y = year.toString().padLeft(4, '0');
    final m = month.toString().padLeft(2, '0');
    final d = day.toString().padLeft(2, '0');
    return '$y-$m-$d';
  }

  /// Converts [DateTime] to HH:mm:ss format.
  String simpleTime() {
    final h = hour.toString().padLeft(2, '0');
    final m = minute.toString().padLeft(2, '0');
    final s = second.toString().padLeft(2, '0');
    return '$h:$m:$s';
  }

  /// Converts [DateTime] to yyyy-MM-dd HH:mm:ss.
  String simpleDateTime() {
    return '${simpleDate()} ${simpleTime()}';
  }

  /// Converts [DateTime] to the zero time of the day.
  DateTime toZeroHour() {
    return DateTime(year, month, day);
  }

  /// Add time and return a new [DateTime].
  DateTime addTime({
    int day = 0,
    int hour = 0,
    int minute = 0,
    int second = 0,
    int millisecond = 0,
    int microsecond = 0,
  }) {
    final duration = Duration(
      days: day,
      hours: hour,
      minutes: minute,
      seconds: second,
      milliseconds: millisecond,
      microseconds: microsecond,
    );

    return add(duration);
  }

  /// Subtract time and return a new [DateTime].
  DateTime subtractTime({
    int day = 0,
    int hour = 0,
    int minute = 0,
    int second = 0,
    int millisecond = 0,
    int microsecond = 0,
  }) {
    final duration = Duration(
      days: day,
      hours: hour,
      minutes: minute,
      seconds: second,
      milliseconds: millisecond,
      microseconds: microsecond,
    );

    return subtract(duration);
  }
}
