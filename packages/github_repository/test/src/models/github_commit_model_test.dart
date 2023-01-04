import 'package:api_client/api_client.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:github_repository/github_repository.dart';

void main() {
  group('GithubCommitModel', () {
    test('can be initialize', () {
      final model = GithubCommitModel(
        message: 'message',
        authorName: 'authorName',
        sha: 'sha',
        date: DateTime(2020),
      );

      expect(model.message, equals('message'));
      expect(model.authorName, equals('authorName'));
      expect(model.sha, equals('sha'));
      expect(model.date, equals(DateTime(2020)));
      expect(model.formattedDate, equals('01/01/2020 12:00:00'));
    });

    test('can be initialize from data', () {
      final data = GithubCommitData(
        sha: 'sha',
        commit: CommitData(
          message: 'message',
          author: AuthorData(
            name: 'authorName',
            date: DateTime(2020),
          ),
        ),
      );
      final model = GithubCommitModel.fromData(data);

      expect(model.sha, data.sha);
      expect(model.message, data.commit.message);
      expect(model.authorName, data.commit.author!.name);
      expect(model.date, data.commit.author!.date);
    });

    test('supports value comparison', () {
      final firstModel = GithubCommitModel(
        message: 'not-important',
        authorName: 'not-important',
        sha: 'not-important',
        date: DateTime(2020),
      );
      final secondModel = GithubCommitModel(
        message: 'not-important',
        authorName: 'not-important',
        sha: 'not-important',
        date: DateTime(2020),
      );

      expect(firstModel, equals(secondModel));
      expect(firstModel, isNot(same(secondModel)));
    });

    test('list of AuthorData is sorted by date', () {
      final firstModel = GithubCommitModel(
        message: 'not-important',
        authorName: 'not-important',
        sha: 'not-important',
        date: DateTime(2020, 2),
      );
      final secondModel = GithubCommitModel(
        message: 'not-important',
        authorName: 'not-important',
        sha: 'not-important',
        date: DateTime(2020),
      );
      final data = [
        firstModel,
        secondModel,
      ]..sort();

      expect(data.first, equals(secondModel));
    });

    test('can be converted to/from Json', () {
      final githubCommitModel = GithubCommitModel(
        message: 'not-important',
        authorName: 'not-important',
        sha: 'not-important',
        date: DateTime(2020, 2),
      );

      final json = githubCommitModel.toJson();
      final githubCommitModelFromJson = GithubCommitModel.fromJson(json);

      expect(githubCommitModelFromJson, equals(githubCommitModel));
    });

    test('support copyWith', () {
      final githubCommitModel = GithubCommitModel(
        message: 'not-important',
        authorName: 'not-important',
        sha: 'not-important',
        date: DateTime(2020, 2),
      );

      final githubCommitModelCopy = githubCommitModel.copyWith();

      expect(githubCommitModel, equals(githubCommitModelCopy));
    });
  });
}
