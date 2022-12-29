import 'package:api_client/api_client.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AuthorData', () {
    test('can be inistalized', () {
      expect(() => const AuthorData(), returnsNormally);
    });

    test('supports value equality', () {
      final author = AuthorData.fromJson(json);
      final anotherAuthor = AuthorData.fromJson(json);

      expect(author, equals(anotherAuthor));
      expect(author, isNot(same(anotherAuthor)));
    });
  });
}

final json = <String, dynamic>{
  'name': 'name',
  'email': 'email',
  'date': 'date',
};
