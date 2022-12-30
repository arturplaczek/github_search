import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:github_search/home/home.dart';
import 'package:github_search/l10n/l10n.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:mocktail/mocktail.dart';

// TODO(arturplaczek): refactor this as a extension and remove duplicated code
class _MockStorage extends Mock implements Storage {}

void main() {
  late Storage storage;

  setUp(() {
    storage = _MockStorage();
    when(
      () => storage.write(any(), any<dynamic>()),
    ).thenAnswer((_) async {});
    HydratedBloc.storage = storage;
  });

  group('HomePage', () {
    testWidgets('renders HomeView', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          home: HomePage(),
        ),
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
      );

      const repositoryName = 'test/test';

      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextField), repositoryName);
      await tester.tap(find.byType(GithubNameSubmitIcon));

      await tester.pumpAndSettle();

      expect(find.text(repositoryName), findsNWidgets(2));
    });
  });
}

extension on WidgetTester {
  Future<void> pumpSubject(Widget widget) async {
    await pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        home: Scaffold(
          body: widget,
        ),
      ),
    );
  }
}
