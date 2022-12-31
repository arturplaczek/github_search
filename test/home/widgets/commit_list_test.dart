import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:github_repository/github_repository.dart';
import 'package:github_search/home/home.dart';
import 'package:github_search/l10n/l10n.dart';

void main() {
  final commit = GithubCommitModel(
    message: 'message',
    authorName: 'authorName',
    sha: 'sha',
    date: DateTime(2020),
  );

  group('CommitList', () {
    testWidgets('renders correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          home: Scaffold(
            body: CommitList(
              commits: [commit, commit],
            ),
          ),
        ),
      );
      expect(find.byType(CommitWidget), findsNWidgets(2));
    });
  });
}
