import 'package:api_client/api_client.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DateTimeConverter', () {
    test('converts DateTime to String', () {
      const converter = DateTimeConverter();
      final dateTime = DateTime.utc(1970);

      expect(converter.toJson(dateTime), equals('1970-01-01 00:00:00'));
    });

    test('converts String to DateTime', () {
      const converter = DateTimeConverter();
      final dateTime = DateTime.utc(1970);

      expect(converter.fromJson('1970-01-01T00:00:00Z'), equals(dateTime));
    });
  });
}
