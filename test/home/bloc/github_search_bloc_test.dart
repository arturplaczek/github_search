// ignore_for_file: avoid_redundant_argument_values

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:github_repository/github_repository.dart';
import 'package:github_search/home/home.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:mocktail/mocktail.dart';

class _MockStorage extends Mock implements Storage {}

class _MockGithubRepository extends Mock implements GithubRepository {}

void main() {
  late Storage storage;
  late GithubRepository githubRepository;

  final githubCommitModel = GithubCommitModel(
    message: 'message',
    authorName: 'authorName',
    sha: 'sha',
    date: DateTime(2020),
  );
  final githubRepositoryModel = GithubRepositoryModel(
    id: -1,
    commits: <GithubCommitModel>[githubCommitModel],
  );

  final githubSearchState = GithubSearchState(
    repository: githubRepositoryModel,
    cache: <String, GithubRepositoryModel>{
      'repository-name': githubRepositoryModel,
    },
    status: GithubSearchStatus.success,
  );

  setUp(() {
    storage = _MockStorage();
    when(
      () => storage.write(any(), any<dynamic>()),
    ).thenAnswer((_) async {});
    HydratedBloc.storage = storage;

    githubRepository = _MockGithubRepository();
  });

  group('GithubSearchBloc', () {
    test('can be restored', () {
      when(
        () => storage.read(any()),
      ).thenReturn(
        githubSearchState.toJson(),
      );
      final bloc = GithubSearchBloc(githubRepository: githubRepository);

      expect(bloc.state, githubSearchState);
    });

    group('GithubSearchEventSearch', () {
      const repositoryName = 'repository-name';

      blocTest<GithubSearchBloc, GithubSearchState>(
        'adds repositoryName to cache and changes status to success',
        build: () => GithubSearchBloc(githubRepository: githubRepository),
        act: (bloc) {
          when(() => githubRepository.getGithubRepository(any()))
              .thenAnswer((_) async => githubRepositoryModel);

          bloc.add(const GithubSearchEventSearch(repositoryName));
        },
        expect: () => [
          const GithubSearchState(
            status: GithubSearchStatus.loading,
          ),
          GithubSearchState(
            repository: githubRepositoryModel,
            cache: {repositoryName: githubRepositoryModel},
            status: GithubSearchStatus.success,
          ),
        ],
      );

      final githubRepositoryModel2 = GithubRepositoryModel(
        id: -1,
        commits: <GithubCommitModel>[
          githubCommitModel,
          githubCommitModel,
        ],
      );

      blocTest<GithubSearchBloc, GithubSearchState>(
        'returns from cache and update repository in cache',
        build: () => GithubSearchBloc(githubRepository: githubRepository),
        seed: () => GithubSearchState(
          repository: githubRepositoryModel,
          cache: {repositoryName: githubRepositoryModel},
          status: GithubSearchStatus.success,
        ),
        act: (bloc) {
          when(() => githubRepository.getGithubRepository(any())).thenAnswer(
            (_) async => GithubRepositoryModel(
              id: -1,
              commits: <GithubCommitModel>[
                githubCommitModel,
                githubCommitModel
              ],
            ),
          );

          bloc.add(const GithubSearchEventSearch(repositoryName));
        },
        expect: () => [
          GithubSearchState(
            repository: githubRepositoryModel,
            cache: {repositoryName: githubRepositoryModel},
            status: GithubSearchStatus.loading,
          ),
          GithubSearchState(
            repository: githubRepositoryModel,
            cache: {repositoryName: githubRepositoryModel},
            status: GithubSearchStatus.success,
          ),
          GithubSearchState(
            repository: githubRepositoryModel2,
            cache: {repositoryName: githubRepositoryModel2},
            status: GithubSearchStatus.success,
          ),
        ],
      );

      blocTest<GithubSearchBloc, GithubSearchState>(
        'changes status to failure, is not adding repositoryName to cache when '
        'repository fails',
        build: () => GithubSearchBloc(githubRepository: githubRepository),
        act: (bloc) {
          when(() => githubRepository.getGithubRepository(any()))
              .thenThrow(Exception());

          bloc.add(const GithubSearchEventSearch(repositoryName));
        },
        expect: () => [
          const GithubSearchState(
            status: GithubSearchStatus.loading,
          ),
          const GithubSearchState(
            status: GithubSearchStatus.failure,
          ),
        ],
      );
    });
  });
}
