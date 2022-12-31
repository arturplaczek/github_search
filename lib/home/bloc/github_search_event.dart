part of 'github_search_bloc.dart';

abstract class GithubSearchEvent extends Equatable {
  const GithubSearchEvent();
}

class GithubSearchEventSearch extends GithubSearchEvent {
  const GithubSearchEventSearch(this.repositoryName);

  final String repositoryName;

  @override
  List<Object> get props => [repositoryName];
}
