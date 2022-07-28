import 'dart:convert';

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

    test('toNaming', () {
      final src = 'hello world';
      expect(src.toNaming(), 'helloWorld');
      expect(src.toNaming(type: NamingType.lowerCamel), 'helloWorld');
      expect(src.toNaming(type: NamingType.upperCamel), 'HelloWorld');
      expect(src.toNaming(type: NamingType.lowerSnake), 'hello_world');
      expect(src.toNaming(type: NamingType.upperSnake), 'Hello_World');
      expect(src.toNaming(type: NamingType.pascal), 'HelloWorld');
      expect(src.toNaming(type: NamingType.kebab), 'hello-world');
      expect(src.toNaming(type: NamingType.lower), 'hello_world');
      expect(src.toNaming(type: NamingType.upper), 'HELLO_WORLD');
    });

    test('trimText', () {
      expect(' 123456 '.trimText(), '123456');
      expect(' 123456 '.trimText(left: true, right: false), '123456 ');
      expect(' 123456 '.trimText(left: false, right: true), ' 123456');

      expect('123454321'.trimText(s: '123'), '454321');
      expect('123454321'.trimText(s: '123', left: false), '123454321');
      expect('123454321'.trimText(s: '123', right: false), '454321');

      expect('12345123'.trimText(s: '123'), '45');
      expect('12345123'.trimText(s: '123', left: true, right: false), '45123');
      expect('12345123'.trimText(s: '123', left: false, right: true), '12345');
    });

    test('remove prefix', () {
      final src = '123456';
      expect(src.removePrefix('123'), '456');
    });

    test('remove suffix', () {
      final src = '123456';
      expect(src.removeSuffix('456'), '123');
    });

    test('encode', () {
      expect('123'.encode(ascii), [49, 50, 51]);
      expect('123'.encode(utf8), [49, 50, 51]);

      expect('你'.encode(utf8), [228, 189, 160]);
    });

    test('To url encoded string', () {
      expect('123'.toUrlEncoded(), '123');
      expect('你'.toUrlEncoded(), '%E4%BD%A0');
    });
  });
}
