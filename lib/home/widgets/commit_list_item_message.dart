import 'package:flutter/material.dart';
import 'package:github_repository/github_repository.dart';

class CommitListItemMessage extends StatelessWidget {
  const CommitListItemMessage({
    super.key,
    required this.githubCommit,
  });

  final GithubCommitModel githubCommit;

  @override
  Widget build(BuildContext context) {
    final textTheme = githubCommit.isSelected
        ? const TextStyle(
            color: Colors.white,
            fontSize: 10,
          )
        : const TextStyle(fontSize: 10);

    return Text(
      githubCommit.message,
      style: textTheme.copyWith(
        fontSize: 14,
      ),
    );
  }
}
