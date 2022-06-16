import 'package:dext/dext.dart';
import 'package:test/test.dart';

void main() {
  group('String extension', () {
    test('toInt', () {
      expect('123'.toInt(), 123);
      expect('FF'.toInt(radix: 16), 255);
      expect('1011'.toInt(radix: 2), 11);
    });

    test('roundToInt', () {
      expect('123.45'.roundToInt(), 123);

      expect('123.5'.roundToInt(roundType: NumberRoundType.floor), 123);
      expect('123.5'.roundToInt(roundType: NumberRoundType.ceil), 124);
      expect('123.5'.roundToInt(roundType: NumberRoundType.round), 124);

      expect('123.45'.roundToInt(roundType: NumberRoundType.round), 123);
      expect('123.45'.roundToInt(roundType: NumberRoundType.floor), 123);
      expect('123.45'.roundToInt(roundType: NumberRoundType.ceil), 124);
    });

    group('toDouble', () {
      test('default', () {
        expect('123.45'.toDouble(), 123.45);
      });

      test('decimalDigits', () {
        expect('123.45'.toDouble(decimalDigits: 1), 123.5);
        expect('123.45'.toDouble(decimalDigits: 2), 123.45);
        expect('123.456'.toDouble(decimalDigits: 1), 123.5);
        expect('123.456'.toDouble(decimalDigits: 2), 123.46);
        expect('123.456'.toDouble(decimalDigits: 3), 123.456);
      });

      void expectDecimal(
        int decimalDigits,
        NumberRoundType roundType,
        String srcValue,
        num checkValue,
      ) {
        expect(
          srcValue.toDouble(
            decimalDigits: decimalDigits,
            roundType: roundType,
          ),
          checkValue,
        );
      }

      group('roundType', () {
        test('Decimal:1', () {
          expectDecimal(1, NumberRoundType.round, '123.45', 123.5);
          expectDecimal(1, NumberRoundType.floor, '123.45', 123.4);
          expectDecimal(1, NumberRoundType.ceil, '123.45', 123.5);
        });

        test('Decimal:2', () {
          expectDecimal(2, NumberRoundType.round, '123.456', 123.46);
          expectDecimal(2, NumberRoundType.floor, '123.456', 123.45);
          expectDecimal(2, NumberRoundType.ceil, '123.456', 123.46);
        });

        test('Decimal:2, negative', () {
          expectDecimal(2, NumberRoundType.round, '-123.4567', -123.46);
          expectDecimal(2, NumberRoundType.floor, '-123.4567', -123.46);
          expectDecimal(2, NumberRoundType.ceil, '-123.4567', -123.45);
        });
      });
    });
  });
}
