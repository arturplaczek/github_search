import 'package:equatable/equatable.dart';
import 'package:github_repository/github_repository.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'github_search_event.dart';
part 'github_search_state.dart';

class GithubSearchBloc
    extends HydratedBloc<GithubSearchEvent, GithubSearchState> {
  GithubSearchBloc({
    required GithubRepository githubRepository,
  })  : _githubRepository = githubRepository,
        super(const GithubSearchState()) {
    on<GithubSearchEventSearch>(_onGithubSearchEventSearch);
    on<GithubSearchToggleCommit>(_onGithubSearchToggleCommit);
  }

  final GithubRepository _githubRepository;

  Future<void> _onGithubSearchEventSearch(
    GithubSearchEventSearch event,
    Emitter<GithubSearchState> emit,
  ) async {
    emit(state.copyWith(status: GithubSearchStatus.loading));

    if (state.cache.containsKey(event.repositoryName)) {
      emit(
        state.copyWith(
          githubRepository: state.cache[event.repositoryName],
          status: GithubSearchStatus.success,
        ),
      );
    }

    try {
      final githubRepository = await _githubRepository.getGithubRepository(
        event.repositoryName,
      );

      emit(
        state.copyWith(
          githubRepository: githubRepository,
          cache: {
            ...state.cache,
            event.repositoryName: githubRepository,
          },
          status: GithubSearchStatus.success,
        ),
      );
    } on Exception {
      emit(state.copyWith(status: GithubSearchStatus.failure));
    }
  }

  void _onGithubSearchToggleCommit(
    GithubSearchToggleCommit event,
    Emitter<GithubSearchState> emit,
  ) {
    if (state.githubRepository == null) {
      return;
    }

    final commits = state.githubRepository!.commits.map((commit) {
      if (commit.sha == event.sha) {
        return commit.copyWith(isSelected: !commit.isSelected);
      }

      return commit;
    }).toList();

    emit(
      state.copyWith(
        githubRepository: state.githubRepository!.copyWith(commits: commits),
      ),
    );
  }

  @override
  GithubSearchState? fromJson(Map<String, dynamic> json) =>
      GithubSearchState.fromJson(json);

  @override
  Map<String, dynamic>? toJson(GithubSearchState state) {
    return state.toJson();
  }
}
