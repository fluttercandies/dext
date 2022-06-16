import 'package:test/test.dart';
import 'package:dext/dext.dart';

void main() {
  group('iterable test', () {
    final list = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
    final list2 = [1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0];

    group('number list', () {
      test('sum', () {
        expect(list.sum(), 55);
      });

      test('intSum', () {
        expect(list2.intSum(), 55);
      });

      test('average', () {
        expect(list.average(), 5.5);
      });
    });

    group('fast action', () {
      test('mapIndexed', () {
        final result = list.mapIndexed((index, value) => value * 2 + index);
        expect(result, [2, 5, 8, 11, 14, 17, 20, 23, 26, 29]);
      });

      test('forEachIndexed', () {
        final result = [];
        list.forEachIndexed((index, value) => result.add(value * 2 + index));
        expect(result, [2, 5, 8, 11, 14, 17, 20, 23, 26, 29]);
      });

      Future<int> getAsyncValue(int value) {
        return Future.sync(() => value);
      }

      test('forEachAsync', () async {
        var total = 0;
        await list.forEachAsync((value) async {
          total += await getAsyncValue(value);
        });
        expect(total, 55);
      });

      test('forEachIndexedAsync', () async {
        var total = 0;
        await list.forEachIndexedAsync((index, value) async {
          total += await getAsyncValue(value * 2 + index);
        });
        expect(total, 155);
      });

      test('whereIndexed', () {
        final result = list.whereIndexed((index, value) => value % 2 == 0);
        expect(result, [2, 4, 6, 8, 10]);
      });

      test('whereNotNull', () {
        final src = [1, 2, null, 3, 5, 6.0];
        final result = src.whereNotNull();
        expect(result, [1, 2, 3, 5, 6.0]);
      });

      test('groupBy', () {
        final result = list.groupBy((i) => i % 2);
        expect(result, {
          0: [2, 4, 6, 8, 10],
          1: [1, 3, 5, 7, 9]
        });
      });
    });
  });
}
