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

  bool validateGithubName(String githubName) =>
      RegExp(r'^(.+?)/(.+?)$').hasMatch(githubName);

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
