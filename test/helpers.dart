import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:github_repository/github_repository.dart';
import 'package:github_search/home/home.dart';
import 'package:github_search/l10n/l10n.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:mocktail/mocktail.dart';

class _MockGithubNameBloc extends MockBloc<GithubNameEvent, GithubNameState>
    implements GithubNameBloc {}

class _MockGithubSearchBloc
    extends MockBloc<GithubSearchEvent, GithubSearchState>
    implements GithubSearchBloc {}

class _MockStorage extends Mock implements Storage {}

class _MockGithubRepository extends Mock implements GithubRepository {}

extension AppTester on WidgetTester {
  Future<void> pumpSubject(
    Widget widget, {
    GithubRepository? githubRepository,
    GithubNameBloc? githubNameBloc,
    GithubSearchBloc? githubSearchBloc,
  }) async {
    final storage = _MockStorage();
    when(
      () => storage.write(any(), any<dynamic>()),
    ).thenAnswer((_) async {});
    HydratedBloc.storage = storage;

    await pumpWidget(
      RepositoryProvider<GithubRepository>(
        create: (_) => githubRepository ?? _MockGithubRepository(),
        child: MultiBlocProvider(
          providers: [
            BlocProvider<GithubNameBloc>.value(
              value: githubNameBloc ?? _MockGithubNameBloc(),
            ),
            BlocProvider<GithubSearchBloc>(
              create: (context) => githubSearchBloc ?? _MockGithubSearchBloc(),
            ),
          ],
          child: MaterialApp(
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            home: Scaffold(
              body: widget,
            ),
          ),
        ),
      ),
    );
  }
}
