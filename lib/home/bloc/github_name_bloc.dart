import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:rxdart/rxdart.dart';

part 'github_name_event.dart';
part 'github_name_state.dart';

EventTransformer<Event> _debounce<Event>() {
  return (events, mapper) => events
      .debounceTime(const Duration(milliseconds: 300))
      .asyncExpand(mapper);
}

class GithubNameBloc extends HydratedBloc<GithubNameEvent, GithubNameState> {
  GithubNameBloc() : super(const GithubNameState()) {
    on<GithubNameChanged>(
      _onGithubNameChanged,
      transformer: _debounce(),
    );
    on<GithubNameSubmitted>(_onGithubNameSubmitted);
    on<GithubNameReset>(_onGithubNameReset);
  }

  Future<void> _onGithubNameChanged(
    GithubNameChanged event,
    Emitter<GithubNameState> emit,
  ) async {
    emit(
      state.copyWith(
        githubName: event.githubName,
        status: GithubNameStatus.initial,
      ),
    );
  }

  Future<void> _onGithubNameSubmitted(
    GithubNameSubmitted event,
    Emitter<GithubNameState> emit,
  ) async {
    final isGithubNameValid = validateGithubName(state.githubName);
    final lastGithubNames = Set<String>.from(state.lastGithubNames);
    if (isGithubNameValid) {
      lastGithubNames.add(state.githubName);
    }
    emit(
      state.copyWith(
        githubName: state.githubName,
        lastGithubNames: lastGithubNames,
        status: isGithubNameValid
            ? GithubNameStatus.success
            : GithubNameStatus.failure,
      ),
    );
  }

  // TODO(arturplaczek): find correct RegExp
  // and use instead of validateGithubName
  // RegExp githubNameRegExp = RegExp('/([w,-,_]+)/([w,-,_]+)/i');
  bool validateGithubName(String githubName) {
    if (githubName.isEmpty || !githubName.contains('/')) {
      return false;
    } else {
      final owner = githubName.split('/')[0];
      final repository = githubName.split('/')[1];
      return owner.isNotEmpty && repository.isNotEmpty;
    }
  }

  Future<void> _onGithubNameReset(
    GithubNameReset event,
    Emitter<GithubNameState> emit,
  ) async {
    emit(
      state.copyWith(
        githubName: '',
        status: GithubNameStatus.initial,
      ),
    );
  }

  @override
  GithubNameState? fromJson(Map<String, dynamic> json) =>
      GithubNameState.fromJson(json);

  @override
  Map<String, dynamic>? toJson(GithubNameState state) => state.toJson();
}
