import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_search/home/home.dart';

class CommitListView extends StatelessWidget {
  const CommitListView({super.key});

  @override
  Widget build(BuildContext context) {
    final status = context.select(
      (GithubSearchBloc bloc) => bloc.state.status,
    );

    return switch (status) {
      GithubSearchStatus.initial => const CommitListViewInitial(),
      GithubSearchStatus.loading => const CommitListViewLoading(),
      GithubSearchStatus.success => const CommitListViewSuccess(),
      GithubSearchStatus.failure => const CommitListViewFailure(),
    };
  }
}
