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

  /// Returns `true` if at least one element matches the given [predicate].
  bool any(bool Function(T element) predicate) {
    for (final element in this) {
      if (predicate(element)) {
        return true;
      }
    }
    return false;
  }

  /// Returns `true` if at least one element matches the given [predicate].
  /// [any] with index.
  bool anyIndexed(bool Function(int index, T element) predicate) {
    var i = 0;
    for (final element in this) {
      if (predicate(i, element)) {
        return true;
      }
      i++;
    }
    return false;
  }

  /// Returns `true` if all elements match the given [predicate].
  bool all(bool Function(T element) predicate) {
    for (final element in this) {
      if (!predicate(element)) {
        return false;
      }
    }
    return true;
  }

  /// Returns `true` if all elements match the given [predicate].
  /// [all] with index.
  bool allIndexed(bool Function(int index, T element) predicate) {
    var i = 0;
    for (final element in this) {
      if (!predicate(i, element)) {
        return false;
      }
      i++;
    }
    return true;
  }

  /// For each element, do something.
  ///
  /// The method is a async version of [forEach].
  Future<void> forEachAsync(
    Future<void> Function(T value) action,
  ) async {
    for (final item in this) {
      await action(item);
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

  /// Grouping the data.
  ///
  /// with the return value of the [keySelector] as the key
  /// and the combination of the values of the element as the value.
  ///
  /// Such as:
  ///
  /// - `[1, 2, 3, 4, 5, 6, 7, 8, 9, 10].groupBy((i) => i % 2);` // `{0: [2, 4, 6, 8, 10], 1: [1, 3, 5, 7, 9]}`
  ///
  Map<K, List<T>> groupBy<K>(K Function(T e) keySelector) {
    return fold({}, (Map<K, List<T>> map, T e) {
      final key = keySelector(e);
      map.putIfAbsent(key, () => []).add(e);
      return map;
    });
  }

  /// Mapping each element to a new Map element.
  ///
  /// Such as:
  ///
  /// ```dart
  /// [1, 2, 3].toMap((e) => MapEntry(e, (e) => e * 2)); // `{1: 2, 2: 4, 3: 6}`
  /// ```
  Map<K, V> toMap<K, V>(MapEntry<K, V> Function(T e) mapping) {
    return map<MapEntry<K, V>>(mapping).toMap();
  }
}

/// Extensions for nullable `Iterable<T?>`.
extension IterableDext2<T> on Iterable<T?> {
  /// Filtering for not null elements.
  Iterable<T> whereNotNull() sync* {
    for (final item in this) {
      if (item != null) {
        yield item;
      }
    }
  }
}

extension ListDext<T> on List<T> {
  /// Returns a sorted list by the given [comparator].
  List<T> sorted({
    Comparable Function(T t)? comparator,
    bool descending = false,
  }) {
    List<T> resultList;
    if (comparator == null) {
      resultList = toList()
        ..sort((a, b) {
          if (a == null) {
            return -1;
          }
          if (b == null) {
            return 1;
          }

          if (a is Comparable && b is Comparable) {
            return a.compareTo(b);
          }

          return 0;
        });
    } else {
      resultList = toList()
        ..sort((a, b) => comparator(a).compareTo(comparator(b)));
    }

    if (descending) {
      resultList = resultList.reversed.toList();
    }

    return resultList;
  }
}

/// `List<num>` extensions.
extension NumListExt<T extends num> on Iterable<T> {
  /// Returns the sum of all elements.
  ///
  /// The result is double.
  ///
  /// Such as:
  /// - `[1, 2, 3, 4, 5, 6, 7, 8, 9, 10].sum();` // 55.0
  /// - `[1.1, 2.2, 3.3].sum();` // 6.6
  double sum() {
    double total = 0;
    for (final n in this) {
      total += n;
    }

    return total;
  }

  /// Returns the sum int result of all elements.
  ///
  /// The result is int.
  ///
  /// [roundType] to see [NumberRoundType].
  ///
  /// This method is equivalent to `sum().roundToInt(roundType:roundType)`
  ///
  /// Such as:
  /// - `[1, 2, 3, 4, 5, 6, 7, 8, 9, 10].sumInt();` // 55
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
  ///
  /// The result is double.
  ///
  /// Such as:
  /// - `[1, 2, 3, 4, 5, 6, 7, 8, 9, 10].average();` // 5.5
  /// - `[1.1, 2.2, 3.3].average();` // 2.2
  double average() {
    double total = 0;
    for (final n in this) {
      total += n;
    }

    return total / length;
  }
}

/// Extensions for `Iterable<T>`
extension ListMapEntryDext<K, V> on Iterable<MapEntry<K, V>> {
  /// Returns a `Map` with the `MapEntry`.
  Map<K, V> toMap() {
    return Map.fromEntries(this);
  }
}
