import 'package:dext/dext.dart';

extension IterableDext<T> on Iterable<T> {
  Iterable<R> mapIndexed<R>(R Function(int index, T value) action) sync* {
    var i = 0;
    for (final item in this) {
      yield action(i, item);
      i++;
    }
  }
}

extension DoubleListExt on List<num> {
  double sum() {
    double total = 0;
    for (final n in this) {
      total += n;
    }

    return total;
  }

  int intSum({
    NumberRoundType roundType = NumberRoundType.round,
  }) {
    double total = 0;
    for (final n in this) {
      total += n;
    }

    return total.roundToInt(roundType: roundType);
  }
}
