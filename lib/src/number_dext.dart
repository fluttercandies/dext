import 'package:dext/dext.dart';

extension IntDext on int {
  /// Converts int unit timestamp to [DateTime].
  DateTime toDateTime() {
    final length = toString().length;
    var v = this;

    if (length == 10) {
      v = v * 1000;
    }
    return DateTime.fromMillisecondsSinceEpoch(this);
  }
}

extension NumberDext on num {
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
