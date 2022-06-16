import 'package:dext/dext.dart';

/// Iterable extensions.
extension IterableDext<T> on Iterable<T> {
  /// Mapping each element to a new one.
  Iterable<R> mapIndexed<R>(R Function(int index, T value) action) sync* {
    var i = 0;
    for (final item in this) {
      yield action(i, item);
      i++;
    }
  }

  /// For each element, do something.
  void forEachIndexed(void Function(int index, T value) action) {
    var i = 0;
    for (final item in this) {
      action(i, item);
      i++;
    }
  }

  /// For each element, do something.
  ///
  /// The method is a async version of [forEach].
  Future<void> forEachAsync(
    Future<void> Function(int index, T value) action,
  ) async {
    var i = 0;
    for (final item in this) {
      await action(i, item);
      i++;
    }
  }

  /// For each element, do something.
  ///
  /// The method is a async version of [forEachIndexed].
  Future<void> forEachIndexedAsync(
    Future<void> Function(int index, T value) action,
  ) async {
    var i = 0;
    for (final item in this) {
      await action(i, item);
      i++;
    }
  }

  /// Filtering elements.
  ///
  /// The method is a have index version of [where].
  Iterable<T> whereIndexed(bool Function(int index, T value) predicate) sync* {
    var i = 0;
    for (final item in this) {
      if (predicate(i, item)) {
        yield item;
      }
      i++;
    }
  }
}

/// String extensions.
extension IterableDext2<T> on Iterable<T?> {
  Iterable<T> whereNotNull() sync* {
    for (final item in this) {
      if (item != null) {
        yield item;
      }
    }
  }
}

/// `List<num>` extensions.
extension NumListExt<T extends num> on Iterable<T> {
  /// Returns the sum of all elements.
  double sum() {
    double total = 0;
    for (final n in this) {
      total += n;
    }

    return total;
  }

  /// Returns the sum int result of all elements.
  int intSum({
    NumberRoundType roundType = NumberRoundType.round,
  }) {
    double total = 0;
    for (final n in this) {
      total += n;
    }

    return total.roundToInt(roundType: roundType);
  }

  /// Returns the average of all elements.
  double average() {
    double total = 0;
    for (final n in this) {
      total += n;
    }

    return total / length;
  }
}
