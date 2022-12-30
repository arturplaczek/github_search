// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:github_search/home/home.dart';

void main() {
  group('GithubNameEvent', () {
    group('GithubNameChanged', () {
      test('can be instantiated', () {
        expect(GithubNameChanged(''), isNotNull);
      });

      test('supports value comparisons', () {
        expect(GithubNameChanged('value'), equals(GithubNameChanged('value')));
        expect(
          GithubNameChanged('value'),
          isNot(same(GithubNameChanged('value'))),
        );
      });
    });

    group('GithubNameSubmitted', () {
      test('can be instantiated', () {
        expect(GithubNameSubmitted(), isNotNull);
      });

      test('supports value comparisons', () {
        expect(GithubNameSubmitted(), equals(GithubNameSubmitted()));
        expect(GithubNameSubmitted(), isNot(same(GithubNameSubmitted())));
      });
    });

    group('GithubNameReset', () {
      test('can be instantiated', () {
        expect(GithubNameSubmitted(), isNotNull);
      });
    });
  });
}
