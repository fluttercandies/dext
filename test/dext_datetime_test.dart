import 'package:dext/dext.dart';
import 'package:test/test.dart';

void main() {
  group('Datetime extension', () {
    DateTime dateTime = DateTime(2022, 1, 1, 12, 22, 33, 444, 555);

    test('simpleDate', () {
      expect(dateTime.simpleDate(), '2022-01-01');
    });

    test('simpleTime', () {
      expect(dateTime.simpleTime(), '12:22:33');
    });

    test('simpleDateTime', () {
      expect(dateTime.simpleDateTime(), '2022-01-01 12:22:33');
    });

    test('toZeroHour', () {
      expect(dateTime.toZeroHour(), DateTime(2022, 1, 1));
    });

    test('addTime', () {
      expect(
        dateTime.addTime(day: 1),
        DateTime(2022, 1, 2, 12, 22, 33, 444, 555),
      );
      expect(
        dateTime.addTime(hour: 1),
        DateTime(2022, 1, 1, 13, 22, 33, 444, 555),
      );
      expect(
        dateTime.addTime(minute: 1),
        DateTime(2022, 1, 1, 12, 23, 33, 444, 555),
      );
      expect(
        dateTime.addTime(second: 1),
        DateTime(2022, 1, 1, 12, 22, 34, 444, 555),
      );
      expect(
        dateTime.addTime(millisecond: 1),
        DateTime(2022, 1, 1, 12, 22, 33, 445, 555),
      );
      expect(
        dateTime.addTime(microsecond: 1),
        DateTime(2022, 1, 1, 12, 22, 33, 444, 556),
      );
    });

    test('subtractTime', () {
      expect(
        dateTime.subtractTime(days: 1),
        DateTime(2021, 12, 31, 12, 22, 33, 444, 555),
      );
      expect(
        dateTime.subtractTime(hours: 1),
        DateTime(2022, 1, 1, 11, 22, 33, 444, 555),
      );
      expect(
        dateTime.subtractTime(minutes: 1),
        DateTime(2022, 1, 1, 12, 21, 33, 444, 555),
      );
      expect(
        dateTime.subtractTime(second: 1),
        DateTime(2022, 1, 1, 12, 22, 32, 444, 555),
      );
      expect(
        dateTime.subtractTime(milliseconds: 1),
        DateTime(2022, 1, 1, 12, 22, 33, 443, 555),
      );
      expect(
        dateTime.subtractTime(microseconds: 1),
        DateTime(2022, 1, 1, 12, 22, 33, 444, 554),
      );
    });

    test('formatDate', () {
      expect(
        dateTime.format('yyyy-MM-dd'),
        '2022-01-01',
      );
      expect(
        dateTime.format('yyyy-MM-dd HH:mm:ss'),
        '2022-01-01 12:22:33',
      );
      expect(
        dateTime.format('yyyy-MM-dd HH:mm:ss.SSS'),
        '2022-01-01 12:22:33.444',
      );
    });

    test('isSameDay', () {
      final d1 = DateTime(2022, 1, 1, 12, 22, 33);
      final d2 = DateTime(2022, 1, 1, 1, 22, 33);

      expect(d1.isSameDay(d2), true);
    });

    test('isSameWeek', () {
      final d1 = DateTime(2022, 6, 6);
      final d2 = DateTime(2022, 6, 8);

      expect(d1.isSameWeek(d2), true);

      final d3 = DateTime(2022, 6, 11);
      final d4 = DateTime(2022, 6, 13);
      expect(d3.isSameWeek(d4), false);
    });

    test('isSameMonth', () {
      final d1 = DateTime(2022, 1, 1);
      final d2 = DateTime(2022, 1, 31);
      final d3 = DateTime(2022, 2, 1);

      expect(d1.isSameMonth(d2), true);
      expect(d1.isSameMonth(d3), false);
    });

    test('isSameYear', () {
      final d1 = DateTime(2022, 1, 1);
      final d2 = DateTime(2022, 12, 31);
      final d3 = DateTime(2021, 12, 31);

      expect(d1.isSameYear(d2), true);
      expect(d1.isSameYear(d3), false);
    });
  });
}
