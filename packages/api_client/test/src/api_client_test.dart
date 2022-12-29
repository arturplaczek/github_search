// ignore_for_file: prefer_const_constructors

import 'package:api_client/api_client.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

import 'samples/github_commit_data_sample.dart';
import 'samples/github_repository_data_sample.dart';

void main() {
  group('ApiClient', () {
    late Dio httpClient;
    late DioAdapter dioAdapter;
    late ApiClient apiClient;

    setUp(() {
      httpClient = Dio();
      dioAdapter = DioAdapter(dio: httpClient);
      apiClient = ApiClient(httpClient: httpClient);
    });

    test('can be instantiated', () {
      expect(ApiClient(), isNotNull);
    });

    group('getRepositoryData', () {
      test('returns GithubRepositoryData', () async {
        const repositoryName = 'test/test_repository';
        dioAdapter.onGet(
          ApiClient.getClientRepositoryLink(repositoryName),
          (server) => server.reply(
            200,
            githubRepositoryDataSample,
          ),
        );

        final result = await apiClient.getRepositoryData(repositoryName);

        expect(result, isA<GithubRepositoryData>());
      });

      test('throws AppException on dio error', () async {
        const repositoryName = 'test/test_repository';
        dioAdapter.onGet(
          ApiClient.getClientRepositoryLink(repositoryName),
          (server) => server.throws(
            404,
            DioError(requestOptions: RequestOptions(path: 'not-important')),
          ),
        );

        expect(
          () => apiClient.getRepositoryData(repositoryName),
          throwsA(isA<AppException>()),
        );
      });

      test('throws DeserializationException if json is invalid', () async {
        const repositoryName = 'test/test_repository';
        dioAdapter.onGet(
          ApiClient.getClientRepositoryLink(repositoryName),
          (server) => server.reply(200, {
            'data': <String, dynamic>{},
          }),
        );

        await expectLater(
          () => apiClient.getRepositoryData(repositoryName),
          throwsA(isA<DeserializationException>()),
        );
      });
    });

    group('getCommitsData', () {
      test('returns list of GithubCommitData', () async {
        const repositoryName = 'test/test_repository';
        dioAdapter.onGet(
          ApiClient.getClientCommitsLink(repositoryName),
          (server) => server.reply(
            200,
            [
              githubCommitDataSample,
            ],
          ),
        );

        final result = await apiClient.getCommitsData(repositoryName);

        expect(result, isA<List<GithubCommitData>>());
      });

      test('throws AppException on dio error', () async {
        const repositoryName = 'test/test_repository';
        dioAdapter.onGet(
          ApiClient.getClientCommitsLink(repositoryName),
          (server) => server.throws(
            404,
            DioError(requestOptions: RequestOptions(path: 'not-important')),
          ),
        );

        expect(
          () => apiClient.getCommitsData(repositoryName),
          throwsA(isA<AppException>()),
        );
      });

      test('throws DeserializationException if json is invalid', () async {
        const repositoryName = 'test/test_repository';
        dioAdapter.onGet(
          ApiClient.getClientCommitsLink(repositoryName),
          (server) => server.reply(
            200,
            [
              <String, dynamic>{},
            ],
          ),
        );

        await expectLater(
          () => apiClient.getCommitsData(repositoryName),
          throwsA(isA<DeserializationException>()),
        );
      });
    });
  });
}
