import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:github_repository/github_repository.dart';
import 'package:github_search/home/home.dart';
import 'package:github_search/l10n/l10n.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:mocktail/mocktail.dart';

// TODO(arturplaczek): refactor this as a extension and remove duplicated code
class _MockStorage extends Mock implements Storage {}

class _MockGithubRepository extends Mock implements GithubRepository {}

class _MockGithubSearchBloc
    extends MockBloc<GithubSearchEvent, GithubSearchState>
    implements GithubSearchBloc {}

void main() {
  late Storage storage;
  late GithubSearchBloc bloc;

  setUp(() {
    storage = _MockStorage();
    when(
      () => storage.write(any(), any<dynamic>()),
    ).thenAnswer((_) async {});
    HydratedBloc.storage = storage;

    bloc = _MockGithubSearchBloc();
    when(() => bloc.state).thenReturn(const GithubSearchState());
    when(() => bloc.stream).thenAnswer(
      (_) => Stream.value(const GithubSearchState()),
    );
  });

  group('HomePage', () {
    testWidgets('renders HomeView', (WidgetTester tester) async {
      await tester.pumpSubject(
        const HomePage(),
      );

      expect(find.byType(HomeView), findsOneWidget);
    });
  });

  group('HomeView', () {
    testWidgets('renders GithubNameTextfield', (WidgetTester tester) async {
      await tester.pumpSubject(
        const HomePage(),
      );

      expect(find.byType(GithubNameTextfield), findsOneWidget);
    });

    testWidgets('calls onComplete on GithubNameTextfield', (tester) async {
      await tester.pumpSubject(
        const HomeView(),
        bloc: bloc,
      );

      const repositoryName = 'test/test';

      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextField), repositoryName);
      await tester.tap(find.byType(GithubNameSubmitIcon));

      await tester.pumpAndSettle();

      verify(() => bloc.add(const GithubSearchEventSearch(repositoryName)));
    });
  });

  group('HomeViewBody', () {
    testWidgets('renders CircularProgressIndicator on loading state',
        (WidgetTester tester) async {
      const state = GithubSearchState(
        status: GithubSearchStatus.loading,
      );
      when(() => bloc.state).thenReturn(state);
      when(() => bloc.stream).thenAnswer(
        (_) => Stream.value(state),
      );

      await tester.pumpSubject(
        const HomeViewBody(),
        bloc: bloc,
      );

      await tester.pump(kThemeAnimationDuration);

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('renders error text on failure state',
        (WidgetTester tester) async {
      const state = GithubSearchState(
        status: GithubSearchStatus.failure,
      );
      when(() => bloc.state).thenReturn(state);
      when(() => bloc.stream).thenAnswer(
        (_) => Stream.value(state),
      );

      await tester.pumpSubject(
        const HomeViewBody(),
        bloc: bloc,
      );

      await tester.pump();

      final l10n = tester.element(find.byType(Scaffold)).l10n;

      expect(find.text(l10n.errorText), findsOneWidget);
    });

    testWidgets('renders CommitList on success state',
        (WidgetTester tester) async {
      final state = GithubSearchState(
        repository: GithubRepositoryModel(
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
        const HomeViewBody(),
        bloc: bloc,
      );

      await tester.pump();

      expect(find.byType(CommitList), findsOneWidget);
      expect(find.byType(CommitWidget), findsOneWidget);
    });
  });
}

extension on WidgetTester {
  Future<void> pumpSubject(Widget widget, {GithubSearchBloc? bloc}) async {
    await pumpWidget(
      RepositoryProvider<GithubRepository>(
        create: (_) => _MockGithubRepository(),
        child: MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          home: Scaffold(
            body: BlocProvider<GithubSearchBloc>(
              create: (_) => bloc ?? _MockGithubSearchBloc(),
              child: widget,
            ),
          ),
        ),
      ),
    );
  }
}
