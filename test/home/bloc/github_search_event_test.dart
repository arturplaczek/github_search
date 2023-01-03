// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:github_search/home/home.dart';

void main() {
  group('GithubSearchEvent', () {
    group('GithubSearchEventSearch', () {
      test('can be instantiated', () {
        expect(GithubSearchEventSearch('not-important'), isNotNull);
      });

      test('supports value comparisons', () {
        expect(
          GithubSearchEventSearch('value'),
          equals(GithubSearchEventSearch('value')),
        );
        expect(
          GithubSearchEventSearch('value'),
          isNot(same(GithubSearchEventSearch('value'))),
        );
      });
    });

    group('GithubSearchToggleCommit', () {
      test('can be instantiated', () {
        expect(GithubSearchToggleCommit('not-important'), isNotNull);
      });

      test('supports value comparisons', () {
        expect(
          GithubSearchToggleCommit('sha'),
          equals(GithubSearchToggleCommit('sha')),
        );
        expect(
          GithubSearchToggleCommit('sha'),
          isNot(same(GithubSearchToggleCommit('sha'))),
        );
      });
    });
  });
}
