import 'package:api_client/api_client.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../samples/github_repository_data_sample.dart';

void main() {
  group('GithubRepositoryData', () {
    test('can be inistalized', () {
      expect(() => const GithubRepositoryData(), returnsNormally);
    });

    test('supports value equality', () {
      final githubRepositoryData = GithubRepositoryData.fromJson(
        githubRepositoryDataSample,
      );
      final githubRepositoryData2 = GithubRepositoryData.fromJson(
        githubRepositoryDataSample,
      );

      expect(githubRepositoryData, equals(githubRepositoryData2));
      expect(githubRepositoryData, isNot(same(githubRepositoryData2)));
    });
  });
}
