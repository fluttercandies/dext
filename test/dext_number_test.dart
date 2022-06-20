import 'package:dext/dext.dart';
import 'package:test/test.dart';

void main() {
  group('Number extestion test', () {
    test('roundToInt', () {
      expect(1.5.roundToInt(), 2);
      expect(1.4.roundToInt(), 1);
      expect(1.4.roundToInt(roundType: NumberRoundType.floor), 1);
      expect(1.4.roundToInt(roundType: NumberRoundType.ceil), 2);
      expect(1.4.roundToInt(roundType: NumberRoundType.round), 1);
    });

    test('toDateTime', () {
      final timestampSeconds = 1655705253; // 2022-06-20 14:07:33
      final timestampMilliseconds = 1655705253166; // 2022-06-20 14:07:33.166
      final timestampDouble = 1655705253.166; // 2022-06-20 14:07:33.166
      final timestampMillisencondsDouble =
          1655705253166.333; // 2022-06-20 14:07:33.166

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

      expect(
        1655705253166.5556.toDateTime(),
        DateTime(2022, 6, 20, 14, 7, 33, 166, 556),
      );

      expect(
        1655705253166.5556.toDateTime(roundType: NumberRoundType.floor),
        DateTime(2022, 6, 20, 14, 7, 33, 166, 555),
      );
    });
  });
}
