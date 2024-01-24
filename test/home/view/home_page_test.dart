import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:github_repository/github_repository.dart';
import 'package:github_search/home/home.dart';
import 'package:github_search/l10n/l10n.dart';
import 'package:mocktail/mocktail.dart';

import '../../helpers.dart';

//TODO(arturplaczek): rewrite tests for widgets instead of page
class _MockGithubSearchBloc
    extends MockBloc<GithubSearchEvent, GithubSearchState>
    implements GithubSearchBloc {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late GithubSearchBloc bloc;

  setUp(() {
    bloc = _MockGithubSearchBloc();

    when(() => bloc.state).thenReturn(const GithubSearchState());
    when(() => bloc.stream).thenAnswer(
      (_) => Stream.value(const GithubSearchState()),
    );
  });

  group('HomePage', () {
    testWidgets('renders HomePageView', (tester) async {
      await tester.pumpSubject(
        const HomePage(),
      );

      expect(find.byType(HomePageView), findsOneWidget);
    });
  });

  group('HomeView', () {
    testWidgets('renders GithubNameTextfield', (tester) async {
      await tester.pumpSubject(
        const HomePage(),
      );

      expect(find.byType(GithubNameTextfield), findsOneWidget);
    });

    testWidgets('calls onComplete on GithubNameTextfield', (tester) async {
      await tester.pumpSubject(
        const HomeBody(),
        githubSearchBloc: bloc,
      );

      const repositoryName = 'test/test';

      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextField), repositoryName);

      await tester.pumpAndSettle();

      await tester.tap(find.byType(GithubNameSubmitIcon));

      verify(() => bloc.add(const GithubSearchEventSearch(repositoryName)));
    });
  });

  group('HomeViewBody', () {
    testWidgets('renders CircularProgressIndicator on loading state',
        (tester) async {
      const state = GithubSearchState(
        status: GithubSearchStatus.loading,
      );
      when(() => bloc.state).thenReturn(state);
      when(() => bloc.stream).thenAnswer(
        (_) => Stream.value(state),
      );

      await tester.pumpSubject(
        const HomeBody(),
        githubSearchBloc: bloc,
      );

      await tester.pump(kThemeAnimationDuration);

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('renders error text on failure state', (tester) async {
      const state = GithubSearchState(
        status: GithubSearchStatus.failure,
      );
      when(() => bloc.state).thenReturn(state);
      when(() => bloc.stream).thenAnswer(
        (_) => Stream.value(state),
      );

      await tester.pumpSubject(
        const HomeBody(),
        githubSearchBloc: bloc,
      );

      await tester.pumpAndSettle();

      final l10n = tester.element(find.byType(CommitListViewFailure)).l10n;

      expect(find.text(l10n.errorText), findsOneWidget);
    });

    testWidgets('renders CommitList on success state', (tester) async {
      final state = GithubSearchState(
        githubRepository: GithubRepositoryModel(
          id: -1,
          commits: [
            GithubCommitModel(
              sha: 'sha',
              message: 'message',
              authorName: 'authorName',
              date: DateTime(2022),
            ),
          ],
        ),
        status: GithubSearchStatus.success,
      );
      when(() => bloc.state).thenReturn(state);
      when(() => bloc.stream).thenAnswer(
        (_) => Stream.value(state),
      );

      await tester.pumpSubject(
        const HomeBody(),
        githubSearchBloc: bloc,
      );

      await tester.pump();

      expect(find.byType(CommitList), findsOneWidget);
      expect(find.byType(CommitListItem), findsOneWidget);
    });
  });

  group('ShareButton', () {
    const shareButtonKey = Key('ShareButton_empty');
    testWidgets('renders SizedBox without selected commit', (tester) async {
      final state = GithubSearchState(
        githubRepository: GithubRepositoryModel(
          id: -1,
          commits: [
            GithubCommitModel(
              sha: 'sha',
              message: 'message',
              authorName: 'authorName',
              date: DateTime(2022),
            ),
          ],
        ),
        status: GithubSearchStatus.success,
      );
      when(() => bloc.state).thenReturn(state);
      when(() => bloc.stream).thenAnswer(
        (_) => Stream.value(state),
      );

      await tester.pumpSubject(
        const ShareButton(),
        githubSearchBloc: bloc,
      );

      expect(find.byKey(shareButtonKey), findsOneWidget);
      expect(find.byType(TextButton), findsNothing);
    });

    testWidgets('renders FloatingActionButton with selected commit',
        (tester) async {
      final state = GithubSearchState(
        githubRepository: GithubRepositoryModel(
          id: -1,
          commits: [
            GithubCommitModel(
              sha: 'sha',
              message: 'message',
              authorName: 'authorName',
              date: DateTime(2022),
              isSelected: true,
            ),
          ],
        ),
        status: GithubSearchStatus.success,
      );
      when(() => bloc.state).thenReturn(state);
      when(() => bloc.stream).thenAnswer(
        (_) => Stream.value(state),
      );

      await tester.pumpSubject(
        const ShareButton(),
        githubSearchBloc: bloc,
      );

      expect(find.byType(FloatingActionButton), findsOneWidget);
      expect(find.byKey(shareButtonKey), findsNothing);
    });

    testWidgets('share on pressed', (tester) async {
      final state = GithubSearchState(
        githubRepository: GithubRepositoryModel(
          id: -1,
          commits: [
            GithubCommitModel(
              sha: 'sha',
              message: 'message',
              authorName: 'authorName',
              date: DateTime(2022),
              isSelected: true,
            ),
          ],
        ),
        status: GithubSearchStatus.success,
      );
      when(() => bloc.state).thenReturn(state);
      when(() => bloc.stream).thenAnswer(
        (_) => Stream.value(state),
      );

      await tester.pumpSubject(
        const ShareButton(),
        githubSearchBloc: bloc,
      );

      expect(find.byType(FloatingActionButton), findsOneWidget);

      await tester.tap(find.byType(FloatingActionButton));
    });
  });
}
