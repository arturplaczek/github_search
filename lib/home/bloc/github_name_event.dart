part of 'github_name_bloc.dart';

abstract class GithubNameEvent extends Equatable {
  const GithubNameEvent();

  @override
  List<Object?> get props => [];
}

class GithubNameChanged extends GithubNameEvent {
  const GithubNameChanged(this.githubName);

  final String githubName;

  @override
  List<Object?> get props => [
        githubName,
      ];
}

class GithubNameSubmitted extends GithubNameEvent {
  const GithubNameSubmitted();
}

class GithubNameReset extends GithubNameEvent {
  const GithubNameReset();
}
