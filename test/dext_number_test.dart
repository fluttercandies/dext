import 'package:dext/dext.dart';
import 'package:test/test.dart';

void main() {
  final timestampSeconds = 1655705253; // 2022-06-20 14:07:33
  final timestampMilliseconds = 1655705253166; // 2022-06-20 14:07:33.166
  final timestampDouble = 1655705253.166; // 2022-06-20 14:07:33.166
  final timestampMillisencondsDouble =
      1655705253166.333; // 2022-06-20 14:07:33.166

  group('Number extestion test', () {
    test('toDateTime', () {
      expect(
        timestampSeconds.toDateTime(timestampUnit: TimestampUnit.seconds),
        DateTime(2022, 6, 20, 14, 7, 33),
      );

      expect(
        timestampMilliseconds.toDateTime(),
        DateTime(2022, 6, 20, 14, 7, 33, 166),
      );

      expect(
        timestampDouble.toDateTime(timestampUnit: TimestampUnit.seconds),
        DateTime(2022, 6, 20, 14, 7, 33, 166),
      );

      expect(
        timestampMillisencondsDouble.toDateTime(),
        DateTime(2022, 6, 20, 14, 7, 33, 166, 333),
      );
    });
  });
}
