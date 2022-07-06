import 'package:intl/intl.dart';

/// Extensions for [DateTime]
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

  /// Converts [DateTime] to [format] format.
  ///
  /// Just wrap [DateFormat] with this method.
  String format(String formatText) {
    return DateFormat(formatText).format(this);
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
    int days = 0,
    int hours = 0,
    int minutes = 0,
    int second = 0,
    int milliseconds = 0,
    int microseconds = 0,
  }) {
    final duration = Duration(
      days: days,
      hours: hours,
      minutes: minutes,
      seconds: second,
      milliseconds: milliseconds,
      microseconds: microseconds,
    );

    return subtract(duration);
  }

  /// Check if the [DateTime] is in the same day as the [other].
  bool isSameDay(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }

  /// Check if the [DateTime] is in the same week as the [other].
  bool isSameWeek(DateTime other) {
    final thisWeek = toZeroHour().subtractTime(days: weekday - 1);
    final otherWeek = other.toZeroHour().subtractTime(days: other.weekday - 1);
    return thisWeek.isSameDay(otherWeek);
  }

  /// Check if the [DateTime] is in the same month as the [other].
  bool isSameMonth(DateTime other) {
    return year == other.year && month == other.month;
  }

  /// Check if the [DateTime] is in the same year as the [other].
  bool isSameYear(DateTime other) {
    return year == other.year;
  }

  /// CopyWith the [DateTime] with the [year], [month], [day], [hour], [minute], [second], [millisecond], [microsecond].
  DateTime copyWith({
    int? year,
    int? month,
    int? day,
    int? hour,
    int? minute,
    int? second,
    int? millisecond,
    int? microsecond,
  }) {
    return DateTime(
      year ?? this.year,
      month ?? this.month,
      day ?? this.day,
      hour ?? this.hour,
      minute ?? this.minute,
      second ?? this.second,
      millisecond ?? this.millisecond,
      microsecond ?? this.microsecond,
    );
  }
}
