import 'package:api_client/api_client.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:github_repository/github_repository.dart';

void main() {
  group('GithubRepositoryModel', () {
    final githubCommitModel = GithubCommitModel(
      message: 'message',
      authorName: 'authorName',
      sha: 'sha',
      date: DateTime(2020),
    );

    test('can be initialize', () {
      final model = GithubRepositoryModel(
        id: -1,
        commits: <GithubCommitModel>[githubCommitModel],
      );

      expect(model.id, equals(-1));
      expect(model.commits, isNotEmpty);
    });

    test('can be initialize from data', () {
      const data = GithubRepositoryData(
        id: -1,
      );
      final commitData = GithubCommitData(
        sha: 'sha',
        commit: CommitData(
          message: 'message',
          author: AuthorData(
            name: 'authorName',
            date: DateTime(2020),
          ),
        ),
      );
      final model = GithubRepositoryModel.fromData(
        data: data,
        commits: [commitData],
      );

      expect(model.id, data.id);
      expect(
        model.commits,
        equals([
          GithubCommitModel.fromData(commitData),
        ]),
      );
    });

    test('supports value comparison', () {
      final firstModel = GithubRepositoryModel(
        id: -1,
        commits: <GithubCommitModel>[githubCommitModel],
      );
      final secondModel = GithubRepositoryModel(
        id: -1,
        commits: <GithubCommitModel>[githubCommitModel],
      );

      expect(firstModel, equals(secondModel));
      expect(firstModel, isNot(same(secondModel)));
    });

    test('can be converted to/from Json', () {
      final githubRepositoryModel = GithubRepositoryModel(
        id: -1,
        commits: <GithubCommitModel>[githubCommitModel],
      );

      final json = githubRepositoryModel.toJson();
      final githubRepositoryModelFromJson =
          GithubRepositoryModel.fromJson(json);

      expect(githubRepositoryModelFromJson, equals(githubRepositoryModel));
    });

    test('support copyWith', () {
      final githubRepositoryModel = GithubRepositoryModel(
        id: -1,
        commits: <GithubCommitModel>[
          githubCommitModel,
        ],
      );

      final githubRepositoryModelCopy = githubRepositoryModel.copyWith();

      expect(githubRepositoryModel, equals(githubRepositoryModelCopy));
    });
  });
}
