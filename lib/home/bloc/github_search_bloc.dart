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
          repository: state.cache[event.repositoryName],
          status: GithubSearchStatus.success,
        ),
      );
    }

    try {
      final repository = await _githubRepository.getGithubRepository(
        event.repositoryName,
      );

      emit(
        state.copyWith(
          repository: repository,
          cache: {
            ...state.cache,
            event.repositoryName: repository,
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
    if (state.repository == null) {
      return;
    }

    final commits = state.repository!.commits.map((commit) {
      if (commit.sha == event.sha) {
        return commit.copyWith(isSelected: !commit.isSelected);
      }

      return commit;
    }).toList();

    emit(
      state.copyWith(
        repository: state.repository!.copyWith(commits: commits),
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
