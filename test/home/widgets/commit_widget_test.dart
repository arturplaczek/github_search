import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:github_repository/github_repository.dart';
import 'package:github_search/home/home.dart';
import 'package:mocktail/mocktail.dart';

import '../../helpers.dart';

class _MockGithubSearchBloc
    extends MockBloc<GithubSearchEvent, GithubSearchState>
    implements GithubSearchBloc {}

void main() {
  final commit = GithubCommitModel(
    message: 'message',
    authorName: 'authorName',
    sha: 'sha',
    date: DateTime(2020),
  );

  group('CoomitWidget', () {
    testWidgets('renders correctly', (tester) async {
      await tester.pumpSubject(
        CommitWidget(sha: commit.sha),
      );

      expect(find.text('message'), findsOneWidget);
      expect(find.text('authorName'), findsOneWidget);
      expect(find.text('SHA: sha'), findsOneWidget);
      expect(find.text(commit.formattedDate), findsOneWidget);
    });

    testWidgets('calls onTap', (tester) async {
      final githubSearchBloc = _MockGithubSearchBloc();
      when(
        () => githubSearchBloc.state,
      ).thenReturn(
        GithubSearchState(
          repository: GithubRepositoryModel(
            id: -1,
            commits: <GithubCommitModel>[commit],
          ),
          cache: <String, GithubRepositoryModel>{
            'repository-name': GithubRepositoryModel(
              id: -1,
              commits: <GithubCommitModel>[commit],
            ),
          },
          status: GithubSearchStatus.success,
        ),
      );

      await tester.pumpSubject(
        CommitWidget(sha: commit.sha),
        githubSearchBloc: githubSearchBloc,
      );

      await tester.tap(find.text('message'));

      await tester.pumpAndSettle();

      verify(
        () => githubSearchBloc.add(GithubSearchToggleCommit(sha: commit.sha)),
      ).called(1);
    });
  });
}
