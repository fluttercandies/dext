import 'dart:convert';
import 'dart:typed_data';

import 'package:dext/dext.dart';
import 'package:test/test.dart';

void main() {
  group('Test of List<int>', () {
    test('toUint8List', () {
      expect([1, 2, 3].toUint8List(), Uint8List.fromList([1, 2, 3]));
    });

    test('decode', () {
      expect([97, 97].decode(utf8), 'aa');
      expect(utf8.encode('你好').decode(utf8), '你好');
    });

    test('toBase64', () {
      expect([97, 97].toBase64(), 'YWE=');
      expect(utf8.encode('你好').toBase64(), '5L2g5aW9');
    });

    test('toUrlEncoded', () {
      expect([97, 97].toUrlEncoded(), 'aa');
      expect(utf8.encode('你好').toUrlEncoded(), '%E4%BD%A0%E5%A5%BD');
    });
  });
}
