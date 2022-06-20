import 'dart:math';

import 'package:dext/dext.dart';

/// Extension for String
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

  /// Converts string to [DateTime].
  ///
  /// Just wrap the [DateTime.parse] method.
  DateTime toDateTime() {
    return DateTime.parse(this);
  }

  /// Converts string to [Uri].
  Uri toUri() {
    return Uri.parse(this);
  }

  /// Converts string to other naming convention.
  ///
  /// Such as:
  /// - `'hello world'.toNaming(type: NamingType.lowerCamel) => helloWorld`
  /// - `'hello world'.toNaming(type: NamingType.upperCamel) => HelloWorld`
  /// - `'hello world'.toNaming(type: NamingType.pascal) => HelloWorld`
  /// - `'hello world'.toNaming(type: NamingType.lower) => hello_world`
  /// - `'hello world'.toNaming(type: NamingType.lowerSnake) => hello_world`
  /// - `'hello world'.toNaming(type: NamingType.upperSnake) => Hello_World`
  /// - `'hello world'.toNaming(type: NamingType.kebab) => hello-world`
  /// - `'hello world'.toNaming(type: NamingType.upper) => HELLO_WORLD`
  String toNaming({required NamingType type}) {
    final reg = RegExp(r'\s+');
    final str = replaceAll(reg, ' ');
    final list = str.split(' ');

    switch (type) {
      case NamingType.lowerCamel:
        return list.mapIndexed<String>((index, value) {
          if (index == 0) {
            return value.firstLower();
          }
          return value.firstUpper();
        }).join();
      case NamingType.upperCamel:
      case NamingType.pascal:
        return list.map<String>((value) => value.firstUpper()).join();
      case NamingType.lower:
      case NamingType.lowerSnake:
        return list.map<String>((value) => value.firstLower()).join('_');
      case NamingType.upperSnake:
        return list.map<String>((value) => value.firstUpper()).join('_');
      case NamingType.kebab:
        return list.map<String>((value) => value.firstLower()).join('-');
      case NamingType.upper:
        return list.map<String>((value) => value.toUpperCase()).join('_');
    }
  }

  /// Converts the first character of string to upper case.
  String firstUpper() {
    return this[0].toUpperCase() + substring(1);
  }

  /// Converts the first character of string to lower case.
  String firstLower() {
    return this[0].toLowerCase() + substring(1);
  }
}
