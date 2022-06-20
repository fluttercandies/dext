import 'package:dext/dext.dart';

/// Extension for [int].
extension IntDext on int {
  /// Converts int unix timestamp to [DateTime].
  ///
  /// Unix timestamps in other languages are sometimes seconds, such as C.
  /// So, we can use [timestampUnit] to specify the unit of the timestamp.
  ///
  /// Such as:
  /// - `1234567890.toDateTime(timestampUnit: TimestampUnit.seconds)` => `DateTime(2009, 2, 14, 7, 31, 30)`
  /// - `1234567890123.toDateTime()` => `DateTime(2009, 2, 14, 7, 31, 30, 0, 123)`
  DateTime toDateTime({
    TimestampUnit timestampUnit = TimestampUnit.milliseconds,
  }) {
    var v = this;

    if (timestampUnit == TimestampUnit.seconds) {
      v = v * 1000 * 1000;
    } else if (timestampUnit == TimestampUnit.milliseconds) {
      v = v * 1000;
    }

    return DateTime.fromMicrosecondsSinceEpoch(v);
  }
}

/// Extension for [double].
extension DoubleDext on double {
  /// Converts double to `DateTime`
  ///
  /// In some languages, the timestamp takes the integer part as
  /// the second and the decimal part as the millisecond or other.
  /// This method should be used.
  ///
  /// Such as:
  ///
  /// - `1234567890.123456.toDateTime(timestampUnit: TimestampUnit.seconds)` => `DateTime(2009, 2, 14, 7, 31, 30, 123, 456)`
  /// - `1234567890123.456.toDateTime()` => `DateTime(2009, 2, 14, 7, 31, 30, 123, 456)`
  DateTime toDateTime({
    TimestampUnit timestampUnit = TimestampUnit.milliseconds,
    NumberRoundType roundType = NumberRoundType.round,
  }) {
    var v = this;

    if (timestampUnit == TimestampUnit.seconds) {
      v = v * 1000 * 1000;
    } else if (timestampUnit == TimestampUnit.milliseconds) {
      v = v * 1000;
    }

    final time = v.roundToInt(roundType: roundType);

    return DateTime.fromMicrosecondsSinceEpoch(time);
  }
}

/// Extensions for [num].
extension NumberDext on num {
  /// Converts number to int.
  ///
  /// Just wrap the [round], [floor] and [ceil] methods.
  ///
  /// - [NumberRoundType.round] => [round]
  /// - [NumberRoundType.floor] => [floor]
  /// - [NumberRoundType.ceil] => [ceil]
  int roundToInt({NumberRoundType roundType = NumberRoundType.round}) {
    switch (roundType) {
      case NumberRoundType.round:
        return round();
      case NumberRoundType.floor:
        return floor();
      case NumberRoundType.ceil:
        return ceil();
      default:
        throw Exception('Unknown round type: $roundType');
    }
  }
}
