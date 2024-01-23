import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_search/home/home.dart';
import 'package:github_search/l10n/l10n.dart';

class CommitListViewSuccess extends StatelessWidget {
  const CommitListViewSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final githubRepository = context.select(
      (GithubSearchBloc bloc) => bloc.state.githubRepository,
    );

    return Column(
      children: [
        Text(l10n.repositoryId(githubRepository?.id)),
        const SizedBox(height: 20),
        const Expanded(child: CommitList()),
      ],
    );
  }
}
