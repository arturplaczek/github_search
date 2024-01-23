part of 'github_search_bloc.dart';

class GithubSearchState extends Equatable {
  const GithubSearchState({
    this.githubRepository,
    this.cache = const {},
    this.status = GithubSearchStatus.initial,
  });

  factory GithubSearchState.fromJson(Map<String, dynamic> json) {
    return GithubSearchState(
      githubRepository: GithubRepositoryModel.fromJson(
        json['githubRepository'] as Map<String, dynamic>,
      ),
      cache: (json['cache'] as Map).map(
        (key, value) => MapEntry(
          key as String,
          GithubRepositoryModel.fromJson(value as Map<String, dynamic>),
        ),
      ),
      status: GithubSearchStatus.values.byName(json['status'] as String),
    );
  }

  final GithubRepositoryModel? githubRepository;
  final Map<String, GithubRepositoryModel> cache;
  final GithubSearchStatus status;

  @override
  List<Object?> get props => [
        githubRepository,
        cache,
        status,
      ];

  GithubSearchState copyWith({
    GithubRepositoryModel? githubRepository,
    Map<String, GithubRepositoryModel>? cache,
    GithubSearchStatus? status,
  }) {
    return GithubSearchState(
      githubRepository: githubRepository ?? this.githubRepository,
      cache: cache ?? this.cache,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic>? toJson() {
    return {
      'githubRepository': githubRepository?.toJson(),
      'cache': cache.map(
        (key, value) => MapEntry(key, value.toJson()),
      ),
      'status': status.name,
    };
  }

  String getSelectedCommitsMessage() {
    return (githubRepository?.commits ?? [])
        .where((commit) => commit.isSelected)
        .map(
          (commit) => '''
sha: ${commit.sha},
author: ${commit.authorName},
date: ${commit.formattedDate},
message: ${commit.message}''',
        )
        .join('\n');
  }
}

enum GithubSearchStatus { initial, loading, success, failure }
