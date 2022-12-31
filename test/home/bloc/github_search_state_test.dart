// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:github_repository/github_repository.dart';
import 'package:github_search/home/home.dart';

void main() {
  group('GithubSearchState', () {
    test('can be instantiated', () {
      expect(GithubSearchState(), isNotNull);
    });

    test('supports value comparisons', () {
      expect(GithubSearchState(), equals(GithubSearchState()));
      expect(GithubSearchState(), isNot(same(GithubSearchState())));
    });

    test('support copyWith', () {
      final state = GithubSearchState().copyWith(
        status: GithubSearchStatus.success,
      );
      expect(state.status, GithubSearchStatus.success);
    });

    test('support same object when no properties are passed', () {
      expect(GithubSearchState().copyWith(), GithubSearchState());
    });

    test('can be converted to/from json', () {
      final githubCommitModel = GithubCommitModel(
        message: 'message',
        authorName: 'authorName',
        sha: 'sha',
        date: DateTime(2020),
      );
      final githubRepositoryModel = GithubRepositoryModel(
        id: -1,
        commits: <GithubCommitModel>[githubCommitModel],
      );

      final githubSearchState = GithubSearchState(
        repository: githubRepositoryModel,
        cache: <String, GithubRepositoryModel>{
          'repository-name': githubRepositoryModel,
        },
        status: GithubSearchStatus.success,
      );

      final json = githubSearchState.toJson();
      final githubSearchStateFromJson = GithubSearchState.fromJson(json!);

      expect(githubSearchStateFromJson, equals(githubSearchState));
    });
  });
}
