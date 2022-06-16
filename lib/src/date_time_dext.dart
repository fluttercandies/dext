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
}
