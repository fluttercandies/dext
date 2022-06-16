import 'package:test/test.dart';
import 'package:dext/dext.dart';

void main(List<String> args) {
  group('iterable test', () {
    final list = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

    test('sum', () {
      expect(list.sum(), 55);
    });
  });
}
