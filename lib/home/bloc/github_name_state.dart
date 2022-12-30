part of 'github_name_bloc.dart';

class GithubNameState extends Equatable {
  const GithubNameState({
    this.githubName = '',
    this.lastGithubNames = const {},
    this.status = GithubNameStatus.initial,
  });

  factory GithubNameState.fromJson(Map<String, dynamic> json) {
    return GithubNameState(
      githubName: json['githubName'] as String,
      lastGithubNames: (json['lastGithubNames'] as String).split('#').toSet(),
      status: GithubNameStatus.values.byName(json['status'] as String),
    );
  }

  final String githubName;
  final Set<String> lastGithubNames;
  final GithubNameStatus status;

  GithubNameState copyWith({
    String? githubName,
    Set<String>? lastGithubNames,
    GithubNameStatus? status,
  }) {
    return GithubNameState(
      githubName: githubName ?? this.githubName,
      lastGithubNames: lastGithubNames ?? this.lastGithubNames,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic>? toJson() {
    return {
      'githubName': githubName,
      'lastGithubNames': lastGithubNames.join('#'),
      'status': status.name,
    };
  }

  @override
  List<Object?> get props => [
        githubName,
        lastGithubNames,
        status,
      ];
}

enum GithubNameStatus {
  initial,
  success,
  failure,
}
