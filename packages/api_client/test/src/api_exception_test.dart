// ignore_for_file: prefer_const_constructors

import 'package:api_client/api_client.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DeserializationException', () {
    test('can be inistalized', () {
      expect(
        () => const DeserializationException('test-error', StackTrace.empty),
        returnsNormally,
      );
    });

    test('supports value equality', () {
      final subject1 = DeserializationException('test-error', StackTrace.empty);
      final subject2 = DeserializationException('test-error', StackTrace.empty);

      expect(subject1, equals(subject2));
      expect(subject1, isNot(same(subject2)));
    });
  });
}
