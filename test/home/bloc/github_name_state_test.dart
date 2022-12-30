// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:github_search/home/home.dart';

void main() {
  group('GithubNameState', () {
    test('can be instantiated', () {
      expect(GithubNameState(), isNotNull);
    });

    test('supports value comparisons', () {
      expect(GithubNameState(), equals(GithubNameState()));
      expect(GithubNameState(), isNot(same(GithubNameState())));
    });

    test('support copyWith', () {
      final state = GithubNameState().copyWith(
        status: GithubNameStatus.success,
      );
      expect(state.status, GithubNameStatus.success);
    });

    test('support same object when no properties are passed', () {
      expect(GithubNameState().copyWith(), GithubNameState());
    });

    test('can be converted toJson', () {
      final json = GithubNameState(
        githubName: 'owner/repository',
        lastGithubNames: const {'owner/repository'},
        status: GithubNameStatus.success,
      ).toJson();

      expect(json!['githubName'], 'owner/repository');
      expect(json['lastGithubNames'], 'owner/repository');
      expect(json['status'], 'success');
    });

    test('can be converted fromJson', () {
      final state = GithubNameState.fromJson(json);

      expect(state.githubName, 'owner/repository');
      expect(state.lastGithubNames, {'owner/repository'});
      expect(state.status, GithubNameStatus.success);
    });
  });
}

final json = {
  'githubName': 'owner/repository',
  'lastGithubNames': 'owner/repository',
  'status': 'success',
};
