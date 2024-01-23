import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_repository/github_repository.dart';
import 'package:github_search/home/home.dart';

class CommitListItemCard extends StatelessWidget {
  const CommitListItemCard({
    super.key,
    required this.child,
    required this.githubCommit,
  });

  final Widget child;
  final GithubCommitModel githubCommit;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: ValueKey(githubCommit.sha),
      onTap: () {
        context
            .read<GithubSearchBloc>()
            .add(GithubSearchToggleCommit(sha: githubCommit.sha));
      },
      child: Card(
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: ColoredBox(
          color: githubCommit.isSelected ? Colors.blue : Colors.white,
          child: child,
        ),
      ),
    );
  }
}
