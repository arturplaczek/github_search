import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_search/home/home.dart';

class CommitList extends StatelessWidget {
  const CommitList({super.key});

  @override
  Widget build(BuildContext context) {
    final githubCommits = context.select(
      (GithubSearchBloc bloc) => bloc.state.githubRepository?.commits ?? [],
    );

    return Padding(
      padding: const EdgeInsets.all(8),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: githubCommits.length,
        itemBuilder: (_, index) {
          return CommitListItem(
            githubCommit: githubCommits[index],
          );
        },
      ),
    );
  }
}
