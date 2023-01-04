part of 'github_search_bloc.dart';

class GithubSearchState extends Equatable {
  const GithubSearchState({
    this.repository,
    this.cache = const {},
    this.status = GithubSearchStatus.initial,
  });

  factory GithubSearchState.fromJson(Map<String, dynamic> json) {
    return GithubSearchState(
      repository: GithubRepositoryModel.fromJson(
        json['repository'] as Map<String, dynamic>,
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

  final GithubRepositoryModel? repository;
  final Map<String, GithubRepositoryModel> cache;
  final GithubSearchStatus status;

  @override
  List<Object?> get props => [
        repository,
        cache,
        status,
      ];

  GithubSearchState copyWith({
    GithubRepositoryModel? repository,
    Map<String, GithubRepositoryModel>? cache,
    GithubSearchStatus? status,
  }) {
    return GithubSearchState(
      repository: repository ?? this.repository,
      cache: cache ?? this.cache,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic>? toJson() {
    return {
      'repository': repository?.toJson(),
      'cache': cache.map(
        (key, value) => MapEntry(key, value.toJson()),
      ),
      'status': status.name,
    };
  }

  String getSelectedCommitsMessage() {
    return (repository?.commits ?? [])
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
