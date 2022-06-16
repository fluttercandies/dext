import 'dart:math';

import 'package:dext/dext.dart';

extension StringDext on String {
  /// Converts string to an integer.
  ///
  /// If [radix] is not specified, the radix is 10.
  ///
  /// Such as:
  ///
  /// - '123'.toInt() => 123
  /// - 'FF'.toInt(radix: 16) => 255
  /// - '1011'.toInt(radix: 2) => 11
  ///
  int toInt({
    int radix = 10,
  }) {
    return int.parse(this, radix: radix);
  }

  /// Converts string to a int.
  ///
  /// Support double and int.
  ///
  /// The [roundType] is used to round the double.
  ///
  /// Such as:
  ///
  /// - '123.45'.roundToInt() => 123
  /// - '123.5'.roundToInt(roundType: NumberRoundType.floor) => 123
  /// - '123.5'.roundToInt(roundType: NumberRoundType.ceil) => 124
  /// - '123.5'.roundToInt(roundType: NumberRoundType.round) => 124
  ///
  /// - '123.45'.roundToInt(roundType: NumberRoundType.round) => 123
  /// - '123.45'.roundToInt(roundType: NumberRoundType.floor) => 123
  /// - '123.45'.roundToInt(roundType: NumberRoundType.ceil) => 124
  int roundToInt({
    NumberRoundType roundType = NumberRoundType.round,
  }) {
    final n = double.parse(this);
    switch (roundType) {
      case NumberRoundType.round:
        return n.round();
      case NumberRoundType.floor:
        return n.floor();
      case NumberRoundType.ceil:
        return n.ceil();
      default:
        throw Exception('Unknown round type: $roundType');
    }
  }

  /// Converts string to a double.
  ///
  /// The [decimalDigits] and [roundType] is used to round the double.
  ///
  /// The [decimalDigits] default is null, which means no decimal digits.
  /// The [roundType] default is NumberRoundType.round.
  ///
  /// Such as:
  /// - default
  ///   - '123.45'.toDouble() => 123.45
  ///
  /// - just use decimalDigits
  ///   - '123.456'.toDouble(decimalDigits: 0) => 123.0
  ///   - '123.456'.toDouble(decimalDigits: 1) => 123.5
  ///   - '123.456'.toDouble(decimalDigits: 2) => 123.46
  ///
  /// - use decimalDigits and [NumberRoundType.round]
  ///   - '123.456'.toDouble(decimalDigits: 0, roundType: NumberRoundType.round) => 123.0
  ///   - '123.456'.toDouble(decimalDigits: 1, roundType: NumberRoundType.round) => 123.5
  ///   - '123.456'.toDouble(decimalDigits: 2, roundType: NumberRoundType.round) => 123.46
  ///
  /// - use decimalDigits and [NumberRoundType.floor]
  ///   - '123.456'.toDouble(decimalDigits: 0, roundType: NumberRoundType.floor) => 123.0
  ///   - '123.456'.toDouble(decimalDigits: 1, roundType: NumberRoundType.floor) => 123.4
  ///   - '123.456'.toDouble(decimalDigits: 2, roundType: NumberRoundType.floor) => 123.46
  ///
  /// - use decimalDigits and [NumberRoundType.ceil]
  ///   - '123.456'.toDouble(decimalDigits: 0, roundType: NumberRoundType.ceil) => 123.0
  ///   - '123.456'.toDouble(decimalDigits: 1, roundType: NumberRoundType.ceil) => 123.5
  ///   - '123.456'.toDouble(decimalDigits: 2, roundType: NumberRoundType.ceil) => 123.46
  ///
  double toDouble({
    int? decimalDigits,
    NumberRoundType roundType = NumberRoundType.round,
  }) {
    if (decimalDigits == null) {
      return double.parse(this);
    }
    final x = double.parse(this);
    final y = x * pow(10, decimalDigits);
    switch (roundType) {
      case NumberRoundType.round:
        return y.round() / pow(10, decimalDigits);
      case NumberRoundType.floor:
        return y.floor() / pow(10, decimalDigits);
      case NumberRoundType.ceil:
        return y.ceil() / pow(10, decimalDigits);
      default:
        throw Exception('Unknown round type: $roundType');
    }
  }
}
