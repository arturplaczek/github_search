import 'package:api_client/api_client.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../samples/github_commit_data_sample.dart';

void main() {
  group('GithubCommitData', () {
    test('can be inistalized', () {
      expect(
        () => const GithubCommitData(
          sha: 'sha',
          commit: CommitData(),
        ),
        returnsNormally,
      );
    });

    test('supports value equality', () {
      final githubCommitData = GithubCommitData.fromJson(
        githubCommitDataSample,
      );
      final githubCommitData2 = GithubCommitData.fromJson(
        githubCommitDataSample,
      );

      expect(githubCommitData, equals(githubCommitData2));
      expect(githubCommitData, isNot(same(githubCommitData2)));
    });
  });
}
