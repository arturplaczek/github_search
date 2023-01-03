import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:github_repository/github_repository.dart';
import 'package:github_search/home/home.dart';
import 'package:github_search/l10n/l10n.dart';
import 'package:intl/intl.dart';

void main() {
  final commit = GithubCommitModel(
    message: 'message',
    authorName: 'authorName',
    sha: 'sha',
    date: DateTime(2020),
  );

  group('CoomitWidget', () {
    testWidgets('renders correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          home: Scaffold(
            body: CommitWidget(
              commit: commit,
              onTap: () {},
            ),
          ),
        ),
      );
      expect(find.text('message'), findsOneWidget);
      expect(find.text('authorName'), findsOneWidget);
      expect(find.text('SHA: sha'), findsOneWidget);
      expect(
        find.text(
          DateFormat('dd/MM/yyyy hh:mm:ss').format(commit.date),
        ),
        findsOneWidget,
      );
    });

    testWidgets('calls onTap', (tester) async {
      var onTapCalled = false;

      await tester.pumpWidget(
        MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          home: Scaffold(
            body: CommitWidget(
              commit: commit,
              onTap: () {
                onTapCalled = true;
              },
            ),
          ),
        ),
      );

      await tester.tap(find.byType(CommitWidget));

      expect(onTapCalled, true);
    });
  });
}
