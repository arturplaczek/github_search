import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:github_repository/github_repository.dart';
import 'package:github_search/home/home.dart';
import 'package:github_search/l10n/l10n.dart';
import 'package:mocktail/mocktail.dart';
import 'package:share_plus_platform_interface/method_channel/method_channel_share.dart';

import '../../helpers.dart';

class _MockGithubSearchBloc
    extends MockBloc<GithubSearchEvent, GithubSearchState>
    implements GithubSearchBloc {}

class _MockMethodChannel extends Mock implements MethodChannel {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late GithubSearchBloc bloc;
  // late SharePlatform sharePlatform;
  late _MockMethodChannel mockChannel;

  setUp(() {
    bloc = _MockGithubSearchBloc();
    // sharePlatform = SharePlatform();

    when(() => bloc.state).thenReturn(const GithubSearchState());
    when(() => bloc.stream).thenAnswer(
      (_) => Stream.value(const GithubSearchState()),
    );

    mockChannel = _MockMethodChannel();
    TestDefaultBinaryMessengerBinding.instance!.defaultBinaryMessenger
        .setMockMethodCallHandler(MethodChannelShare.channel, (call) async {
      await mockChannel.invokeMethod<void>(call.method, call.arguments);
      return Future(() => null);
    });
  });

  group('HomePage', () {
    testWidgets('renders HomeView', (tester) async {
      await tester.pumpSubject(
        const HomePage(),
      );

      expect(find.byType(HomeView), findsOneWidget);
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
        const HomeView(),
        githubSearchBloc: bloc,
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
        (tester) async {
      const state = GithubSearchState(
        status: GithubSearchStatus.loading,
      );
      when(() => bloc.state).thenReturn(state);
      when(() => bloc.stream).thenAnswer(
        (_) => Stream.value(state),
      );

      await tester.pumpSubject(
        const HomeViewBody(),
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
        const HomeViewBody(),
        githubSearchBloc: bloc,
      );

      await tester.pump();

      final l10n = tester.element(find.byType(Scaffold)).l10n;

      expect(find.text(l10n.errorText), findsOneWidget);
    });

    testWidgets('renders CommitList on success state', (tester) async {
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
        githubSearchBloc: bloc,
      );

      await tester.pump();

      expect(find.byType(CommitList), findsOneWidget);
      expect(find.byType(CommitWidget), findsOneWidget);
    });
  });

  group('ShareButton', () {
    testWidgets('renders SizedBox wihout selected commit', (tester) async {
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
        const ShareButton(),
        githubSearchBloc: bloc,
      );

      expect(find.byType(SizedBox), findsOneWidget);
      expect(find.byType(TextButton), findsNothing);
    });

    testWidgets('renders TextButton with selected commit', (tester) async {
      final state = GithubSearchState(
        repository: GithubRepositoryModel(
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

      expect(find.byType(TextButton), findsOneWidget);
      expect(find.byType(SizedBox), findsNothing);
    });

    testWidgets('share on preseed', (tester) async {
      final state = GithubSearchState(
        repository: GithubRepositoryModel(
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

      expect(find.byType(TextButton), findsOneWidget);

      await tester.tap(find.byType(TextButton));

      // TODO: fix this test
      // verify(() => sharePlatform.share(any())).called(1);
      // verify(
      //   () => mockChannel.invokeMethod<void>('share', <String, dynamic>{
      //     'text': state.getSelectedCommitsMessage(),
      //   }),
      // );
    });
  });
}
