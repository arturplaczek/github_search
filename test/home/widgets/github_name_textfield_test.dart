import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:github_search/home/home.dart';
import 'package:github_search/l10n/l10n.dart';
import 'package:mocktail/mocktail.dart';
import '../../helpers.dart';

class _MockGithubNameBloc extends MockBloc<GithubNameEvent, GithubNameState>
    implements GithubNameBloc {}

void main() {
  late GithubNameBloc bloc;
  const state = GithubNameState();

  setUp(() {
    bloc = _MockGithubNameBloc();

    when(() => bloc.state).thenReturn(state);
    when(() => bloc.stream).thenAnswer(
      (_) => Stream.value(state),
    );
  });

  group('GithubNameTextfield', () {
    testWidgets('renders GithubNameTextfieldView', (tester) async {
      await tester.pumpSubject(
        MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          home: Scaffold(
            body: GithubNameTextfield(
              onComplete: (_) {},
            ),
          ),
        ),
      );
      expect(find.byType(GithubNameTextfieldView), findsOneWidget);
    });
  });

  group('GithubNameTextfieldView', () {
    testWidgets(
        'calls onComlete at success state and send GithubNameReset event',
        (tester) async {
      var isCalled = false;
      final successState = state.copyWith(
        status: GithubNameStatus.success,
      );
      when(() => bloc.state).thenReturn(successState);
      when(() => bloc.stream).thenAnswer(
        (_) => Stream.value(successState),
      );

      await tester.pumpSubject(
        GithubNameTextfieldView(
          onComplete: (_) {
            isCalled = true;
          },
        ),
        githubNameBloc: bloc,
      );

      await tester.pumpAndSettle();

      expect(isCalled, isTrue);

      verify(() => bloc.add(const GithubNameReset())).called(1);
    });
  });

  group('GithubNameEditText', () {
    testWidgets('calls GithubNameChanged on text changed', (tester) async {
      await tester.pumpSubject(
        const GithubNameEditText(),
        githubNameBloc: bloc,
      );

      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextField), 'test');
      verify(() => bloc.add(const GithubNameChanged('test'))).called(1);
    });

    testWidgets('calls GithubNameChanged on submit', (tester) async {
      await tester.pumpSubject(
        const GithubNameEditText(),
        githubNameBloc: bloc,
      );

      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextField), 'test');
      await tester.testTextInput.receiveAction(TextInputAction.done);

      verify(() => bloc.add(const GithubNameChanged('test'))).called(2);
    });

    testWidgets('calls GithubNameChanged on selected', (tester) async {
      when(() => bloc.state).thenReturn(
        state.copyWith(
          lastGithubNames: {
            'test/test1',
            'test/test2',
          },
        ),
      );
      await tester.pumpSubject(
        const GithubNameEditText(),
        githubNameBloc: bloc,
      );

      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextField), 'test');

      await tester.pumpAndSettle();

      await tester.tap(find.text('test/test1'));

      verify(() => bloc.add(const GithubNameChanged('test/test1'))).called(1);
    });
  });

  group('GithubNameSubmitIcon', () {
    testWidgets('calls GithubNameSubmitted onPressed', (tester) async {
      await tester.pumpSubject(
        const GithubNameSubmitIcon(),
        githubNameBloc: bloc,
      );

      await tester.pumpAndSettle();
      await tester.tap(find.byType(IconButton));

      verify(() => bloc.add(const GithubNameSubmitted())).called(1);
    });
  });

  group('GithubNameErrorText', () {
    testWidgets('renders error on failure', (tester) async {
      const state = GithubNameState(status: GithubNameStatus.failure);
      when(() => bloc.state).thenReturn(state);

      await tester.pumpSubject(
        const GithubNameErrorText(),
        githubNameBloc: bloc,
      );

      final l10n = tester.element(find.byType(Scaffold)).l10n;

      expect(find.text(l10n.githubNameErrorText), findsOneWidget);
    });

    testWidgets('renders SizedBox on other state', (tester) async {
      const state = GithubNameState(status: GithubNameStatus.success);
      when(() => bloc.state).thenReturn(state);

      await tester.pumpSubject(
        const GithubNameErrorText(),
        githubNameBloc: bloc,
      );

      expect(find.byType(SizedBox), findsOneWidget);
    });
  });
}
