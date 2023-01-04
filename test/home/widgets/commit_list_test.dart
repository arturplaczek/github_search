import 'package:flutter_test/flutter_test.dart';
import 'package:github_repository/github_repository.dart';
import 'package:github_search/home/home.dart';

import '../../helpers.dart';

void main() {
  final commit = GithubCommitModel(
    message: 'message',
    authorName: 'authorName',
    sha: 'sha',
    date: DateTime(2020),
  );

  group('CommitList', () {
    testWidgets('renders correctly', (tester) async {
      await tester.pumpSubject(
        CommitList(
          commits: [
            commit,
          ],
        ),
      );
      expect(find.byType(CommitWidget), findsNWidgets(1));
    });
  });
}
