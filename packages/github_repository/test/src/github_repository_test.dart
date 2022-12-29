// ignore_for_file: prefer_const_constructors

import 'package:api_client/api_client.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:github_repository/github_repository.dart';
import 'package:mocktail/mocktail.dart';

class _MockApiClient extends Mock implements ApiClient {}

void main() {
  group('GithubRepository', () {
    late ApiClient apiClient;
    late GithubRepository githubRepository;

    setUp(() {
      apiClient = _MockApiClient();
      githubRepository = GithubRepository(apiClient: apiClient);
    });

    test('can be instantiated', () {
      expect(GithubRepository(apiClient: apiClient), isNotNull);
    });

    group('getGithubRepository', () {
      test('returns GithubRepositoryModel', () async {
        const repositoryName = 'test/test_repository';
        when(() => apiClient.getRepositoryData(repositoryName)).thenAnswer(
          (_) async => GithubRepositoryData(id: 0),
        );
        when(() => apiClient.getCommitsData(repositoryName)).thenAnswer(
          (_) async => [
            GithubCommitData(
              sha: 'sha',
              commit: CommitData(
                message: 'message',
                author: AuthorData(
                  name: 'authorName',
                  date: DateTime(2020),
                ),
              ),
            ),
          ],
        );

        final result = await githubRepository.getGithubRepository(
          repositoryName,
        );

        expect(result, isA<GithubRepositoryModel>());
      });

      test('throws GithubRepositoryException on dio error', () async {
        const repositoryName = 'test/test_repository';
        when(() => apiClient.getRepositoryData(repositoryName)).thenThrow(
          (_) async => AppException('error', StackTrace.empty),
        );

        expect(
          () => githubRepository.getGithubRepository(repositoryName),
          throwsA(isA<GithubRepositoryException>()),
        );
      });
    });
  });
}
